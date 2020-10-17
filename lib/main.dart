import 'package:finance_app/web_view.dart';
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
    // flutterWebviewPlugin.evalJavascript(
    //     "const ab = document.querySelector(\"#navbar > div > button.btn.btn-info.mt-2.mr-2\"); p.click();");
  }

  @override
  void dispose() {
    flutterWebviewPlugin.dispose();
    super.dispose();
  }

  var test;

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
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0),
          child: AppBar(
            title: Text(''),
            backgroundColor: '#343A40'.toColor(),
          ),
        ),
        body: WebView(
          onPageFinished: (String url) {
            // should be called when page finishes loading
            print(url);
          },
          onWebViewCreated: (WebViewController controller) {
            test = controller;
          },
          javascriptChannels: {
            JavascriptChannel(
                name: 'TEST',
                onMessageReceived: (JavascriptMessage message) {
                  print("ahaha" + message.message);
                })
          },
          initialUrl: 'https://pysoftware.github.io/finance-app/',
          javascriptMode: JavascriptMode.unrestricted,
        ),
        // body: MainPageWebView(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            test.evaluateJavascript('window.setIsShowingAddCostsModal()');
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }
}
