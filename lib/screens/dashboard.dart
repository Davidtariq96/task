import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}
final style =  GoogleFonts.ptSerif();

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.bottomRight,
                  tileMode: TileMode.mirror,
                  colors: [Color(0xFFF8F7F6), // Top color (lighter shade of orange)
                    Color(0xFFF8F0E6),Color(0xFFFBDAB5), ],
                )
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.location_on,color: Colors.grey.shade500,),
                            Text("Saint Petersburg",style: GoogleFonts.ptSerif(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w400
                            ),)
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        child: const CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage("assets/profile.jpg"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Text("Hi Marina",style: style.copyWith(fontSize: 20,color: const Color(0XFFA5967F)),),
                  Text(
                    "let's select your \nperfect place",
                    style: style.copyWith(
                        fontSize: 34, color: const Color(0XFF232220),fontWeight: FontWeight.w500),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width /2.4,
                        height: 160,
                        padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 20),
                        decoration: const BoxDecoration(
                         shape: BoxShape.circle,
                          color: Color(0XFFFC9E11)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("BUY",style: style.copyWith(fontSize: 15,color: Colors.white),),
                            Column(
                              children: [
                                Text("1034",style: style.copyWith(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                                Text("Offers",style: style.copyWith(fontSize: 15,color: Colors.white),)
                              ],
                            ),
                            const SizedBox()
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width /2.4,
                        height: 160,
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white
                        ),
                        child: Column(
                          children: [
                            Text("RENT",style: style.copyWith(fontSize: 15,color: const Color(0XFFA5957E)),),
                            Column(
                              children: [
                                Text("2212",style: style.copyWith(fontSize: 20,fontWeight: FontWeight.bold,color: const Color(0XFFA5957E)),),
                                Text("Offers",style: style.copyWith(fontSize: 15,color:const Color(0XFFA5957E)),)
                              ],
                            ),
                           const SizedBox(),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
