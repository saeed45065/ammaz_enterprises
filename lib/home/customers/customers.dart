

import 'package:ammaz_enterprises/home/customers/add_invoice.dart';
import 'package:ammaz_enterprises/my_widgets/custom_floating_button.dart';

import 'package:ammaz_enterprises/my_widgets/my_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



import '../../my_widgets/my_container.dart';
import 'new_customer.dart';


class Customers extends StatefulWidget {
  const Customers({super.key});

  @override
  State<Customers> createState() => _CustomersState();
}

class _CustomersState extends State<Customers> {
   Widget? body=const Center(
            child: MyText(text: "Initial Customer Here",color: Colors.black,),
          );
             List<dynamic> _customers = [];
            final List<String> _salePerson=["1","2"];
            String initialsalePerson="1";

  var bankKey="";
  var customerNamecontroler=TextEditingController();
   var salePersonNamecontroler=TextEditingController();
  var customerOpeningBalance=TextEditingController();
   // select customer name
  var selectCustomerName="";
// sale person name
 var salePersonname="";
  // customer name show on app bar
   // fetch saleperson name for customer
   void salepersonNameagainstCustomer()async{
        DocumentSnapshot snapNameofSalePerson= await  FirebaseFirestore.instance.collection("SalePersonAgainstCustomer").
    doc(selectCustomerName).get();
    var spn=snapNameofSalePerson["SPN"];
    print(spn);
    setState(() {
      salePersonname=spn;
    });
   }

   // fetch list of customers names from firebase
   void customersList(){
       FirebaseFirestore.instance.collection("SalePersonAgainstCustomer").
      get().then((value) {
        value.docs.forEach((element) {
          var cName=element.reference.id;
          _customers.add(cName);
          print("customer$_customers");
        },);
      },);
   }
 
  
 
  @override
  void initState() {
    // TODO: implement initState
    
   customersList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // getting the size of the window
    final screenWidth=MediaQuery.sizeOf(context).width;
    final screenHeight=MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.green,
     appBar: AppBar(
      title: const MyText(text: "Customers",color: Colors.black,),
      shadowColor: Colors.black,
       bottomOpacity: 10,
          elevation: 5,
         
      actions: [
        
        Mycontainer(
          height: screenHeight,
          width: screenWidth/2,
          color: Colors.grey,
           
          child: DropdownMenu(
             inputDecorationTheme: const InputDecorationTheme(
              border: OutlineInputBorder(
                borderSide: BorderSide.none
              )
            ),
          hintText: "Select Customer",
            width: screenWidth/2,
            onSelected: (value) {
              setState(() {
                body=value;
                print("body call");
              });
            },
            dropdownMenuEntries:_customers.map((e) {
             /*  setState(() {
                selectCustomerName=e;
               salepersonNameagainstCustomer();
              }); */
              return DropdownMenuEntry(value:
           Column(children: [
            Mycontainer(
              color: Colors.white,
              aligmentColor1: const Color.fromARGB(255, 2, 61, 4),
              aligmentColor2: Colors.white,
              height: screenHeight/15, width: screenWidth,child: Center(
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyText(text: e,color: Colors.black,fontSize: 20,),
                  const MyText(text: "Balance: 10000000",color: Colors.black,fontSize: 20,),
                ],
              ),
              
            ),),
              Mycontainer(
              color: Colors.white,
              aligmentColor1: const Color.fromARGB(255, 2, 61, 4),
              aligmentColor2: Colors.white,
              height: screenHeight/17, width: screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                    Mycontainer(
                      height: screenHeight/17,
                       width: screenWidth/5,
                       color: Colors.white,
                       aligmentColor1: Colors.white,
                       aligmentColor2:const Color.fromARGB(255, 2, 61, 4) ,
                       child: const Center(child: MyText(text: "Date",color: Colors.black,),)
                       ),
                       
                        Mycontainer(
                      height: screenHeight/17,
                       width: screenWidth/5,
                       color: Colors.white,
                       aligmentColor1: Colors.white,
                       aligmentColor2:const Color.fromARGB(255, 2, 61, 4) ,
                       child: const Center(child: MyText(text: "Inv# No.",color: Colors.black,),)
                       ),
                         Mycontainer(
                      height: screenHeight/17,
                       width: screenWidth/5,
                       color: Colors.white,
                       aligmentColor1: Colors.white,
                       aligmentColor2:const Color.fromARGB(255, 2, 61, 4) ,
                       child: const Center(child: MyText(text: "Amount",color: Colors.black,),)
                       ),
                         Mycontainer(
                      height: screenHeight/17,
                       width: screenWidth/5,
                       color: Colors.white,
                       aligmentColor1: Colors.white,
                       aligmentColor2:const Color.fromARGB(255, 2, 61, 4) ,
                       child: const Center(child: MyText(text: "Status",color: Colors.black,),)
                       ),
                         Mycontainer(
                      height: screenHeight/17,
                       width: screenWidth/5,
                       color: Colors.white,
                       aligmentColor1: Colors.white,
                       aligmentColor2:const Color.fromARGB(255, 2, 61, 4) ,
                       child: const Center(child: MyText(text: "Approved",color: Colors.black,),)
                       ),
                      
              ],),
            ),
            SizedBox(),
            
        salePersonname!=""?  StreamBuilder(
              stream: FirebaseFirestore.instance.collection("SalePersons").
              doc(salePersonname.toString()).collection(selectCustomerName).
              orderBy("Date",descending: true).snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
                if (snapshot.hasData) {
                  return ListView.builder(
                     scrollDirection: Axis.vertical,
                      itemCount: snapshot.data!.docs.length,
                      shrinkWrap: true,
                    itemBuilder: (context, index){
                       var data = snapshot.data!.docs[index];
                        var docId = snapshot.data!.docs[index].id;
                        return    Row(
            children:[ Mycontainer(
               color: Colors.white,
                       aligmentColor1: Colors.white,
                       aligmentColor2:Colors.white,
                       bordercolor: Colors.black,
                       borderwidth: 0.5,
              child: Center(child: MyText(text: data["Date"],color: Colors.black,)),
              height: screenHeight/20, width: screenWidth/5),
               Mycontainer(
               color: Colors.white,
                       aligmentColor1: Colors.white,
                       aligmentColor2:Colors.white,
                       bordercolor: Colors.black,
                       borderwidth: 0.5,
              child: Center(child: MyText(text: data["InvNo"],color: Colors.black,)),
              height: screenHeight/20, width: screenWidth/5),
               Mycontainer(
               color: Colors.white,
                       aligmentColor1: Colors.white,
                       aligmentColor2:Colors.white,
                       bordercolor: Colors.black,
                       borderwidth: 0.5,
              child: Center(child: MyText(text: data["Amount"].toString(),color: Colors.black,)),
              height: screenHeight/20, width: screenWidth/5),
               Mycontainer(
               color: Colors.white,
                       aligmentColor1: Colors.white,
                       aligmentColor2:Colors.white,
                       bordercolor: Colors.black,
                       borderwidth: 0.5,
              child: Center(child: MyText(text: data["Paid"],color: Colors.black,)),
              height: screenHeight/20, width: screenWidth/5),
               Mycontainer(
               color: Colors.white,
                       aligmentColor1: Colors.white,
                       aligmentColor2:Colors.white,
                       bordercolor: Colors.black,
                       borderwidth: 0.5,
              child: Center(child: MyText(text: data["Post"],color: Colors.black,)),
              height: screenHeight/20, width: screenWidth/5),
              ]
          );
                    }
                    
                    );
                } else {
                   return const Center(child: CircularProgressIndicator());
                }
              }
              ):const SizedBox()
          
       
           ],),
             label: e);
             
            }).toList(),
            ),
        ),
        const SizedBox(width: 10,),
        InkWell(
          onTap: () {
            setState(() {
              
            });
          },
          child: Container(
          
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 2, 61, 4),
               borderRadius: BorderRadius.circular(8)
            ),
            child: const Icon(Icons.refresh,color: Colors.blue,size: 35,))),
           const SizedBox(width: 10,),
      ],
     ),
     body: body,
     floatingActionButton: Column(
      mainAxisAlignment: MainAxisAlignment.end,
       children: [
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const NewCustomer()));
          },
          child: Customfloatingbutton(
            buttonHeight: screenHeight/15,
            buttonWidth:  screenWidth/10,
            buttonLabel: "New Customer",
          ),
        ),
       
          InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddInvoice()));
          },
          child: Customfloatingbutton(
            buttonHeight: screenHeight/15,
            buttonWidth:  screenWidth/10,
            buttonLabel: "Add Invoice",
          ),
        )
      
             
       
       ],
     ),
    );
  }
 
 
}
