import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cookie_detail.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CookiePage(),
    );
  }
}

class CookiePage extends StatelessWidget {
  const CookiePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imagePath;
    final List<String> imagePaths = [
      'assets/images/temples.png',
      'assets/images/temple_0.png',
      'assets/images/temple_1.jpg',
      'assets/images/temple_2.jpg',
      'assets/images/temple_3.png',
      'assets/images/temple_4.png',
      'assets/images/temples.png',
      'assets/images/temple_0.png',
      'assets/images/temple_1.jpg',
      'assets/images/temple_2.jpg',
      'assets/images/temple_3.png',
      'assets/images/temple_4.png',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Cookie Page'),
      ),
      backgroundColor: Color(0xFFFCFAF8),
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,bottom: 100),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns in the grid
            crossAxisSpacing: 10.0, // Space between columns
            mainAxisSpacing: 10.0, // Space between rows
            childAspectRatio: 1, // Aspect ratio of each grid item
          ),
          itemCount: imagePaths.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                imagePath = '${imagePaths[index]}';
                print('---xxxx---$imagePaths');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CookieDetail(assetPath: imagePath),
                  ),
                );
              },
              child: ImageCard(imagePath: '${imagePaths[index]}'),
            );
          },
        ),
      ),
    );
  }
}
class ImageCard extends StatelessWidget {
  final String imagePath;
  const ImageCard({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.orangeAccent, // Outline color
              width: 2, // Outline width
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.fill,
                ),
              ),
              // Optional overlay gradient for better text readability
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [0.0, 0.7],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// class ImageCard extends StatelessWidget {
//   final String imagePath;
//   const ImageCard({required this.imagePath});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 5,
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           image: DecorationImage(
//             image: AssetImage(imagePath),
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//     );
//   }
// }
