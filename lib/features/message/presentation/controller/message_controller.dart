import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mother_care/features/message/presentation/model/chat_list_model.dart';
import 'package:mother_care/features/message/presentation/model/message_get_model.dart';
import 'package:mother_care/services/socket/socket_service.dart';
import 'package:mother_care/utils/log/app_log.dart';
import 'package:mother_care/utils/log/error_log.dart';
import '../../../../services/api/api_service.dart';
import '../../../../config/api/api_end_point.dart';

class MessageController extends GetxController {
  RxList<MessageGetModel> listOfMessageData = <MessageGetModel>[].obs;
  RxInt selectedIndex = 0.obs;

  RxBool isOpenServicesList = false.obs;
  RxBool isLoadingService = false.obs;
  RxBool isJobCategoryCheck = RxBool(false);
  RxString selectedServicesID = "".obs;
  RxString selectedServicesCategory = "Select Service".obs;

  //// Socket
  // late io.Socket socket;
  RxBool isLoading = false.obs;

  RxBool isLoadingUploadImage = false.obs;
  RxBool isSendingMessage = false.obs;
  late RxBool initDate = false.obs;
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  // TextEditingController dateTextController = TextEditingController();
  TextEditingController chatController = TextEditingController();
  ScrollController scrollController = ScrollController();
  RxString userType = "".obs;
  RxString userScreen = "".obs;
  FocusNode focusNode = FocusNode();
  //Image Picker
  final ImagePicker picker = ImagePicker();
  RxBool isOnTextFeild = false.obs;
  RxBool focuse = false.obs;
  //////////////////////////////////// Pagination part
  RxInt paginationCount = 1.obs;
  RxBool hasMore = true.obs;
  RxBool isLoadingMore = false.obs;
  RxBool isLast = false.obs;

  //////////////////////////////////// Message List
  Future<void> initialDataLoadFunction() async {
    focusNode = FocusNode();
    scrollController = ScrollController();
    // dateTextController = TextEditingController();
    chatController = TextEditingController();
    getArguments();
    listenMessage();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   getUserScreen();
    // });
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent &&
          !isLoadingMore.value &&
          hasMore.value) {
        addNewMessageItems();
      }
    });
    // appSocketConnect();
    await getMessageList();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        focuse.value = true;
      } else {
        focuse.value = false;
      }
    });
  }

  listenMessage() async {
    SocketServices.on("newMessage::${argItem.participants?[0].id}", (data) {
      appLog("Value of Sockt :- ${data}");

      MessageGetModel response = MessageGetModel.fromJson(data);

      listOfMessageData.insert(0, response); // Add at the start of the list
      listOfMessageData.refresh();
      update();
    });
  }

  @override
  void onInit() {
    initialDataLoadFunction();
    super.onInit();
  }

  onAppClose() {
    try {
      chatController.dispose();
      scrollController.dispose();
      focusNode.dispose();
      // dateTextController.dispose();
    } catch (e) {
      errorLog(e);
    }
  }

  @override
  void dispose() {
    onAppClose();
    super.dispose();
  }

  //////////////////////////////////// Fetch Initial Messages
  Future<void> getMessageList() async {
    try {
      isLoading.value = true;
      var response = await ApiService.get(
        "${ApiEndPoint.messageUrl}${argItem.id}?page=${paginationCount.value}&limit=10",
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        if (response.data["data"]["messages"] as List != []) {
          // listOfMessageData.clear();
          for (var element in response.data["data"]["messages"]) {
            listOfMessageData.add(MessageGetModel.fromJson(element));
          }
          paginationCount.value += 1;
        } else {
          hasMore.value = false;
        }
      }

      // var data = await ProfessionalRepository().getChatMessageListData(
      //   chatId: argItem.chatId,
      //   page: paginationCount.value,
      // );

      // if (data.isNotEmpty) {
      //   listOfMessageData.value = data;
      //   paginationCount.value += 1;
      // } else {
      //   // No more data, set hasMore to false
      //   hasMore.value = false;
      // }
    } catch (e) {
      log("Error in getMessageList: $e");
    } finally {
      isLoading.value = false;
    }
  }

  //////////////////////////////////// Load More Messages
  Future<void> addNewMessageItems() async {
    if (isLoadingMore.value || !hasMore.value) return;

    try {
      isLoadingMore.value = true;
      var response = await ApiService.get(
        "${ApiEndPoint.messageUrl}${argItem.id}?page=${paginationCount.value}&limit=20",
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        if (response.data["data"]["messages"] as List != []) {
          // listOfMessageData.clear();
          for (var element in response.data["data"]["messages"]) {
            listOfMessageData.add(MessageGetModel.fromJson(element));
          }
          paginationCount.value += 1;
        } else {
          hasMore.value = false;
        }
      }

      // var data = await ProfessionalRepository().getChatMessageListData(
      //   chatId: argItem.chatId,
      //   page: paginationCount.value,
      // );

      // if (data.isNotEmpty) {
      //   listOfMessageData.addAll(data);
      //   paginationCount.value += 1;
      // } else {
      //   hasMore.value = false;
      // }
    } catch (e) {
      log("Error in addNewMessageItems: $e");
    } finally {
      isLoadingMore.value = false;
    }
  }

  Future<void> onlyTextSend() async {
    try {
      if (chatController.text != "") {
        isSendingMessage.value = true;
        Map<String, String> dataBody = {"text": chatController.text};
        Map<String, String> body = {"data": json.encode(dataBody)};

        // Api Call
        var response = await ApiService.multipart(
          "${ApiEndPoint.sendMessageUrl}${argItem.id}",
          body: body,

          // url: "${AppApiUrl.sendMessage}${argItem.chatId}",
        );
        if (response.statusCode == 200) {
          // listOfMessageData.insert(
          //   listOfMessageData.length,
          //   MessageGetModel.fromJson(response.data["data"]),
          // );
          // listOfMessageData.insert(
          //   // listOfMessageData.length,
          //   0,
          //   MessageGetModel.fromJson(response.data["data"]),
          // );
          listOfMessageData.refresh();
          update();
        }
      }
    } catch (e) {
      appLog("Error From Send Text Message Function $e");
    } finally {
      // update();
      chatController.text = "";
      isSendingMessage.value = false;
    }
  }

  Future<void> sendMessage() async {
    try {
      // isSendingMessage.value = true;
      await onlyTextSend();
    } catch (e) {
      appLog(" Demo Error $e");
    } finally {
      // isSendingMessage.value = false;
    }
  }

  // void appSocketConnect() {
  //   try {
  //     socket = io.io(
  //       AppConst.soketUrl,
  //       io.OptionBuilder()
  //           .setTransports(['websocket'])
  //           .setReconnectionAttempts(3)
  //           .build(),
  //     );
  //     socket.connect();
  //     socket.onConnect((_) {
  //       log('Connected to the socket server');
  //     });
  //     socket.onDisconnect(
  //       (data) {
  //         log("socket on disconnect $data");
  //       },
  //     );
  //     socket.onConnectError(
  //       (data) {
  //         log("socket on connection error $data");
  //       },
  //     );
  //     socket.onError(
  //       (data) {
  //         log("socket on error $data");
  //       },
  //     );
  //     socket.onPing(
  //       (data) {
  //         log("socket on ping $data");
  //       },
  //     );
  //     socket.on(
  //       "getMessage::${argItem.chatId}",
  //       (data) {
  //         try {
  //           appLog(" This is Receiver ID :$data");
  //           final message = MessageGetModel.fromJson(data);
  //           // Emit Function
  //           emitFunctionTocallAsad(data["receiverId"]);
  //           listOfMessageData.insert(
  //               0, message); // Add at the start of the list
  //           listOfMessageData.refresh();
  //         } catch (e) {
  //           log("Error parsing message: $e");
  //         }
  //       },
  //     );
  //   } catch (e) {
  //     log("error form socket connect : $e");
  //   }
  // }

  // void emitFunctionTocallAsad(message) {
  //   Map<String, dynamic> body = {
  //     "chatId": argItem.chatId,
  //     "data": message,
  //   };
  //   appLog("emit Function To call Asad: $message");
  //   appLog("emit Function Tocall Asad: ${message["_id"]}");
  //   // Asad Say...
  //   socket.emit('readingMessage', body);
  // }

  ChatListModel argItem = ChatListModel();

  // Get arguments and get value Randomly
  void getArguments() {
    if (Get.arguments.runtimeType != Null) {
      argItem = Get.arguments;
    }
  }

  outSideClick() {
    FocusManager.instance.primaryFocus?.unfocus();
    isOnTextFeild.value = false;
    focuse.value = false;
  }

  // getUserScreen() {
  //   if (Get.arguments != Null) {
  //     var argItem = Get.arguments;
  //     userScreen.value = argItem.toString();
  //   }
  // }

  void sendImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    try {
      if (pickedFile != null) {
        isLoadingUploadImage.value = true;

        // Api Call
        var response = await ApiService.multipart(
          "${ApiEndPoint.sendMessageUrl}${argItem.id}",
          imageName: "images",
          imagePath: pickedFile.path,
        );
        if (response.statusCode == 200) {
          // listOfMessageData.insert(
          //   listOfMessageData.length,
          //   MessageGetModel.fromJson(response.data["data"]),
          // );
          // listOfMessageData.insert(
          //   // listOfMessageData.length,
          //   0,
          //   MessageGetModel.fromJson(response.data["data"]),
          // );
          listOfMessageData.refresh();
          update();
        }

        appLog(" ✅ Body Value ${pickedFile.path}");
        // Api Call
        // var data = await ImageRepository().imageUploadWithData2(
        //   body: body,
        //   imagePath: pickedFile.path,
        //   url: "${AppApiUrl.sendMessage}${argItem.chatId}",
        // );
        // if (data != null) {
        //   AppSnackBar.success("Success");
        // }
      }
    } catch (e) {
      log("$e");
    } finally {
      isLoadingUploadImage.value = false;
    }
  }
}

//   bool isLoading = false;
//   bool isMoreLoading = false;
//   String? video;

//   List messages = [
//     // ChatMessageModel(time: DateTime.now(), text: "I am fine", image: "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg", isMe: false),
//     // ChatMessageModel(time: DateTime.now(), text: "How are you", image: "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg", isMe: true),
//   ];

//   String chatId = "";
//   String name = "";

//   int page = 1;
//   int currentIndex = 0;
//   Status status = Status.completed;

//   bool isMessage = false;
//   bool isInputField = false;

//   ScrollController scrollController = ScrollController();
//   TextEditingController messageController = TextEditingController();

//   static MessageController get instance => Get.put(MessageController());

//   MessageModel messageModel = MessageModel.fromJson({});

//   Future<void> getMessageRepo() async {
//     // return;
//     if (page == 1) {
//       messages.clear();
//       status = Status.loading;
//       update();
//     }

//     var response = await ApiService.get(
//       "${ApiEndPoint.messages}$chatId",
//       // "${ApiEndPoint.messages}?chatId=$chatId&page=$page&limit=15",

//     );

//     if (response.statusCode == 200) {
//       var data = response.data['data']['messages'];

//       for (var messageData in data) {
//         messageModel = MessageModel.fromJson(messageData);

//         messages.add(
//           ChatMessageModel(
//             time: messageModel.createdAt.toLocal(),
//             text: messageModel.message,
//             image: messageModel.sender.image,
//             isNotice: messageModel.type == "notice" ? true : false,
//             isMe: LocalStorage.userId == messageModel.sender.id ? true : false,
//           ),
//         );
//       }
//       log(" ✅ ✅ ✅ Value Of List ${messages.length}");

//       page = page + 1;
//       status = Status.completed;
//       update();
//     } else {
//       Utils.errorSnackBar(response.statusCode.toString(), response.message);
//       status = Status.error;
//       update();
//     }
//   }

//   addNewMessage() async {
//     isMessage = true;
//     update();

//     messages.insert(
//       0,
//       ChatMessageModel(
//         time: DateTime.now(),
//         text: messageController.text,
//         image: LocalStorage.myImage,
//         isMe: true,
//       ),

//       // ChatMessageModel(
//       //     currentTime.format(context).toString(),
//       //     controller.messageController.text,
//       //     true),
//     );

//     isMessage = false;
//     update();

//     var body = {
//       "chat": chatId,
//       "message": messageController.text,
//       "sender": LocalStorage.userId,
//     };

//     messageController.clear();

//     SocketServices.emitWithAck("add-new-message", body, (data) {
//       if (kDebugMode) {
//         print(
//           "===============================================================> Received acknowledgment: $data",
//         );
//       }
//     });
//   }

//   listenMessage(String chatId) async {
//     SocketServices.on('new-message::$chatId', (data) {
//       status = Status.loading;
//       update();

//       var time = data['createdAt'].toLocal();
//       messages.insert(
//         0,
//         ChatMessageModel(
//           isNotice: data['messageType'] == "notice" ? true : false,
//           time: time,
//           text: data['message'],
//           image: data['sender']['image'],
//           isMe: false,
//         ),
//       );

//       status = Status.completed;
//       update();
//     });
//   }

//   void isEmoji(int index) {
//     currentIndex = index;
//     isInputField = isInputField;
//     update();
//   }
// }
