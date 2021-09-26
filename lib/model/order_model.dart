import 'package:eshopapp/model/cart_product_model.dart';

class OrderModel{
  late String userId,dateTime;
  late String street1,street2,state,city,country,phone;
  late List<CartProductModel>products;
  OrderModel({required this.userId, required this.dateTime,required this.street1,required this.street2,required this.state,required this.city,required this.country , required this.products, required this.phone});

  factory OrderModel.fromMap(Map<String,dynamic>map){
    return new OrderModel(userId: map['userId'], dateTime: map['dateTime'] , street1: map['street1'] as String, street2: map['street2'] as String, state: map['state'] as String, city: map['city'] as String, country: map['country'] as String,phone: map['phone'] as String ,products: map['products'] );
  }
  Map<String,dynamic> toMap(){
    return {
      'userId' : this.userId,
      'dateTime' : this.dateTime,
      'street1' : this.street1,
      'street2' : this.street2,
      'state' : this.state,
      'city' : this.city,
      'country' : this.country,
      'phone' : this.phone,
      'products' : products.map((e) => e.toJson()).toList(),
    };
  }
}
class OrderModels{
  late String userId,dateTime;
  late String street1,street2,state,city,country,phone;
  late List<dynamic>products;
  OrderModels({required this.userId, required this.dateTime,required this.street1,required this.street2,required this.state,required this.city,required this.country ,  required this.phone,required this.products});

  factory OrderModels.fromMap(Map<dynamic,dynamic>map){
    return new OrderModels(userId: map['userId'], dateTime: map['dateTime'] , street1: map['street1'] as String, street2: map['street2'] as String, state: map['state'] as String, city: map['city'] as String, country: map['country'] as String,phone: map['phone'] as String ,products: map['products']);
  }
   toMap(){
    return {
      'userId' : this.userId,
      'dateTime' : this.dateTime,
      'street1' : this.street1,
      'street2' : this.street2,
      'state' : this.state,
      'city' : this.city,
      'country' : this.country,
      'phone' : this.phone,
      'products' : products
    };
  }
}

class AddressInfo{
  late String street1,street2,state,city,country,phone;
AddressInfo({
  required this.street1,required this.street2,required this.state,required this.city,required this.country,required this.phone
});
  factory AddressInfo.fromMap(Map<dynamic,dynamic>map){
    return new AddressInfo( street1: map['Street1'] as String, street2: map['Street2'] as String, state: map['state'] as String, city: map['city'] as String, country: map['country'] as String,phone: map['phoneNumber'] );
  }
  dynamic toMap(){
    return {
      'Street1' : this.street1,
      'Street2' : this.street2,
      'state' : this.state,
      'city' : this.city,
      'country' : this.country,
      'phoneNumber' :this.phone
    };
  }
}