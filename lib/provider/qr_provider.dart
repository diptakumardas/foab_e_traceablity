import 'package:flutter/material.dart';

class FormDataModel extends ChangeNotifier {
  String name = '';
  String address = '';
  String quantity = '';
  String price = '';
  String date = '';

  void updateFormData({
    required String name,
    required String address,
    required String quantity,
    required String price,
    required String date,
  }) {
    this.name = name;
    this.address = address;
    this.quantity = quantity;
    this.price = price;
    this.date = date;
    notifyListeners();
  }
}
