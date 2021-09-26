import 'package:eshopapp/helper/extenstion.dart';
import 'package:flutter/cupertino.dart';

class ProductModel {
 late String name, image, description, price,id,background;
 late List<dynamic> sized;
 late  List<dynamic> color;

  ProductModel(
      {required this.name,
      required this.image,
      required this.description,
      required this.color,
      required this.sized,
      required this.price,
      required this.background,
      required this.id});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map.isEmpty) {
      return;
    }

    name = map['name'];
    image = map['image'];
    description = map['description'];
    color =(map['color']) as List<dynamic>;
    price = map['price'];
    id = map['id'];
    background=map['background'];
    sized = map['size'] as List<dynamic>;
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'color': color,
      'price': price,
      'id': id,
      'background': background,
      'size': sized,

    };
  }
}
