import 'package:flutter/material.dart';

import 'my_container.dart';

class MyTextField extends StatefulWidget {
 final double height;
 final double width;
 final Color shadowcolor;
 final double x;
 final double y;
 final double circularradius;
 final double blurradius;
 final TextEditingController controller;
 final Widget prefixIcon;
 final double contentPaddingT;
 final double contentPaddingL;
 final String hinttext;
   const MyTextField({
    required this.height,
    required this.width,
    required this.controller,
    required this.hinttext,
    this.shadowcolor=const Color.fromARGB(255, 246, 243, 243),
    this.x=0,
    this.y=0,
    this.circularradius=12,
    this.blurradius=35,
    this.prefixIcon=const SizedBox(),
    this.contentPaddingT=0,
    this.contentPaddingL=0,
    super.key});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Mycontainer(
                                 height: widget.height,      //screenHeight/12
                                                     width: widget.width,   // screenWidth/3
                                                     shadowcolor: widget.shadowcolor,
                                                     x: widget.x,
                                                     y: widget.y,
                                   circularradius: widget.circularradius,
                                   blurradius: widget.blurradius,
                                   child: TextField(
                                     controller: widget.controller,
                                                 showCursor: false,
                                     decoration: InputDecoration(
                                                  prefixIcon:widget.prefixIcon ,   
                                                   contentPadding: EdgeInsets.only(top:widget.contentPaddingT,left: widget.contentPaddingL ),
                                                  hintText:widget.hinttext,
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