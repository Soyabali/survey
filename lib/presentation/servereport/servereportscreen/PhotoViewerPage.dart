import 'package:flutter/material.dart';

import '../../../app/generalFunction.dart';

class PhotoViewerPage extends StatelessWidget {

  final List<String> imageUrls;
  const PhotoViewerPage({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarFunction(context, "Photo"),

      body: PageView.builder(
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          final imageUrl = imageUrls[index];

          return InteractiveViewer(
            panEnabled: true,
            minScale: 0.8,
            maxScale: 5,
            child: SizedBox.expand(
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Text(
                      'Wrong image path',
                      style: TextStyle(color: Colors.redAccent, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );


    // return Scaffold(
    //   backgroundColor: Colors.black,
    //   appBar: AppBar(
    //     leading: const BackButton(color: Colors.white), // Back arrow like iOS
    //     title: const Text("Photos", style: TextStyle(color: Colors.white)),
    //     backgroundColor: Colors.black,
    //     elevation: 0,
    //   ),
    //   body: PageView.builder(
    //     itemCount: imageUrls.length,
    //     itemBuilder: (context, index) {
    //       final imageUrl = imageUrls[index];
    //
    //       return InteractiveViewer(
    //         child: SingleChildScrollView(
    //           child: Center(
    //             child: Image.network(
    //               imageUrl,
    //               fit: BoxFit.contain,
    //               loadingBuilder: (context, child, loadingProgress) {
    //                 if (loadingProgress == null) return child;
    //                 return const Center(
    //                     child: CircularProgressIndicator(color: Colors.white));
    //               },
    //               errorBuilder: (context, error, stackTrace) {
    //                 return const Padding(
    //                   padding: EdgeInsets.all(20),
    //                   child: Text(
    //                     'Wrong image path',
    //                     style: TextStyle(color: Colors.redAccent, fontSize: 18),
    //                     textAlign: TextAlign.center,
    //                   ),
    //                 );
    //               },
    //             ),
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    // );

    // return Scaffold(
    //   backgroundColor: Colors.black,
    //   appBar: AppBar(
    //     title: const Text("Photos"),
    //     backgroundColor: Colors.black,
    //   ),
    //   body: PageView.builder(
    //     itemCount: imageUrls.length,
    //     itemBuilder: (context, index) {
    //       return InteractiveViewer(
    //         child: Center(
    //           child: Image.network(
    //             imageUrls[index],
    //             loadingBuilder: (context, child, loadingProgress) {
    //               if (loadingProgress == null) return child;
    //               return const Center(child: CircularProgressIndicator());
    //             },
    //             errorBuilder: (context, error, stackTrace) =>
    //             const Icon(Icons.broken_image, color: Colors.white),
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
