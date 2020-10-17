import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class MainPageWebView extends StatefulWidget {
  @override
  MainPageWebViewState createState() {
    return new MainPageWebViewState();
  }
}

class MainPageWebViewState extends State<MainPageWebView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
        url: 'https://localhost:300f0',
        // url: 'https://pysoftware.github.io/finance-app/',
        // javascriptMode: JavascriptMode.unrestricted,
        bottomNavigationBar: SizedBox(
          child: const DecoratedBox(
            child: FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              child: Text(
                "Flat Button",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            decoration: const BoxDecoration(
                color: Colors.white
            ),
          ),// child: BottomNavigationBar(
          //   items: [
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.home),
          //       label: 'Home',
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.business),
          //       label: 'Business',
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.school),
          //       label: 'School',
          //     ),
          //   ],
          //   currentIndex: _selectedIndex,
          //   selectedItemColor: Colors.amber[800],
          //   onTap: _onItemTapped,
          // ),
          height: 80,
        ));
  }
}
