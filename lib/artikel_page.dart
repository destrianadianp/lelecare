import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArtikelPage extends StatelessWidget {
  final String urlToPage;

  const ArtikelPage({
    super.key,
    required this.urlToPage,
  });

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()..loadRequest(Uri.parse(urlToPage));
    return Scaffold(
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
