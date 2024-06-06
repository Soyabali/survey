import 'dart:io';
import 'package:flutter/material.dart';

class NavigationUtils {
  static Future<bool> onWillPop(BuildContext context) async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Are you sure?'),
        content: Text('Do you want to exit the app?'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
             // onPressed: () => Navigator.of(context).pop(false),
              onPressed: () => Navigator.of(context).pop(true),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('No'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                exit(0);
              },
              child: Text('Yes'),
            ),
          ),
        ],
      ),
    )) ?? false;
  }
}