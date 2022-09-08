import 'dart:convert';

Productmodel productmodelFromMap(String str) => Productmodel.fromMap(json.decode(str));

String productmodelToMap(Productmodel data) => json.encode(data.toMap());

class Productmodel {
    Productmodel({
        required this.img,
        required this.desc,
        required this.brand,
        required this.price,
        required this.color,
    });

    String img;
    String desc;
    String brand;
    String price;
    String color;

    factory Productmodel.fromMap(Map<String, dynamic> json) => Productmodel(
        img: json["img"],
        desc: json["desc"],
        brand: json["brand"],
        price: json["price"],
        color: json["color"],
    );

    Map<String, dynamic> toMap() => {
        "img": img,
        "desc": desc,
        "brand": brand,
        "price": price,
        "color": color,
    };
}
