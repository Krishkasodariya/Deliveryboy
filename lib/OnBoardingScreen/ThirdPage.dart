
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
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
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "     We have \n 6000+ Review \n   On our app",
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
                  Spacer(),
                  Container(
                      width: MediaQuery.of(context).size.width / 1.4,
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                          color: Color(0xffF4DEE1),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(200),
                              topLeft: Radius.circular(200))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
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
                                  child: Text("Order",style: GoogleFonts.lexend(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),),
                                ),
                              ),
                              Text("Now",style: GoogleFonts.lexend(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),),
                            ],
                          ),
                          SizedBox(height: 50,)
                        ],
                      )),

                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Image(
                image: AssetImage("images/phone.webp"),
                width: 200,
                height: 200,
              ),
            )
          ],
        ),
      ),
    );
  }
}
