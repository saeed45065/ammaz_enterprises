


import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

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
  
  get context => null;
  void readSelectedPerson(String name){
    selectedPerson=name;
    notifyListeners();
  }
  void onretrive(){
    selectedPerson="Select Person";
    notifyListeners();
  }
  // static variable for customer name and balance // method to read name and balance
 static bool done=false;
  Future readNameandBalance(String cname, num balance)async{
   
   try {
      await FirebaseFirestore.instance.collection("SalePersons").
doc(selectedPerson).collection(cname)
.doc(cname).set({
  "Name":cname,
  "Balance":balance
  }).then((value) {
    print("1");
    
  },);
    } catch (e) {
   
    }
    try {
     await  FirebaseFirestore.instance.collection("SalePersonAgainstCustomer").
    doc(cname).set({"SPN":selectedPerson.toLowerCase()}).then((value) {
     print("2");
     
    },);
    } catch (e) {
      print(e);
     
    }
    
  }
}