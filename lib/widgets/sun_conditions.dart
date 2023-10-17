import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'sun_indicator.dart';

class SunConditions extends StatelessWidget {
   SunConditions({super.key});
  final String currentDate = "${DateFormat.MMMMd().format(DateTime.now())}, ${DateTime.now().year}";
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: width*(0.5),
      margin: EdgeInsets.only(left: 16.0,right: 16.0,top: 4.0,bottom: 16.0, ),
      padding:EdgeInsets.all(20.0,),
      decoration: ShapeDecoration(
        color: Colors.white,
        // gradient: LinearGradient(
        //   begin: Alignment(0.00, -1.00),
        //   end: Alignment(0, 1),
        //   colors: [Color(0xFF3C6FD1), Color(0xFF3C6FD1), Color(0xFF7CA8FF)],
        // ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Conditions",style: TextStyle(
                color: Color(0xFFA098AE),
                fontSize: 14,
                // fontFamily: 'Poppins Medium',
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: 0.30,
              ),),
              Text("UV index",style: TextStyle(
                color: Color(0xFFA098AE),
                fontSize: 14,
                // fontFamily: 'Poppins Medium',
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: 0.30,
              ),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Sun",style: TextStyle(
              color: Color(0xFF363B64),
      fontSize: 16,
      // fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      height: 0,
      letterSpacing: 0.30,
    ),),
              Text("0.3",style: TextStyle(
                color: Color(0xFF363B64),
                fontSize: 16,
                // fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0,
                letterSpacing: 0.30,
              ),),
            ],
          ),
          SunIndicator(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("3:15 AM",style: TextStyle(
                color: Color(0xFF363B64),
                fontSize: 14,
                // fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),),
              Text("6:15 PM",style: TextStyle(
                color: Color(0xFF363B64),
                fontSize: 14,
                // fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),),
            ],
          ),
        ],
      ),
    );
  }
}
