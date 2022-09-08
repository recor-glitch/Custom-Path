import 'package:flutter/material.dart';
import 'package:hero_animation/constants.dart';
import 'package:hero_animation/product_detail.dart';
import 'package:hero_animation/product_model.dart';

import 'custom_paint.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                ClipPath(
                    clipper: CustomCurve(),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/bg.jpg'))),
                    )),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            ListView.separated(
                shrinkWrap: true,
                itemCount: demo_data.length,
                itemBuilder: (BuildContext context, int index) {
                  var data = Productmodel(
                      img: demo_data[index]['img']!,
                      desc: demo_data[index]['desc']!,
                      brand: demo_data[index]['brand']!,
                      price: demo_data[index]['price']!,
                      color: demo_data[index]['color']!);
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ProductDetail(data: data)));
                    },
                    child: Card(
                      elevation: 2,
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(10),
                        leading: Hero(
                            tag: data.img,
                            child: Image(image: NetworkImage(data.img))),
                        title: Text(data.brand),
                        subtitle: Text(data.desc),
                        trailing: const Icon(Icons.chevron_right),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02))
          ],
        ),
      ),
    );
  }
}
