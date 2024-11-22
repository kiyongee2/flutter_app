import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget{

  WebViewController webViewController = WebViewController()

  ..loadRequest(Uri.parse("https://codingon.co.kr/"))

  ..setJavaScriptMode(JavaScriptMode.unrestricted);

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Coding On'),
        centerTitle: true,

      //   AppBar에 액션 버튼을 추가할 수 있는 매개변수
        actions: [
          IconButton(
              onPressed: (){
                webViewController.loadRequest(Uri.parse("https://codingon.co.kr/"));
              },
              icon: Icon(
                Icons.home,
              )
          )
        ],
      ),
      body: WebViewWidget(
          controller: webViewController,
      ),
    );
  }
}