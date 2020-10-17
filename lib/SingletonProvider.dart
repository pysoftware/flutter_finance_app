import 'package:webview_flutter/webview_flutter.dart';

class Singleton {
  WebViewController webViewController;

  static final Singleton _singleton = new Singleton._internal();

  static Singleton get instance => _singleton;

  factory Singleton(WebViewController webViewController) {
    _singleton.webViewController = webViewController;
    return _singleton;
  }

  Singleton._internal();
}
