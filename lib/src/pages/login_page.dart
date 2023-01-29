import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myanimelist/src/pages/home_page.dart';
import 'package:myanimelist/src/services/oauth_service.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginPage extends StatefulWidget {
  static const String route = "/login";

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            if (url.contains("code=")) {
              OAuthService.getToken(url).then((value) {
                if (value) {
                  context.go(HomePage.route);
                }
              });
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(OAuthService.getAuthorizationUrl()));
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }
}
