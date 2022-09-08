import 'package:flutter/material.dart';
import 'package:hero_animation/product_model.dart';

class ProductDetail extends StatelessWidget {
  final Productmodel data;
  const ProductDetail({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Hero(
            tag: data.img,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(data.img))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.brand,
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold)),
                Text(data.desc),
              ],
            ),
          )
        ],
      )),
    );
  }
}
