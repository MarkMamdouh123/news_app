import 'package:flutter/material.dart';

Widget defaultBar(BuildContext context, Function() changeAppBar,
    GlobalKey<ScaffoldState> globalKey) {
  return AppBar(
    iconTheme: const IconThemeData(color: Colors.white),
    backgroundColor: Colors.green,
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        globalKey.currentState?.openDrawer();
      },
      icon: const Icon(Icons.menu),
    ),
    actions: [
      InkWell(
        onTap: changeAppBar,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Icon(
            Icons.search,
          ),
        ),
      )
    ],
    shape: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
    title: const Text(
      "News",
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
  );
}
