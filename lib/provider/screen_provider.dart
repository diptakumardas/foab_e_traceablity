/*
import 'package:flutter/foundation.dart';

class FarmingOptionsProvider with ChangeNotifier {
  List<bool> _selectedOptions3 = List<bool>.filled(8, false); // assuming 8 options
  List<bool> _selectedOptions2 = List<bool>.filled(8, false);
  List<bool> _selectedOptions1 = List<bool>.filled(4, false);
  List<bool> _selectedOptions4 = List<bool>.filled(3, false);
  List<bool> _selectedOptions5 = List<bool>.filled(4, false);
  List<bool> _selectedOptions6 = List<bool>.filled(2, false);
  List<bool> _selectedOptions7 = List<bool>.filled(7, false);




String _landArea = "";
String _saltAmount = "";
String _feedAmount = "";
String _bagdaAmount = "";
String _galdaAmount = "";
String _bagdaPAmount = "";
String _galdaPAmount = "";




  List<bool> get selectedOptions3 => _selectedOptions3;
  List<bool> get selectedOptions2 => _selectedOptions2;
  List<bool> get selectedOptions1 => _selectedOptions1;
  List<bool> get selectedOptions4 => _selectedOptions4;
  List<bool> get selectedOptions5 => _selectedOptions5;
  List<bool> get selectedOptions6 => _selectedOptions6;
  List<bool> get selectedOptions7 => _selectedOptions7;





  String get landArea => _landArea;
  String get saltAmount => _saltAmount;
  String get feedAmount => _feedAmount;
  String get bagdaAmount => _bagdaAmount;
  String get galdaAmount => _galdaAmount;
  String get bagdaPAmount => _bagdaPAmount;
  String get galdaPAmount => _galdaPAmount;


  void toggleOption3(int index) {
    _selectedOptions3[index] = !_selectedOptions3[index];
    notifyListeners();
  }

  void toggleOption2(int index) {
    _selectedOptions2[index] = !_selectedOptions2[index];
    notifyListeners();
  }


  void toggleOption1(int index) {
    _selectedOptions1[index] = !_selectedOptions1[index];
    notifyListeners();
  }

  void toggleOption4(int index) {
    _selectedOptions4[index] = !_selectedOptions4[index];
    notifyListeners();
  }
  void toggleOption5(int index) {
    _selectedOptions5[index] = !_selectedOptions5[index];
    notifyListeners();
  }
  void toggleOption6(int index) {
    _selectedOptions6[index] = !_selectedOptions6[index];
    notifyListeners();
  }
  void toggleOption7(int index) {
    _selectedOptions7[index] = !_selectedOptions7[index];
    notifyListeners();
  }




  ////textfield provider




  void updateLandArea (String newArea){
    _landArea = newArea;
    notifyListeners();
  }

  void updateSaltAmount (String newSaltAmount){
    _saltAmount = newSaltAmount;
    notifyListeners();
  }


  void updateFeedAmount (String newFeedAmount){
    _feedAmount = newFeedAmount;
    notifyListeners();
  }
  void updateGaldaAmount (String newGaldaAmount){
    _feedAmount = newGaldaAmount;
    notifyListeners();
  }

  void updateBagdamount (String newBagdaAmount){
    _feedAmount = newBagdaAmount;
    notifyListeners();
  }
  void updateGaldaPiece (String newBagdaPiece){
    _feedAmount = newBagdaPiece;
    notifyListeners();
  }
  void updateBagdaPiece (String newGaldaPiece){
    _feedAmount = newGaldaPiece;
    notifyListeners();
  }


}
*/
import 'package:flutter/foundation.dart';

class FarmingOptionsProvider with ChangeNotifier {
  // Define the fields
  final List<bool> _selectedOptions3 = List<bool>.filled(8, false); // assuming 8 options
  final List<bool> _selectedOptions2 = List<bool>.filled(8, false);
  final List<bool> _selectedOptions1 = List<bool>.filled(4, false);
  final List<bool> _selectedOptions4 = List<bool>.filled(3, false);
  final List<bool> _selectedOptions5 = List<bool>.filled(4, false);
  final List<bool> _selectedOptions6 = List<bool>.filled(2, false);
  final List<bool> _selectedOptions7 = List<bool>.filled(7, false);

  String _landArea = "";
  String _saltAmount = "";
  String _feedAmount = "";
  String _bagdaAmount = "";
  String _galdaAmount = "";
  String _bagdaPAmount = "";
  String _galdaPAmount = "";

  // Getters for fields
  List<bool> get selectedOptions3 => _selectedOptions3;
  List<bool> get selectedOptions2 => _selectedOptions2;
  List<bool> get selectedOptions1 => _selectedOptions1;
  List<bool> get selectedOptions4 => _selectedOptions4;
  List<bool> get selectedOptions5 => _selectedOptions5;
  List<bool> get selectedOptions6 => _selectedOptions6;
  List<bool> get selectedOptions7 => _selectedOptions7;

  String get landArea => _landArea;
  String get saltAmount => _saltAmount;
  String get feedAmount => _feedAmount;
  String get bagdaAmount => _bagdaAmount;
  String get galdaAmount => _galdaAmount;
  String get bagdaPAmount => _bagdaPAmount;
  String get galdaPAmount => _galdaPAmount;

  // Toggle methods
  void toggleOption3(int index) {
    _selectedOptions3[index] = !_selectedOptions3[index];
    notifyListeners();
  }

  void toggleOption2(int index) {
    _selectedOptions2[index] = !_selectedOptions2[index];
    notifyListeners();
  }

  void toggleOption1(int index) {
    _selectedOptions1[index] = !_selectedOptions1[index];
    notifyListeners();
  }

  void toggleOption4(int index) {
    _selectedOptions4[index] = !_selectedOptions4[index];
    notifyListeners();
  }

  void toggleOption5(int index) {
    _selectedOptions5[index] = !_selectedOptions5[index];
    notifyListeners();
  }

  void toggleOption6(int index) {
    _selectedOptions6[index] = !_selectedOptions6[index];
    notifyListeners();
  }

  void toggleOption7(int index) {
    _selectedOptions7[index] = !_selectedOptions7[index];
    notifyListeners();
  }

  // TextField provider methods
  void updateField(String field, String value) {
    switch (field) {
      case "চাষযোগ্য মোট জমির পরিমান":
        _landArea = value;
        break;
      case "পানিতে লবণাক্ততার পরিমান?":
        _saltAmount = value;
        break;
      case "আপনি দিনে কতবার খাবার খাওয়ান":
        _feedAmount = value;
        break;
      case "বাগদা রেণু মজুদ":
        _bagdaAmount = value;
        break;
      case "গলদা রেণু মজুদ":
        _galdaAmount = value;
        break;
      case "বলদা পিছ":
        _bagdaPAmount = value;
        break;
      case "সাদা মাছ":
        _galdaPAmount = value;
        break;
      default:
        break;
    }
    notifyListeners();
  }
}
