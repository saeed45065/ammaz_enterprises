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

//////////////////////////////////// add invoice page provider /////////////////////////////////////////

// method to read selected customer name and static variabel for firebase_fetch_services
static var selectedCustomerName="";
void readSelectedCustomerName(String name){
  selectedCustomerName=name;
  notifyListeners();
}
//  list of customer name and method to fetch customers
List customersName=[];
void retriveCustomers(List cn){
customersName=cn;
notifyListeners();
}
  }