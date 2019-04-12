import 'package:fab_action_menu/fab_action_object.dart';
import 'package:fab_action_menu/callback_listener.dart';
import 'package:fab_action_menu/fab_action_menu.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  List<FloatingActionObject> object;

  DetailPage(this.object);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> implements CallbackListener {
  var text = "Text";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
            child: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            color: Colors.brown,
            child: Text(text,
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 25,
                    )),
          ),
        )),
      ]),
      floatingActionButton: FabActionMenu(
        buttonData: widget.object,
        clickListener: this,
        context: context,
      ),
    );
  }

  @override
  void onButtonClick(int id) {
    text = id.toString() + " Number";
    print(id.toString());
    setState(() {});
  }
}
