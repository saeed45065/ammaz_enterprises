
import 'package:ammaz_enterprises/provider/customer_provider.dart';
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
  ////////////////////////////////// services for add invoice page ///////////////////////////////////
  // customer list
   List customersName=[];
   // fetch list of customers names from firebase
   void customersList(){
       FirebaseFirestore.instance.collection("SalePersonAgainstCustomer").
      get().then((value) {
        value.docs.forEach((element) {
          var cName=element.reference.id;
          customersName.add(cName);
          print(customersName);
        },);
      },);
   }

  // sale person name
 var salePersonname="";
    // fetch saleperson name for customer
   void salepersonNameagainstCustomer()async{
        DocumentSnapshot snapNameofSalePerson= await  FirebaseFirestore.instance.collection("SalePersonAgainstCustomer").
    doc(CustomerProvider.selectedCustomerName).get();
    var spn=snapNameofSalePerson["SPN"];
    print(spn);
    salePersonname=spn;
    
   }

}