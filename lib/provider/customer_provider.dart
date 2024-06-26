import 'package:flutter/material.dart';
class CustomerProvider with ChangeNotifier{
  ////////////////////////////////////  New_customer provider  /////////////////////////////////////////////
 
  // list of sale persons and Method to read list from firebase
  List spn=["Selected Person"];
  void readsalepersonname(List sp){
spn=sp;
 notifyListeners();
  }
  // variable for select sale Person and method to read selected sale Person
  var selectedPerson="Please Retrive";
  static var selectedperson1="";
  void readSelectedPerson(String name){
    selectedPerson=name;
    selectedperson1=name;
    notifyListeners();
  }
  void onretrive(){
    selectedPerson="Select Person";
    notifyListeners();
  }
//   method for loading state
static var loading=false;
void loadingStart(){
  loading=true;
  notifyListeners();
}
void loadingStop(){
  loading=false;
  notifyListeners();
}
  }