import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:iconly/iconly.dart';
import 'package:nutriapp/Services/ScreenSizes.dart';
import '../../../Models/ChatMessage.dart';
import '../../../Themes/colors.dart';
import '../../../Widgets/messages/components/chat_input_field.dart';
import '../../../Widgets/messages/components/message.dart';

class Nutribot extends StatefulWidget {
  const Nutribot({super.key});

  @override
  State<Nutribot> createState() => _NutribotState();
}

class _NutribotState extends State<Nutribot> {
  String? message;
  final ScrollController _scrollController = ScrollController();
  late final GenerativeModel _model;
  late final ChatSession _chatSession;
  final messageController = TextEditingController();
  bool sending = false;

  _scrollToEnd() async {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  @override
  void initState() {
    // TODO: implement initState
    _model =
        GenerativeModel(model: 'gemini-pro-vision', apiKey: dotenv.env['GEMINI_KEY']!);
    _chatSession = _model.startChat();
  }

  Future<void> _sendChatMessage(String message) async {
    setState(() {
      sending = true;
    });

    try {
      final response = await _chatSession.sendMessage(
        Content.text(message),
      );
      print(response.text);
      final text = response.text;

      if (text == null) {
        _showError("No response from API");
        return;
      } else {
        setState(() {
          sending = false;
        });
      }
    } catch (e) {
      _showError(e.toString());
      setState(() {
        sending = false;
      });
    } finally {
      messageController.clear();
      setState(() {
        sending = false;
      });
    }
  }

  void _showError(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Something went wrong, Try Again later"),
            content: SingleChildScrollView(
              child: SelectableText(message),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Ok"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: Drawer(
        width: SizeConfig.screenWidth * .6,
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topRight: Radius.circular(16))),
        child: Column(
          children: [
            SafeArea(
                child: Text(
              'Chat History',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
            SizedBox(
              height: MediaQuery.of(context).size.height * .3,
              child: ListView.builder(
                itemCount: 3,
                  itemBuilder: (context, i) => ListTile(
                        title: Text('Chat $i'),
                        subtitle: Text(
                          'Chat Description',
                          style: TextStyle(fontSize: 12),
                        ),
                      )),
            )
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "NutriBot",
          style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 24,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView.builder(
                controller: _scrollController,
                itemCount: _chatSession.history.length,
                itemBuilder: (context, index) {
                  final Content content = _chatSession.history.toList()[index];
                  final text = content.parts
                      .whereType<TextPart>()
                      .map<String>((e) => e.text)
                      .join('');
                  return Message(
                      message: ChatMessage(
                    text: text,
                    messageType: ChatMessageType.text,
                    messageStatus: MessageStatus.viewed,
                    isSender: content.role == 'user',
                  ));
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20.0 / 2,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 32,
                  color: AppColors.primaryColor.withOpacity(0.08),
                ),
              ],
            ),
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0 * 0.75,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.primaryColor)),
                      child: Row(
                        children: [
                          const SizedBox(width: 20.0 / 4),
                          Expanded(
                            child: TextField(
                              controller: messageController,
                              decoration: InputDecoration(
                                hintText: "Type message",
                                border: InputBorder.none,
                              ),
                              onSubmitted: !sending
                                  ? (value) async {
                                      if (messageController.text.isNotEmpty) {
                                        _sendChatMessage(
                                            messageController.text);
                                      }
                                    }
                                  : (value) {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20.0 / 2),
                  GestureDetector(
                      onTap: !sending
                          ? () async {
                              if (messageController.text.isNotEmpty) {
                                _sendChatMessage(messageController.text);
                              }
                            }
                          : () {},
                      child: sending
                          ? Container(
                              height: 45,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                              ))
                          : Container(
                              height: 45,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                  child: Icon(IconlyBold.send,
                                      color: Colors.white))))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
