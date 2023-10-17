import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LiveWeather extends StatelessWidget {
  const LiveWeather({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    debugPrint("+++++++++${width}");
    return Container(
      width: width,
      height: width*(0.6),
      margin: EdgeInsets.symmetric(horizontal: 16.0,),
      padding:EdgeInsets.all(20.0,),
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.00, -1.00),
          end: Alignment(0, 1),
          colors: [Color(0xFF3C6FD1), Color(0xFF3C6FD1), Color(0xFF7CA8FF)],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Chance of rain 60%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      // fontFamily: GoogleFonts.poppinsTextTheme().
                      //   s
                      // ),
                      fontWeight: FontWeight.w400,
                      // height: 0.07,
                    ),
                  ),
                  Text(
                    'Partly Cloudy',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      // fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,

                    ),
                  )
                ],
              ),
              Image.asset(
                  "assets/cloudy_weather.png",
                height: width/4.0,
                // width: width/4.0,
                fit: BoxFit.fill,
              )
            ],
          ),
          Row(
            children: [
              Icon(Icons.location_pin,color: Colors.white,),
              Text(
                'Washington DC, USA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  // fontFamily: 'Poppins Medium',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: width/6.0,
                height: width/10.0,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: SizedBox(
                        width: 44.83,
                        height: 40,
                        child: Text(
                          '72',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            // fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            // height: 0,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 51.09,
                      top: 4.0,
                      child: SizedBox(
                        width: 5.52,
                        height: 13.86,
                        child: Text(
                          'F',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            // fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            // height: 0,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 41.50,
                      top: 10.0,
                      child: Container(
                        width: 4.83,
                        height: 4.62,
                        decoration: ShapeDecoration(
                          shape: OvalBorder(
                            side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignOutside,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SvgPicture.asset("assets/weather-hail.svg"),
                  ),
                  Text(
                    '10%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      // fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      // height: 0.11,
                      // letterSpacing: 0.30,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SvgPicture.asset("assets/weather-sunny.svg"),
                  ),
                  Text(
                    '0.5',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      // fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      // height: 0.11,
                      // letterSpacing: 0.30,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SvgPicture.asset("assets/weather-windy.svg"),
                  ),
                  Text(
                    '124 mp/h',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      // fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      // height: 0.11,
                      // letterSpacing: 0.30,
                    ),
                  )
                ],
              ),
              // Stack(
              //   children: [
              //     Text(
              //         "72",
              //       style: TextStyle(
              //             color: Colors.white,
              //             fontSize: 24,
              //             fontFamily: 'Poppins',
              //             fontWeight: FontWeight.w700,
              //             height: 0,
              //           ),
              //     ),
              //     Positioned(
              //
              //       child: Text(
              //           '\u00B0F',
              //         style: TextStyle(
              //                   color: Colors.white,
              //                   fontSize: 12,
              //                   fontFamily: 'Poppins',
              //                   fontWeight: FontWeight.w400,
              //                   height: 0,
              //                 ),
              //       ),
              //     ),
              //     // Text(data),
              //   ],
              // ),
              // RichText(
              //   text: TextSpan(
              //     children: [
              //       TextSpan(text: '72', style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 24,
              //     fontFamily: 'Poppins',
              //     fontWeight: FontWeight.w700,
              //     // height: 0,
              //   ),),
              //       // TextSpan(text: '', ),
              //       TextSpan(text: '\u00B0F',style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 12,
              //         fontFamily: 'Poppins',
              //         fontWeight: FontWeight.w400,
              //         // height: 0,
              //       ),),
              //     ],
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
