import 'dart:io';
import 'package:flutter/material.dart';

import '../presentation/resources/custom_elevated_button.dart';

class NavigationUtils {
  static Future<bool> onWillPop(BuildContext context) async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('Do you want to exit the app?'),
        actions: <Widget>[
          CustomElevatedButton(
            text: 'No',
            onTap: () {
              Navigator.of(context).pop(false);
            },
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.of(context).pop(false);
          //    },
          //   style: ElevatedButton.styleFrom(
          //     foregroundColor: Colors.white,
          //     backgroundColor: Colors.grey,
          //     padding: EdgeInsets.all(8.0),      // Text color
          //   ),
          //   child: const Text('No'),
          // ),
          // TextButton(
          //   onPressed: () => Navigator.of(context).pop(false),
          //   child: const Padding(
          //     padding: EdgeInsets.all(8.0),
          //     child: Text('No'),
          //   ),
          // ),
          CustomElevatedButton(
            text: 'Yes',
            onTap: () {
              exit(0);
            },
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     exit(0);
          //  },
          //   style: ElevatedButton.styleFrom(
          //     foregroundColor: Colors.white,
          //     backgroundColor: Colors.grey,
          //     padding: EdgeInsets.all(8.0),      // Text color
          //   ),
          //   child: const Text('Yes'),
          // ),
          // TextButton(
          //   onPressed: () {
          //     exit(0);
          //   },
          //   child: const Padding(
          //     padding: EdgeInsets.all(8.0),
          //     child: Text('Yes'),
          //   ),
          // ),
        ],
      ),
    )) ?? false;
  }
}
