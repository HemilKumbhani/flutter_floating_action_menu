import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fab_menu/detail_page.dart';
import 'package:fab_action_menu/fab_action_object.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  {
  @override
  Widget build(BuildContext context) {
    List<FloatingActionObject> buttonData1 = new List();
    List<FloatingActionObject> buttonData2 = new List();
    List<FloatingActionObject> buttonData3 = new List();
    var text = new List();

    text.add(1);
    text.add(2);
    text.add(3);

    FloatingActionObject floatingActionObject;
    for (int i = 0; i < 3; i++) {
      floatingActionObject = new FloatingActionObject();
      floatingActionObject.id = i;
      if (i == 0) {
        floatingActionObject.color = Color.fromRGBO(204, 102, 0, 1);
        floatingActionObject.iconData = Icons.add;
      } else if (i == 1) {
        floatingActionObject.color = Color.fromRGBO(204, 102, 255, 1);
        floatingActionObject.iconData = Icons.transform;
      } else {
        floatingActionObject.color = Color.fromRGBO(51, 153, 51, 1);
        floatingActionObject.iconData = Icons.list;
      }
      buttonData3.add(floatingActionObject);
    }
    for (int i = 0; i < 2; i++) {
      floatingActionObject = new FloatingActionObject();
      floatingActionObject.id = i;
      if (i == 0) {
        floatingActionObject.color = Color.fromRGBO(204, 102, 0, 1);
        floatingActionObject.iconData = Icons.add;
      } else if (i == 1) {
        floatingActionObject.color = Color.fromRGBO(204, 102, 255, 1);
        floatingActionObject.iconData = Icons.transform;
      }
      buttonData2.add(floatingActionObject);
    }

    floatingActionObject = new FloatingActionObject();
    floatingActionObject.id = 1;
    floatingActionObject.color = Color.fromRGBO(204, 102, 0, 1);
    floatingActionObject.iconData = Icons.add;
    buttonData1.add(floatingActionObject);

    return Scaffold(
      body: Container(
        child: ListView.builder(
            itemCount: text.length,
            itemBuilder: (context, position) {
              return FlatButton(
                  child: Text(text[position].toString()),
                  color: Colors.blue,
                  onPressed: () {
                    List<FloatingActionObject> buttonData;
                    switch (position) {
                      case 0:
                        buttonData = buttonData1;
                        break;
                      case 1:
                        buttonData = buttonData2;
                        break;
                      case 2:
                        buttonData = buttonData3;
                        break;
                    }

                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new DetailPage(buttonData)));
                  });
            }),
      ),
    );
  }


}
