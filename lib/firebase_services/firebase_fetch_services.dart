
import 'package:cloud_firestore/cloud_firestore.dart';

mixin class FirebaseServices{

  /////////////////////////////////// service for new_customer page ///////////////////////////////////
  
  List salepersonsName=["SelectPerson"];
// Get SalesPersons Name from Firebase which upload through new sale person page
   Future getsalePersonsName()async{
   await  FirebaseFirestore.instance.collection("SalePersons").get().then((value) {
      value.docs.forEach((element) {
        var name=element.reference.id;
        salepersonsName.add(name);
        print(salepersonsName);
        
      });
    });
   }
  

}