import 'package:flutter/material.dart';

class SunIndicator extends StatelessWidget {
   SunIndicator({super.key});
   DateTime current = DateTime.now();
   double percentage = 0;

  @override
  Widget build(BuildContext context) {
    int fromMorning = current.difference(DateTime(current.year, current.month, current.day, 3, 15)).inHours;
    int total = Duration(hours: 15).inHours;
    percentage = fromMorning/total;
    return Container(
      height: 100.0,
      child: Stack(
        alignment: Alignment.center,
        children: [


          Positioned(
            left: 0.0,
            top: 80.0,
            width: MediaQuery.of(context).size.width,
            // height: 10.0,
            child: Divider(
              thickness: 3.0,
              color: Color(0xFF363B64),
            ),
          ),
          Positioned(
            left: percentage*300,
            top: 26.5,
            child: Column(
              children: [
                Icon(
                  Icons.light_mode_outlined,
                  size: 40.0,
                  color: Color(0xFFFF9F5A),),
                Icon(
                  Icons.arrow_drop_up_outlined,
                  size: 35.0,
                  color: Color(0xFF363B64),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
