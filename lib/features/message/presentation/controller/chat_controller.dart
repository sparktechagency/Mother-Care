import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mother_care/config/api/api_end_point.dart';
import 'package:mother_care/features/message/presentation/model/chat_list_model.dart';
import 'package:mother_care/services/api/api_service.dart';
import 'package:mother_care/utils/app_utils.dart';
import '../../data/model/chat_list_model.dart';
import '../../../../services/socket/socket_service.dart';
import '../../../../services/storage/storage_services.dart';
import '../../../../utils/enum/enum.dart';

class ChatController extends GetxController {
  //////////////////////////////// Ajay Logic Start
  TextEditingController searchController = TextEditingController();
  RxBool isLoading = false.obs;
  List<ChatListModel> chatList = <ChatListModel>[];
  // Get Chat List Api Call Function
  Future<void> getChatListFunction() async {
    try {
      isLoading.value = true;
      var response = await ApiService.get(
        "${ApiEndPoint.chatUrl}?searchTerm=${searchController.text.trim()}",
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        chatList.clear();
        for (var element in response.data["data"]["chats"]) {
          chatList.add(ChatListModel.fromJson(element));
        }
      }
    } catch (e) {
      Utils.errorSnackBar("Error", "Error From Get Nanny List $e");
    } finally {
      isLoading.value = false;
    }
  }

  //////////////////////////////// Ajay Logic End
  /// Api status check here
  Status status = Status.completed;

  // /// Chat more Data Loading Bar
  // bool isMoreLoading = false;

  // /// page no here
  // int page = 1;

  /// Chat List here
  List chats = [
    // ChatModel(
    //   id: "",
    //   participant: Participant(
    //     id: "",
    //     fullName: "Chironjit Roy",
    //     image:
    //         "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg",
    //   ),
    //   latestMessage: LatestMessage(
    //     id: "",
    //     message: "How are you?",
    //     createdAt: DateTime.now(),
    //   ),
    // ), ChatModel(
    //   id: "",
    //   participant: Participant(
    //     id: "",
    //     fullName: "Chironjit Roy",
    //     image:
    //         "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg",
    //   ),
    //   latestMessage: LatestMessage(
    //     id: "",
    //     message: "How are you?",
    //     createdAt: DateTime.now(),
    //   ),
    // ), ChatModel(
    //   id: "",
    //   participant: Participant(
    //     id: "",
    //     fullName: "Chironjit Roy",
    //     image:
    //         "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg",
    //   ),
    //   latestMessage: LatestMessage(
    //     id: "",
    //     message: "How are you?",
    //     createdAt: DateTime.now(),
    //   ),
    // ),
  ];

  /// Chat Scroll Controller
  ScrollController scrollController = ScrollController();

  /// Chat Controller Instance create here
  static ChatController get instance => Get.put(ChatController());

  // /// Chat More data Loading function
  // Future<void> moreChats() async {
  //   if (scrollController.position.pixels ==
  //       scrollController.position.maxScrollExtent) {
  //     isMoreLoading = true;
  //     update();
  //     await getChatRepo();
  //     isMoreLoading = false;
  //     update();
  //   }
  // }

  /// Chat data Loading function
  Future<void> getChatRepo() async {
    // return;
    // if (page == 1) {
    //   status = Status.loading;
    //   update();
    // }

    // var response = await ApiService.get("${ApiEndPoint.chats}?page=$page");

    // if (response.statusCode == 200) {
    //   var data = response.data['chats'] ?? [];

    //   for (var item in data) {
    //     chats.add(ChatModel.fromJson(item));
    //   }

    //   // page = page + 1;
    //   status = Status.completed;
    //   update();
    // } else {
    //   Utils.errorSnackBar(response.statusCode.toString(), response.message);
    //   status = Status.error;
    //   update();
    // }
  }

  /// Chat data Update  Socket listener
  listenChat() async {
    SocketServices.on("update-chatlist::${LocalStorage.userId}", (data) {
      // page = 1;
      chats.clear();

      for (var item in data) {
        chats.add(ChatModel.fromJson(item));
      }

      status = Status.completed;
      update();
    });
  }

  /// Controller on Init¬
  @override
  void onInit() {
      // listenChat();
    // getChatRepo();
    getChatListFunction();
    super.onInit();
  }
}
