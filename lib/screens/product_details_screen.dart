import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sliding_sheet2/sliding_sheet2.dart';
import '../models/product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  ProductDetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          product.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SlidingSheet(
        elevation: 8,
        cornerRadius: 16,
        snapSpec: const SnapSpec(
          snap: true,
          snappings: [0.4, 0.7, 1.0],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        body: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CarouselSlider(
              options: CarouselOptions(autoPlay: true),
              items: product.images.map((imageUrl) {
                return Image.network(imageUrl);
              }).toList(),
            ),
          ]),
        ),
        builder: (context, state) {
          return Container(
            color: Colors.grey,
            height: 500,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description: ${product.description}',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Price: \$${product.price}',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Rating: ${product.rating}',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Stock: ${product.stock}',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// body: SlidingSheet(
//   elevation: 8,
//   cornerRadius: 16,
//   snapSpec: const SnapSpec(
//     // Enable snapping. This is true by default.
//     snap: true,
//     // Set custom snapping points.
//     snappings: [0.4, 0.7, 1.0],
//     // Define to what the snappings relate to. In this case,
//     // the total available space that the sheet can expand to.
//     positioning: SnapPositioning.relativeToAvailableSpace,
//   ),
//   // The body widget will be displayed under the SlidingSheet
//   // and a parallax effect can be applied to it.
//   body: Center(
//     child: Text('This widget is below the SlidingSheet'),
//   ),
//   builder: (context, state) {
//     // This is the content of the sheet that will get
//     // scrolled, if the content is bigger than the available
//     // height of the sheet.
//     return Container(
//       height: 500,
//       child: Center(
//         child: Text('This is the content of the sheet'),
//       ),
//     );
//   },
// ),
//
//
//
//
//

// Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       CarouselSlider(
//         options: CarouselOptions(autoPlay: true),
//         items: product.images.map((imageUrl) {
//           return Image.network(imageUrl);
//         }).toList(),
//       ),
//     Padding(
//       padding: EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text('Description: ${product.description}'),
//           Text('Price: \$${product.price}'),
//           Text('Rating: ${product.rating}'),
//           Text('Stock: ${product.stock}'),
//         ],
//       ),
//     ),
//   ],
// ),
