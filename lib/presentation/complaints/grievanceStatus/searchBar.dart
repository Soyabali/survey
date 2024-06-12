import 'package:flutter/material.dart';

class SearchBar2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.search, color: Colors.grey),
        SizedBox(width: 8.0),
        Expanded(
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                ),
              ),
              // const Positioned.fill(
              //   child: Align(
              //     alignment: Alignment.center,
              //     child: IgnorePointer(
              //       child: Text(
              //         'Search',
              //         style: TextStyle(color: Colors.grey),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}