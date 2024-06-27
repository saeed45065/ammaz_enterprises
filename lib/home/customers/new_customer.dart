
import 'package:ammaz_enterprises/my_widgets/my_container.dart';
import 'package:ammaz_enterprises/my_widgets/my_text.dart';
import 'package:ammaz_enterprises/my_widgets/my_text_field.dart';
import 'package:ammaz_enterprises/provider/customer_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
import 'customer_logic_part/customer_logic._part.dart';

class NewCustomer extends StatefulWidget  {
   const NewCustomer({super.key});

  @override
  State<NewCustomer> createState() => _NewCustomerState();
}

class _NewCustomerState extends State<NewCustomer> {
  CustomerLogicPart newCustomerLogicPart=CustomerLogicPart();
  
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
      body:CustomerProvider.loading==true?const SpinKitSpinningLines(
        color: Colors.white,
      ): Row(children: [
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
               child: MyTextField(
                height: screenHeight/15,
                 width: screenWidth,
                 hinttext: "Customer Name",
                 prefixIcon: const Icon(Icons.perm_identity_outlined,color: Colors.blue,),
                 contentPaddingT: screenHeight/30,
                 contentPaddingL: screenWidth/60,
                  controller: customerNameControler,),
                         ),
              SizedBox(height: screenHeight/35),
               Padding(
               padding: EdgeInsets.symmetric(horizontal:screenWidth/20 ),
               child: MyTextField(
                height: screenHeight/15,
                 width: screenWidth,
                controller: customerBalancecontroler,
                prefixIcon:  const Icon(Icons.attach_money_outlined,color: Colors.blue,),
                 contentPaddingT: screenHeight/30,
                 contentPaddingL: screenWidth/60,
                  hinttext: "Opening Balance",),
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
                    onTap: ()async {
                    
                      try {
                       context.read<CustomerProvider>().loadingStart();
                         var cname=customerNameControler.text.toString();
                      double balance=double.parse(customerBalancecontroler.text.toString());
                      
                        await FirebaseFirestore.instance.collection("SalePersons").
                        doc(CustomerProvider.selectedperson1).collection(cname)
                         .doc(cname).set({
                           "Name":cname,
                           "Balance":balance
                            }).then((_) async{
                                  await  FirebaseFirestore.instance.collection("SalePersonAgainstCustomer").
                       doc(cname).set({"SPN":CustomerProvider.selectedperson1.toLowerCase()}).then((value) {
                       context.read<CustomerProvider>().loadingStop();
                              QuickAlert.show(context: context,
                               type: QuickAlertType.success,
                               text: "Upload Successfully"
                               );
  
                             },);
                             customerNameControler.clear();
                             customerBalancecontroler.clear();
                             
                                       },);
                  
                      } catch (e) {
                          // ignore: use_build_context_synchronously
                          context.read<CustomerProvider>().loadingStop();
                          QuickAlert.show(
                        // ignore: use_build_context_synchronously
                        context: context,
                         type: QuickAlertType.error,
                         text: "Something Wrong"
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
  
}