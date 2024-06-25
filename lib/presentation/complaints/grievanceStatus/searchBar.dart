import 'package:flutter/material.dart';

class SearchBar2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
        color :Color(0xFFF5F5F5),
        border: Border.all(
          color: Colors.grey, // Border color
          width: 2, // Border width
        ),

      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Icon(Icons.search, color: Colors.grey),
          ),
          SizedBox(width: 0),
          Expanded(
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                TextFormField(
                  maxLength: 20,  // Sets the maximum length to 30
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                    counterText: '',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),

                    //labelText: 'Search',
                    hintText: 'Search',
                    labelStyle: const TextStyle(
                      color: Colors.grey, // Label color
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide.none,
                    ),

                    filled: true,
                    fillColor: Color(0xFFF5F5F5), // Light gray background color
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