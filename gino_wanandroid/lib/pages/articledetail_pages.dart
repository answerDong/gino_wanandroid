import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';


class ArticleDetail extends StatefulWidget {

  ArticleDetail({Key? key,required this.title,required this.url}) : super(key: key);

  // final PlatformWebViewController _controller = PlatformWebViewController(
  //     PlatformWebViewControllerCreationParams(),
  //     );

  String url,title;

  @override
  State<ArticleDetail> createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  final _controller = PlatformWebViewController(
    const PlatformWebViewControllerCreationParams(),
  )..loadRequest(
    LoadRequestParams(
      uri: Uri.parse('https://flutter.dev'),
    ),
  );
  //
  // _controller.;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Simple Example'),
          actions: <Widget>[
          _SampleMenu(_controller),
      ],),
      body: PlatformWebViewWidget(
        PlatformWebViewWidgetCreationParams(controller: _controller),
      ).build(context),
    );
  }
}

enum _MenuOptions {
  doPostRequest,
}

class _SampleMenu extends StatelessWidget {
  const _SampleMenu(this.controller);

  final PlatformWebViewController controller;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<_MenuOptions>(
      onSelected: (_MenuOptions value) {
        switch (value) {
          case _MenuOptions.doPostRequest:
            _onDoPostRequest(controller);
            break;
        }
      },
      itemBuilder: (BuildContext context) =>
      <PopupMenuItem<_MenuOptions>>[
        const PopupMenuItem<_MenuOptions>(
          value: _MenuOptions.doPostRequest,
          child: Text('Post Request'),
        ),
      ],
    );
  }

  Future<void> _onDoPostRequest(PlatformWebViewController controller) async {
    final LoadRequestParams params = LoadRequestParams(
      uri: Uri.parse('https://www.baidu.com'),
      method: LoadRequestMethod.get,
      headers: const <String, String>{
        'foo': 'bar',
        'Content-Type': 'text/plain'
      },
      // body: Uint8List.fromList('Test Body'.codeUnits),
    );
    await controller.loadRequest(params);
  }
}

// class ArticleDetail extends StatelessWidget {
//
//   String url,title = "";
//
//   ArticleDetail({Key? key,required this.title,required this.url}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }



// class ArticleDetail extends StatelessWidget {
//   String url, title;
//
//   ArticleDetail({Key? key, required this.title, required this.url})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//     // late final PlatformWebViewControllerCreationParams params;
//     // if (WebViewPlatform.instance is WebKitWebViewPlatform) {
//     //   params = WebKitWebViewControllerCreationParams(
//     //     allowsInlineMediaPlayback: true,
//     //     mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
//     //   );
//     // } else {
//     //   params = const PlatformWebViewControllerCreationParams();
//     // }
//     //
//     // final WebViewController controller =
//     // WebViewController.fromPlatformCreationParams(params);
//
//     final WebViewController controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setBackgroundColor(const Color(0x00000000))
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onProgress: (int progress) {
//             // Update loading bar.
//           },
//           onPageStarted: (String url) {},
//           onPageFinished: (String url) {},
//           onWebResourceError: (WebResourceError error) {},
//           onNavigationRequest: (NavigationRequest request) {
//             if (request.url.startsWith('https://www.youtube.com/')) {
//               return NavigationDecision.prevent;
//             }
//             return NavigationDecision.navigate;
//           },
//         ),
//       )
//       ..loadRequest(Uri.parse(url));
//
//     return MaterialApp(
//       theme: ThemeData(
//         primaryColor: Theme.of(context).primaryColor,
//       ),
//       home:  Scaffold(
//         appBar: AppBar(title: const Text('Flutter Simple Example')),
//         body: WebViewWidget(controller: controller),
//       ),
//     );
//   }
// }
