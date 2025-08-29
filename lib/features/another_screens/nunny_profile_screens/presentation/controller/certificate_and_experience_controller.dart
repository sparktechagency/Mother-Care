import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mother_care/features/another_screens/nani_repository/nani_repository.dart';
import 'package:mother_care/features/another_screens/nunny_profile_screens/data/preference_model.dart';
import 'package:flutter/material.dart';

class CertificateAndExperienceController extends GetxController {
  // Original data from API (what's actually saved on backend)
  List<String> originalCertificateList = [];
  List<WorkExperience> originalWorkExperienceList = [];
  int originalExperience = 1;

  // Current working data (local changes, what user sees)
  List<String> certificateList = [];
  List<WorkExperience> workExperienceList = [];

  // Track changes for API (these will be sent to backend on save)
  List<String> certificatesToAdd = [];
  List<String> certificatesToRemove = [];
  Map<String, String> certificatesToEdit = {}; // oldValue -> newValue

  List<WorkExperience> workExperiencesToAdd = [];
  List<String> workExperienceToRemove = [];
  Map<String, WorkExperience> workExperienceToEdit = {}; // id -> updatedWorkExp

  // Text Controllers for forms
  TextEditingController addCertificateAndExperienceController = TextEditingController();
  TextEditingController editCertificateController = TextEditingController();
  TextEditingController experienceController = TextEditingController(text: "1");

  // Work experience add controllers
  TextEditingController positionController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  // Work experience edit controllers
  TextEditingController editPositionController = TextEditingController();
  TextEditingController editCompanyController = TextEditingController();
  TextEditingController editStartDateController = TextEditingController();
  TextEditingController editEndDateController = TextEditingController();
  TextEditingController editLocationController = TextEditingController();

  int experience = 1;
  bool isLoading = false;
  bool isSaveLoading=false;

  @override
  void onInit() {
    super.onInit();
    loadInitialDataFromAPI();
  }

  /// Load data when screen first opens
  loadInitialDataFromAPI() async {
    try {
      isLoading = true;
      update();

      var response = await getCertificationExperience();

      if (response != null) {
        NannyCertificationExperienceData nannyData = response;

        // Store original data (what's on backend)
        originalCertificateList = List<String>.from(nannyData.certifications ?? []);
        originalWorkExperienceList = List<WorkExperience>.from(
          nannyData.workExperience ?? [],
        );
        originalExperience = nannyData.totalExperienceInYears ?? 1;

        // Initialize working data (what user sees)
        certificateList = List<String>.from(originalCertificateList);
        workExperienceList = List<WorkExperience>.from(originalWorkExperienceList);
        experience = originalExperience;
        experienceController.text = experience.toString();

        print('Data loaded successfully');
        print('Certificates: ${certificateList.length}');
        print('Work Experiences: ${workExperienceList.length}');
      } else {
        print('No data received from API, using empty lists');
        // Initialize with empty data if API returns null
        resetToEmptyState();
      }

      isLoading = false;
      update();
    } catch (e) {
      print('Error loading data: $e');
      isLoading = false;
      update();

      // Initialize with empty data on error
      resetToEmptyState();
      Get.snackbar("Info", 'Using local data. Save to sync with server.');
    }
  }

  /// Reset to empty state when no data available
  resetToEmptyState() {
    originalCertificateList = [];
    originalWorkExperienceList = [];
    originalExperience = 1;
    certificateList = [];
    workExperienceList = [];
    experience = 1;
    experienceController.text = "1";
  }

  /// Add new certificate locally (not saved to API yet)
  addCertificateLocally() {
    if (addCertificateAndExperienceController.text.trim().isNotEmpty) {
      String newCertificate = addCertificateAndExperienceController.text.trim();

      // Check if certificate already exists
      if (!certificateList.contains(newCertificate)) {
        certificateList.add(newCertificate);
        certificatesToAdd.add(newCertificate);
        addCertificateAndExperienceController.clear();
        update();
        print('Certificate added locally: $newCertificate');
      } else {
        Get.snackbar("Warning", "Certificate already exists");
      }
    }
  }

  /// Edit certificate locally (not saved to API yet)
  editCertificateLocally(int index, String oldValue) {
    String newValue = editCertificateController.text.trim();

    if (newValue.isNotEmpty && newValue != oldValue) {
      // Update the list that user sees
      certificateList[index] = newValue;

      // Track this change for API
      if (originalCertificateList.contains(oldValue)) {
        // This was originally from backend, mark for edit
        certificatesToEdit[oldValue] = newValue;
        // Remove from add list if it was there before
        certificatesToAdd.remove(oldValue);
        print('Certificate marked for edit: $oldValue -> $newValue');
      } else {
        // This was newly added, just update in add list
        int addIndex = certificatesToAdd.indexOf(oldValue);
        if (addIndex != -1) {
          certificatesToAdd[addIndex] = newValue;
          print('New certificate updated: $oldValue -> $newValue');
        }
      }

      editCertificateController.clear();
      Get.back();
      update();
    }
  }

  /// Remove certificate locally (not saved to API yet)
  removeCertificateLocally(int index) {
    String certificateToRemove = certificateList[index];

    // Remove from what user sees
    certificateList.removeAt(index);

    // Track this change for API
    if (originalCertificateList.contains(certificateToRemove)) {
      // This was originally from backend, mark for removal
      certificatesToRemove.add(certificateToRemove);
      // Remove from edit list if it was there
      certificatesToEdit.remove(certificateToRemove);
      print('Original certificate marked for removal: $certificateToRemove');
    } else {
      // This was newly added, just remove from add list
      certificatesToAdd.remove(certificateToRemove);
      print('New certificate removed: $certificateToRemove');
    }

    update();
  }

  /// Increase years of experience
  addExperience() {
    experience++;
    experienceController.text = experience.toString();
    update();
  }

  /// Decrease years of experience
  minusExperience() {
    if (experience > 1) {
      experience--;
      experienceController.text = experience.toString();
      update();
    }
  }

  /// Add work experience locally (not saved to API yet)
  addWorkExperienceLocally() {
    if (areWorkExperienceFieldsValid()) {
      // Create temporary ID for local tracking
      String tempId = 'temp_${DateTime.now().millisecondsSinceEpoch}';

      WorkExperience newExperience = WorkExperience(
        position: positionController.text.trim(),
        company: companyController.text.trim(),
        location: locationController.text.trim(),
        startDate: startDateController.text.trim(),
        endDate: endDateController.text.trim(),
        isCurrentWorking: false,
        id: tempId,
      );

      // Add to what user sees
      workExperienceList.add(newExperience);
      workExperiencesToAdd.add(newExperience);

      clearWorkExperienceControllers();
      Get.back();
      update();

      print('Work experience added locally: ${newExperience.position}');
    } else {
      Get.snackbar("Warning", "Please fill all required fields");
    }
  }

  /// Edit work experience locally (not saved to API yet)
  editWorkExperienceLocally(int index) {
    if (areEditWorkExperienceFieldsValid()) {
      WorkExperience currentExperience = workExperienceList[index];

      WorkExperience updatedExperience = WorkExperience(
        position: editPositionController.text.trim(),
        company: editCompanyController.text.trim(),
        location: editLocationController.text.trim(),
        startDate: editStartDateController.text.trim(),
        endDate: editEndDateController.text.trim(),
        isCurrentWorking: currentExperience.isCurrentWorking,
        id: currentExperience.id,
      );

      // Update what user sees
      workExperienceList[index] = updatedExperience;

      // Track this change for API
      if (originalWorkExperienceList.any((exp) => exp.id == currentExperience.id)) {
        // This was originally from backend, mark for edit
        workExperienceToEdit[currentExperience.id!] = updatedExperience;
        print('Work experience marked for edit: ${updatedExperience.position}');
      } else {
        // This was newly added, update in add list
        int addIndex = workExperiencesToAdd.indexWhere(
          (exp) => exp.id == currentExperience.id,
        );
        if (addIndex != -1) {
          workExperiencesToAdd[addIndex] = updatedExperience;
          print('New work experience updated: ${updatedExperience.position}');
        }
      }

      clearEditWorkExperienceControllers();
      Get.back();
      update();
    } else {
      Get.snackbar("Warning", "Please fill all required fields");
    }
  }

  /// Remove work experience locally (not saved to API yet)
  removeWorkExperienceLocally(int index) {
    WorkExperience experienceToRemove = workExperienceList[index];

    // Remove from what user sees
    workExperienceList.removeAt(index);

    // Track this change for API
    if (originalWorkExperienceList.any((exp) => exp.id == experienceToRemove.id)) {
      // This was originally from backend, mark for removal
      workExperienceToRemove.add(experienceToRemove.id!);
      // Remove from edit list if it was there
      workExperienceToEdit.remove(experienceToRemove.id);
      print(
        'Original work experience marked for removal: ${experienceToRemove.position}',
      );
    } else {
      // This was newly added, just remove from add list
      workExperiencesToAdd.removeWhere((exp) => exp.id == experienceToRemove.id);
      print('New work experience removed: ${experienceToRemove.position}');
    }

    update();
  }

  /// Prepare work experience data for editing
  prepareWorkExperienceForEdit(WorkExperience workExp) {
    editPositionController.text = workExp.position ?? '';
    editCompanyController.text = workExp.company ?? '';
    editLocationController.text = workExp.location ?? '';
    editStartDateController.text = workExp.startDate ?? '';
    editEndDateController.text = workExp.endDate ?? '';
  }

  /// Validation helpers
  bool areWorkExperienceFieldsValid() {
    return positionController.text.trim().isNotEmpty &&
        companyController.text.trim().isNotEmpty &&
        locationController.text.trim().isNotEmpty &&
        startDateController.text.trim().isNotEmpty &&
        endDateController.text.trim().isNotEmpty;
  }

  bool areEditWorkExperienceFieldsValid() {
    return editPositionController.text.trim().isNotEmpty &&
        editCompanyController.text.trim().isNotEmpty &&
        editLocationController.text.trim().isNotEmpty &&
        editStartDateController.text.trim().isNotEmpty &&
        editEndDateController.text.trim().isNotEmpty;
  }

  /// Clear form controllers
  clearWorkExperienceControllers() {
    positionController.clear();
    companyController.clear();
    locationController.clear();
    startDateController.clear();
    endDateController.clear();
  }

  clearEditWorkExperienceControllers() {
    editPositionController.clear();
    editCompanyController.clear();
    editLocationController.clear();
    editStartDateController.clear();
    editEndDateController.clear();
  }

  /// Main save method - sends all changes to API
  saveAllChangesToAPI() async {
    try {
      isSaveLoading = true;
      update();

      // Build API request body
      Map<String, dynamic> apiBody = {};

      // Always include experience years if changed
      if (experience != originalExperience) {
        apiBody["totalExperienceInYears"] = experience;
      }

      // Handle certificate changes
      if (hasCertificateChanges()) {
        Map<String, dynamic> certificationsBody = {};

        if (certificatesToAdd.isNotEmpty) {
          certificationsBody["add"] = certificatesToAdd;
        }

        if (certificatesToRemove.isNotEmpty) {
          certificationsBody["remove"] = certificatesToRemove;
        }

        if (certificatesToEdit.isNotEmpty) {
          certificationsBody["edit"] = certificatesToEdit;
        }

        apiBody["certifications"] = certificationsBody;
      }

      // Handle work experience changes
      if (hasWorkExperienceChanges()) {
        Map<String, dynamic> workExperienceBody = {};

        if (workExperiencesToAdd.isNotEmpty) {
          workExperienceBody["add"] = workExperiencesToAdd
              .map(
                (exp) => {
                  "position": exp.position,
                  "company": exp.company,
                  "location": exp.location,
                  "startDate": exp.startDate,
                  "endDate": exp.endDate,
                  "isCurrentWorking": exp.isCurrentWorking ?? false,
                },
              )
              .toList();
        }

        if (workExperienceToRemove.isNotEmpty) {
          workExperienceBody["remove"] = workExperienceToRemove;
        }

        if (workExperienceToEdit.isNotEmpty) {
          Map<String, dynamic> editBody = {};
          workExperienceToEdit.forEach((id, exp) {
            editBody[id] = {
              "position": exp.position,
              "company": exp.company,
              "location": exp.location,
              "startDate": exp.startDate,
              "endDate": exp.endDate,
              "isCurrentWorking": exp.isCurrentWorking ?? false,
            };
          });
          workExperienceBody["edit"] = editBody;
        }

        apiBody["workExperience"] = workExperienceBody;
      }

      print('Sending to API: $apiBody');

      // Send to API
      var response = await postCertificationExperience(apiBody);

      if (response != null) {
        // Clear all tracking lists since changes are now saved
        clearAllTrackingLists();

        // Reload fresh data from API
        await loadInitialDataFromAPI();

        Get.snackbar(
          "Success",
          "All changes saved successfully!",
          backgroundColor: Colors.green.withOpacity(0.8),
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );

        print('Successfully saved to API');
      } else {
        throw Exception('API returned null response');
      }
    } catch (e) {
      print('Error saving to API: $e');
      Get.snackbar(
        "Error",
        "Failed to save changes. Please try again.",
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isSaveLoading = false;
      update();
    }
  }

  /// Helper methods for change detection
  bool hasCertificateChanges() {
    return certificatesToAdd.isNotEmpty ||
        certificatesToRemove.isNotEmpty ||
        certificatesToEdit.isNotEmpty;
  }

  bool hasWorkExperienceChanges() {
    return workExperiencesToAdd.isNotEmpty ||
        workExperienceToRemove.isNotEmpty ||
        workExperienceToEdit.isNotEmpty;
  }

  bool hasExperienceYearChanges() {
    return experience != originalExperience;
  }

  /// Check if there are any unsaved changes
  bool hasUnsavedChanges() {
    return hasCertificateChanges() ||
        hasWorkExperienceChanges() ||
        hasExperienceYearChanges();
  }

  /// Clear all change tracking lists
  clearAllTrackingLists() {
    certificatesToAdd.clear();
    certificatesToRemove.clear();
    certificatesToEdit.clear();
    workExperiencesToAdd.clear();
    workExperienceToRemove.clear();
    workExperienceToEdit.clear();
  }

  /// Get count of total changes for UI
  int getTotalChangesCount() {
    return certificatesToAdd.length +
        certificatesToRemove.length +
        certificatesToEdit.length +
        workExperiencesToAdd.length +
        workExperienceToRemove.length +
        workExperienceToEdit.length +
        (hasExperienceYearChanges() ? 1 : 0);
  }

  @override
  void onClose() {
    // Dispose controllers to prevent memory leaks
    addCertificateAndExperienceController.dispose();
    editCertificateController.dispose();
    experienceController.dispose();
    positionController.dispose();
    companyController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    locationController.dispose();
    editPositionController.dispose();
    editCompanyController.dispose();
    editStartDateController.dispose();
    editEndDateController.dispose();
    editLocationController.dispose();
    super.onClose();
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:mother_care/features/another_screens/nani_repository/nani_repository.dart';
// import 'package:mother_care/features/another_screens/nunny_profile_screens/data/preference_model.dart';

// class CertificateAndExperienceController extends GetxController {
//   List certificateList = [];

//   TextEditingController addCertificateAndExperienceController = TextEditingController(
//     text: "1",
//   );
//   TextEditingController experienceController = TextEditingController();
//   TextEditingController positionController = TextEditingController();
//   TextEditingController companyController = TextEditingController();
//   TextEditingController startDateController = TextEditingController();
//   TextEditingController endDateController = TextEditingController();
//   TextEditingController locationController = TextEditingController();

//   List workExperienceList = [];

//   int experience = 1;

//   getCertificate() async {
//     if (addCertificateAndExperienceController.text.isNotEmpty) {
//       Map<String, dynamic> body = {
//         "certifications": {
//           "add": [addCertificateAndExperienceController.text],
//         },
//       };
//       var response = await postCertificationExperience(body);
//       if (response != null) {
//         print('POST Working *****************************************');
//         try {
//           NannyCertificationExperienceData nannyData = await getCertificationExperience();
//           certificateList = nannyData.certifications!;
//         } catch (e) {
//           Get.snackbar("Error", 'Data not fetched');
//         }
//       }
//       // certificateList.add(addCertificateAndExperienceController.text);
//       // addCertificateAndExperienceController.clear();
//     }
//     update();
//   }

//   addExperience() {
//     experience++;
//     experienceController.text = experience.toString();

//     update();
//   }

//   minasExperience() {
//     if (experience > 1) experience--;
//     experienceController.text = experience.toString();
//     update();
//   }

//   removeCertificate(int index) {
//     certificateList.removeAt(index);
//     update();
//   }

//   addWorkExperience(
//     List experienceList,
//     position,
//     company,
//     location,
//     startDate,
//     endDate,
//   ) {
//     experienceList.add({
//       "position": position,
//       "company": company,
//       "location": location,
//       "startDate": startDate,
//       "endDate": endDate,
//     });

//     update();
//     positionController.clear();
//     companyController.clear();
//     locationController.clear();
//     startDateController.clear();
//     endDateController.clear();
//     Get.back();
//   }

//   removeWorkExperience(int index) {
//     workExperienceList.removeAt(index);
//     update();
//   }
// }
