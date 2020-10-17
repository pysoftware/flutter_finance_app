import 'package:finance_app/SingletonProvider.dart';
import 'package:finance_app/end_drawer.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() {
  runApp(MyApp());
}

extension ColorExtension on String {
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

class MyApp extends StatefulWidget {
  @override
  App createState() {
    return new App();
  }
}

class App extends State<MyApp> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  void dispose() {
    flutterWebviewPlugin.dispose();
    super.dispose();
  }

  var _webViewController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        endDrawer: EndDrawer(_webViewController),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0),
          child: AppBar(
            title: Text(''),
            backgroundColor: '#343A40'.toColor(),
          ),
        ),
        body: WebView(
          onWebViewCreated: (WebViewController controller) {
            var singleton = new Singleton(controller);
            _webViewController = controller;
          },
          initialUrl: 'https://pysoftware.github.io/finance-app/',
          javascriptMode: JavascriptMode.unrestricted,
        ),
        // body: MainPageWebView(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _webViewController
                .evaluateJavascript('window.setIsShowingAddCostsModal()');
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }
}
