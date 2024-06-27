
import 'package:ammaz_enterprises/my_widgets/my_container.dart';
import 'package:ammaz_enterprises/my_widgets/my_text.dart';



import 'package:flutter/material.dart';

class Customfloatingbutton extends StatefulWidget {
   final double buttonHeight;
    final double buttonWidth;
    final String buttonLabel;
   const Customfloatingbutton({
   required this.buttonHeight,
   required this.buttonWidth,
   required this.buttonLabel,
    super.key,
    });

  @override
  State<Customfloatingbutton> createState() => _CustomfloatingbuttonState();
}

class _CustomfloatingbuttonState extends State<Customfloatingbutton> {
 

 
 
  @override
  Widget build(BuildContext context) {
   final screenHeight=MediaQuery.sizeOf(context).height;
    return  Padding(
      padding:  EdgeInsets.only(bottom:screenHeight/50 ),
      child: Mycontainer(
      
            height: widget.buttonHeight, //15
            width: widget.buttonWidth,  //12
            color: Colors.grey
            ,
             shadowcolor: Colors.black,
                                                     x: 5,
                                                     y: 5,
                                   circularradius: 12,
                                   blurradius: 5,
            
             child: Center(child: MyText(text: widget.buttonLabel,color: Colors.black,),),
           ),
    );
  }
 
}
