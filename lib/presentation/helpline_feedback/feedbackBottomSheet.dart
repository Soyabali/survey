import 'package:flutter/material.dart';

import '../../resources/custom_elevated_button.dart';

class FeedbackBottomSheet extends StatelessWidget {

  final TextEditingController _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/hotel_0.jpg'),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: _feedbackController,
            decoration: const InputDecoration(
              labelText: 'Your Feedback',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.0),

          CustomElevatedButton(
            text: 'Submit Feedback',
            onTap: () {
                  final feedback = _feedbackController.text;
                  // Handle feedback submission
                  print('Feedback: $feedback');
                  Navigator.pop(context);
            },
          ),

          // ElevatedButton(
          //   onPressed: () {
          //     final feedback = _feedbackController.text;
          //     // Handle feedback submission
          //     print('Feedback: $feedback');
          //     Navigator.pop(context);
          //   },
          //   child: Text('Submit Feedback'),
          // ),
        ],
      ),
    );
  }
}