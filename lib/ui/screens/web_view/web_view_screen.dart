import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  static const routeName = "webview";
  @override
  Widget build(BuildContext context) {
    var link = ModalRoute.of(context)?.settings.arguments as String;
    WebViewController controller = WebViewController()
      ..loadRequest(Uri.parse(link));
    return Scaffold(
      appBar: AppBar(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
              bottomRight:Radius.circular(20) ,bottomLeft: Radius.circular(20))),
          title:  Text("Web View"),
          centerTitle: true,
        ),
      body: WebViewWidget(controller: controller),
    );
  }
}
