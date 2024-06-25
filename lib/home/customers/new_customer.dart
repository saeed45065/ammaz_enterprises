
import 'package:ammaz_enterprises/my_widgets/my_container.dart';
import 'package:ammaz_enterprises/my_widgets/my_text.dart';
import 'package:ammaz_enterprises/provider/customer_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
import 'customer_logic_part/customer_logic._part.dart';

class NewCustomer extends StatefulWidget  {
   const NewCustomer({super.key});

  @override
  State<NewCustomer> createState() => _NewCustomerState();
}

class _NewCustomerState extends State<NewCustomer> {
  NewCustomerLogicPart newCustomerLogicPart=NewCustomerLogicPart();
  
  // Customer Name controler
 final  customerNameControler=TextEditingController();
  // Customer Balance controler
  final customerBalancecontroler=TextEditingController();
  @override
  void initState() {
   // getsalePersonsName();
   newCustomerLogicPart.getsalePersonsName();
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
        title: const MyText(text: "New Customer Page",color: Colors.black,),
        flexibleSpace: Container(
          height:  screenHeight,
          width: screenWidth/2,
          decoration: const BoxDecoration(
           gradient: LinearGradient(
            begin: Alignment.bottomLeft,end: Alignment.bottomRight,
            colors:[Colors.white,Color.fromARGB(255, 2, 61, 4),])
          ),
        ), 
      ),
      body: Row(children: [
        Container(
          height:  screenHeight,
          width: screenWidth/2,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/newcustomer.png")
              )
          ),
        ),
       
           Expanded(
            child: Container(
               decoration: const BoxDecoration(
           gradient: LinearGradient(
            begin: Alignment.topCenter,end: Alignment.bottomCenter,
            colors:[Color.fromARGB(255, 230, 229, 229),Color.fromARGB(255, 225, 225, 225)])
          ),
              child: Column(
                children: [
                  SizedBox(height: screenHeight/45),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal:screenWidth/30 ),
                child: Mycontainer(
                  height:screenHeight/8,
                   width: screenWidth,
                    shadowcolor: Colors.grey.shade50,
                     x: 5,
                     y: 5,
                    circularradius: 12,
                    blurradius: 50,
                   color: Colors.black,
                   
                   child:  Center(
                    child: MyText(text: "Customer Details",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: screenHeight/20,),
                   ),
                   ),
              ),
              SizedBox(height: screenHeight/15),
                         Padding(
               padding: EdgeInsets.symmetric(horizontal:screenWidth/20 ),
               child: customField(
                height: screenHeight/15,
                 width: screenWidth,
                 controler: customerNameControler,
                 contentPaddingT: screenHeight/30,
                 contentPaddingL: screenWidth/60,
                  hintText: "Customer Name",),
                         ),
              SizedBox(height: screenHeight/35),
               Padding(
               padding: EdgeInsets.symmetric(horizontal:screenWidth/20 ),
               child: customField(
                height: screenHeight/15,
                 width: screenWidth,
                 controler: customerBalancecontroler,
                 contentPaddingT: screenHeight/30,
                 contentPaddingL: screenWidth/60,
                  hintText: "Opening Balance",),
                         ),
                         SizedBox(height: screenHeight/35),
                         Padding(
               padding: EdgeInsets.symmetric(horizontal:screenWidth/20 ),
               child: Mycontainer(
                 height:screenHeight/15, 
                 width: screenWidth,
                 aligmentColor1: const Color.fromARGB(255, 2, 61, 4),
                 aligmentColor2: Colors.black,
               color: Colors.black,
                 borderwidth: 2,
                 circularradius: 12,
                 bordercolor: Colors.black,
                 child: DropdownButton(
                  isExpanded: true,
                 
                  borderRadius: BorderRadius.circular(12),
                   padding: EdgeInsets.symmetric(horizontal:screenWidth/70),
                 underline: const SizedBox(),
                  hint: MyText(text: context.watch<CustomerProvider>().selectedPerson,color: Colors.white,),
                  iconEnabledColor: Colors.white,
                  dropdownColor: Colors.grey.shade600,
                  items:context.watch<CustomerProvider>().spn.map((e) {
                  
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e,style: const TextStyle(color: Colors.white),));
                  }).toList(),
                  onChanged: ( value) {
                    context.read<CustomerProvider>().readSelectedPerson(value.toString());
                  },
                  ),
               ),
                         ),
                          Padding(
               padding: EdgeInsets.symmetric(horizontal:screenWidth/20 ),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: (){
                  context.read<CustomerProvider>().readsalepersonname(newCustomerLogicPart.salepersonsName);
                  context.read<CustomerProvider>().onretrive();
                    },
                     child: const MyText(text: "Retrive SalePerson",color: Colors.blue,))
                ],
               ),
                         ),
                         SizedBox(height: screenHeight/8),
                         Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.of(context).pop();
                   
                  
                  },
                  child: Mycontainer(
                    height:screenHeight/15 , 
                    width:screenWidth/10 ,
                    color: Colors.black,
                    aligmentColor1: const Color.fromARGB(255, 2, 61, 4),
                    aligmentColor2: Colors.white,
                    circularradius: screenWidth/10,
                    child: const Center(
                      child: MyText(text: "Cancel",color: Colors.black,),
                    ),
                    ),
                ),
                  InkWell(
                    onTap: () {
                      try {
                         var cname=customerNameControler.text.toString();
                      double balance=double.parse(customerBalancecontroler.text.toString());
                      context.read<CustomerProvider>().readNameandBalance(cname, balance);
                   
                      } catch (e) {
                          QuickAlert.show(
                        context: context,
                         type: QuickAlertType.error,
                         text: e.toString()
                         );
                      }
                     
                     
                    },
                    child: Mycontainer(
                       aligmentColor1: const Color.fromARGB(255, 2, 61, 4),
                    aligmentColor2: Colors.white,
                    height:screenHeight/15 , 
                    width:screenWidth/10 ,
                    color: Colors.black,
                     circularradius: screenWidth/10,
                    child: const Center(
                      child: MyText(text: "Upload",color: Colors.black,),
                    ),
                    ),
                  )
              ],
                         )
              
                ],
              ),
            ))
      ],),
    );
  }
  Widget customField({var controler,
   var prefixwidget,
   required height,
   required width,
   required hintText,
   var contentPaddingT=0.0,
   var contentPaddingL=0.0}){
    return  Mycontainer(
                                 height: height,      //screenHeight/12
                                                     width: width,   // screenWidth/3
                                                     shadowcolor: Colors.grey.shade50,
                                                     x: 0,
                                                     y: 1,
                                   circularradius: 12,
                                   blurradius: 100,
                                   child: TextField(
                                    
                                     controller: controler,
                                                 showCursor: false,
                                     decoration: InputDecoration(
                                                  prefixIcon:prefixwidget ,   
                                                   contentPadding: EdgeInsets.only(top:contentPaddingT,left: contentPaddingL ),
                                                  hintText:hintText ,
                                                  fillColor: const Color.fromARGB(255, 230, 229, 229),
                                                  filled: true,
                                                  enabledBorder:OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(12),
                                                    borderSide: const BorderSide(color: Colors.black,width: 0.5)
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(12),
                                                    borderSide: const BorderSide(color: Colors.blue,width: 0.5)
                                                  )
                                     ),
                                     
                                   ),
                                 );
  }
}