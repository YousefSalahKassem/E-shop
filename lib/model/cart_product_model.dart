import 'dart:ui';

class CartProductModel {
  late String name, image, price,id,color,size;
  late int quantity;

  CartProductModel(
      {required this.name,
        required this.image,
        required this.price,
        required this.quantity,
        required this.id,
        required this.size,
        required this.color,
      });
  dynamic toJson() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'quantity' : quantity,
      'id' : id,
      'size' : size,
      'color' : color
    };
  }
   CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map.isEmpty) {
      return;
    }
    name = map['name'];
    image = map['image'];
    price = map['price'];
    quantity=map['quantity'];
    id=map['id'];
    size=map['size'];
    color=map['color'];


  }


}