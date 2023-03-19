import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

class ArticleDetail extends StatefulWidget {

  ArticleDetail({Key? key,required this.title,required this.url}) : super(key: key);

  String title,url;

  @override
  State<ArticleDetail> createState() => _ArticleDetailState(this.title,this.url);
}

class _ArticleDetailState extends State<ArticleDetail> {


  late final WebViewController controller;

  double height = 0;

  _ArticleDetailState(this.title, this.url);

  String title,url;

  @override
  void initState() {
    super.initState();
    print("接收到的url$url");
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Theme.of(context).primaryColor,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text(this.title,textDirection: TextDirection.rtl,)),
        body: WebViewWidget(controller: controller),
      ),
    );
  }
}
