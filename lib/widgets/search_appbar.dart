import 'package:flutter/material.dart';

Widget editingBar(
  BuildContext context,
  Function() changeAppBar,
) {
  return AppBar(
    iconTheme: const IconThemeData(color: Colors.white),
    automaticallyImplyLeading: false,
    toolbarHeight: 50,
    backgroundColor: Colors.green,
    title: TextField(
      decoration: InputDecoration(
        prefixIcon: IconButton(
            onPressed: changeAppBar,
            icon: const Icon(
              Icons.close,
              color: Colors.green,
            )),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            color: Colors.green,
          ),
        ),
        hintText: 'Search Article',
        hintStyle: TextStyle(
          color: Colors.grey[400],
        ),
        fillColor: Colors.white,
        filled: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide.none,
        ),
      ),
    ),
    shape: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
  );
}
