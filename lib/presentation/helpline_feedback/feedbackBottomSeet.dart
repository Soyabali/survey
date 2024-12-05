import 'package:flutter/material.dart';

class FeedbackSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets, // Adjust for keyboard
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image
            Image.asset(
              'assets/feedback.png', // Replace with your asset path
              height: 100,
              width: 100,
            ),
            SizedBox(height: 16),
            // Label
            Text(
              'Feedback',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            // TextFormField
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Your Feedback',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 16),
            // ElevatedButton
            ElevatedButton(
              onPressed: () {
                // Handle feedback submission
                Navigator.pop(context); // Close the BottomSheet
              },
              child: Text('Submit Feedback'),
            ),
          ],
        ),
      ),
    );
  }
}