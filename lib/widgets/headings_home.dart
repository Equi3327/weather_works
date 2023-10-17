import 'package:flutter/material.dart';

class HomeHeadings extends StatelessWidget {
  const HomeHeadings({required this.title, super.key});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.0,bottom: 6.0,top: 4.0,),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(title,style: TextStyle(
          color: Color(0xFF363B64),
          fontSize: 18,
          // fontFamily: 'Poppins Medium',
          fontWeight: FontWeight.w400,
          height: 0,
          letterSpacing: 0.30,
        ),),
      ),
    );
  }
}
