import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [

                  Container(
                      width: MediaQuery.of(context).size.width / 1.4,
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                          color: Color(0xffF4DEE1),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(200),
                              bottomLeft: Radius.circular(200))),
                      child: Column(
                        children: [

                          SizedBox(height: 20,),

                          Text(
                            " Get Delivery \n At your door \n        step",

                            style: GoogleFonts.lexend(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Choose Your Favourite Food \n of your choice By our app",
                            style: GoogleFonts.nunito(
                                fontSize: 14,
                                color: Color(0xff595D64),
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              width: 80,
                              height: 5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                color: Color(0xffEF4F5F),
                              )),
                        ],
                      )),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffEF4F5F),
                        ),
                        child: Center(
                          child: Text(
                            "Order",
                            style: GoogleFonts.lexend(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text(
                        "Now",
                        style: GoogleFonts.lexend(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 50,),

                ],
              ),
            ),

            Image(
              image: AssetImage("images/bike.webp"),
              width: 200,
              height: 200,
            )
          ],
        ),
      ),
    );
  }
}
