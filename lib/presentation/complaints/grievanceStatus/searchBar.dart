import 'package:flutter/material.dart';

class SearchBar2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
        color :Color(0xFFfFcccb),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Icon(Icons.search, color: Colors.white),
          ),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}