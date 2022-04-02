import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Chatbot extends StatefulWidget {
  const Chatbot({Key? key}) : super(key: key);

  @override
  State<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(child: Text("SWA Chatbot")),
      ),
      url:
          "https://console.dialogflow.com/api-client/demo/embedded/2460ef2b-37ac-42bb-b9a4-f4e300bb6eda",
    );
  }
}
