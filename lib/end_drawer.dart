import 'package:finance_app/widgets/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'SingletonProvider.dart';

class EndDrawer extends StatelessWidget {
  final singleton = Singleton.instance;

  double _getScreenHeight(context) {
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    double height3 = height - padding.top - kToolbarHeight;
    return height3;
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height / 2);

    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(bottom: _getScreenHeight(context) * 0.38),
              child: Column(
                children: <Widget>[
                  DrawerButton(
                      buttonText: 'Добавить категорию',
                      icon: Icon(Icons.post_add),
                      onClick: () {
                        singleton.webViewController.evaluateJavascript(
                            'window.setIsShowingAddCategoryModal()');
                        Navigator.pop(context);
                      }),
                  DrawerButton(
                      buttonText: 'Добавить доход',
                      icon: Icon(Icons.attach_money),
                      onClick: () {
                        singleton.webViewController.evaluateJavascript(
                            'window.setIsShowingAddIncomesModal()');
                        Navigator.pop(context);
                      }),
                ],
              )),
          SizedBox(
              width: 200,
              child: FlatButton(
                onPressed: () {
                  singleton.webViewController.evaluateJavascript('window.logout()');
                  Navigator.pop(context);
                },
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.redAccent,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Выход',
                      style: TextStyle(color: Colors.blueAccent, fontSize: 20),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
