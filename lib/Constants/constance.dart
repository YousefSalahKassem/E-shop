import 'package:flutter/material.dart';

const primaryColor = Color.fromRGBO(0, 197, 105, 1);
final String tableCartProduct='CartProduct';
final String columnName='name';
final String columnImage='image';
final String columnQuantity='quantity';
final String columnPrice='price';
final String columnSize='size';
final String columnColor='color';
final String columnId='id';
final String tableAddress='MyAddresses';
final String columnStreet1='Street1';
final String columnStreet2='Street2';
final String columnState='state';
final String columnCountry='country';
final String columnCity='city';
final String columnPhoneNumber='phoneNumber';

const kTileHeight = 50.0;
const inProgressColor = Colors.black87;
const todoColor = Color(0xffd1d2d7);
enum Pages{
DeliveryTime,
AddAddress,
Summary,
}
enum Delivery{
  StandardDelivery,
  NextDayDelivery,
  NominatedDelivery
}


