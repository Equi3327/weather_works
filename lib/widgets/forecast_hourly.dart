import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HourlyForecast extends StatelessWidget {
  const HourlyForecast({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,

        physics: NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemExtent:width/5.4,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "${DateFormat('h a').format(DateTime.now().add(Duration(hours: index)))}",
                  style: TextStyle(
                    color: Color(0xFFA098AE),
                    fontSize: 14,
                    // fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                Image.asset(
                  "assets/cloudy.png",
                  height: 24,
                  // height: width/4.0,
                  // width: width/4.0,
                  fit: BoxFit.contain,
                ),
                Text("72\u00B0F"),
              ],
            );
          }),
    );
  }
}
