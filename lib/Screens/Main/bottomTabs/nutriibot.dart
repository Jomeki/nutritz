import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../Models/ChatMessage.dart';
import '../../../Widgets/messages/components/chat_input_field.dart';
import '../../../Widgets/messages/components/message.dart';



class Nutribot extends StatefulWidget {
  const Nutribot({super.key});

  @override
  State<Nutribot> createState() => _NutribotState();
}

class _NutribotState extends State<Nutribot> {

  final ScrollController _scrollController = ScrollController();

  _scrollToEnd() async {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView.builder(
                controller: _scrollController,
                itemCount: demoChatMessages.length,
                itemBuilder: (context, index) =>
                    Message(message: demoChatMessages[index]),
              ),
            ),
          ),
          const ChatInputField(),
        ],
      ),
    );
  }
}
