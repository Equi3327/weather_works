import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WindConditions extends StatelessWidget {
  const WindConditions({super.key});

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
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Conditions',
                      style: TextStyle(
                        color: Color(0xFFA098AE),
                        fontSize: 16,
                        // fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        // height: 0,
                      ),
                    ),
                    Text(
                      "Pressure",
                      style: TextStyle(
                        color: Color(0xFF363B64),
                        fontSize: 24,
                        // fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                        letterSpacing: 0.30,
                      ),
                    )
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: SvgPicture.asset(
                  "assets/jam_menu.svg",
                  height: width/12.0,
                  // width: width/4.0,
                  fit: BoxFit.fill,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: SizedBox(
              height: 45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.air_rounded,size: 80.0,color: Color(0xFF363B64),),
                  Container(
                    margin: const EdgeInsets.only(top:10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Wind',style: TextStyle(
                          color: Color(0xFFA098AE),
                          fontSize: 16,
                          // fontFamily: 'Poppins Medium',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: 0.30,
                        ),),
                        Text('124 mp/h',style: TextStyle(
                          color: Color(0xFF363B64),
                          fontSize: 18,
                          // fontFamily: 'Poppins Medium',
                          fontWeight: FontWeight.w600,
                          height: 0.06,
                        ),),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top:10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Barometer',style: TextStyle(
                          color: Color(0xFFA098AE),
                          fontSize: 16,
                          // fontFamily: 'Poppins Medium',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: 0.30,
                        ),),
                        Text('972 mBar',style: TextStyle(
                          color: Color(0xFF363B64),
                          fontSize: 18,
                          // fontFamily: 'Poppins Medium',
                          fontWeight: FontWeight.w600,
                          height: 0.06,
                        ),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // ListTile(
          //   // minLeadingWidth:100,
          //   minVerticalPadding: 0.0,
          //   leading: Icon(Icons.air_rounded,size: 60.0,),
          //     iconColor: Color(0xFF363B64),
          //     title: Text('Wind'),
          //     titleTextStyle: TextStyle(
          //       color: Color(0xFFA098AE),
          //       fontSize: 16,
          //       // fontFamily: 'Poppins Medium',
          //       fontWeight: FontWeight.w400,
          //       height: 0,
          //       letterSpacing: 0.30,
          //     ),
          //     subtitleTextStyle:TextStyle(
          //       color: Color(0xFF363B64),
          //       fontSize: 18,
          //       // fontFamily: 'Poppins Medium',
          //       fontWeight: FontWeight.w600,
          //       height: 0.06,
          //       letterSpacing: 0.30,
          //     ),
          //     subtitle: Text('124 mp/h'),
          //     trailing: Column(
          //       mainAxisSize: MainAxisSize.min,
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Text('Barometer',style: TextStyle(
          //           color: Color(0xFFA098AE),
          //           fontSize: 16,
          //           // fontFamily: 'Poppins Medium',
          //           fontWeight: FontWeight.w400,
          //           height: 0,
          //           letterSpacing: 0.30,
          //         ),),
          //         Text('972 mBar',style: TextStyle(
          //           color: Color(0xFF363B64),
          //           fontSize: 18,
          //           // fontFamily: 'Poppins Medium',
          //           fontWeight: FontWeight.w600,
          //           height: 0.06,
          //           letterSpacing: 0.30,
          //         ),),
          //       ],
          //     )
          // ),
        ],
      ),
    );
  }
}
