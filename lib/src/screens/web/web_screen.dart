import 'package:hackernews/src/src.dart';

class WebScreen extends StatefulWidget {
  final String url;
  const WebScreen({Key? key, required this.url}) : super(key: key);

  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  WebViewController? controller;
  bool isLoading = true;
  int currentProgress = 0;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
            setState(() {
              currentProgress = progress;
            });
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Builder(builder: (context) {
        if (isLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.grey,
              value: currentProgress.toDouble(),
            ),
          );
        }
        return WebViewWidget(controller: controller!);
      })),
    );
  }
}
