import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}
final style =  GoogleFonts.ptSerif();

class _DashboardState extends State<Dashboard> {
  List<IconData> icons = [Icons.search_outlined,Icons.message,
    Icons.access_time_filled_sharp,Icons.heart_broken,Icons.padding_rounded
  ];
  int selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 70,
        width: MediaQuery.of(context).size.width /1.4,
        margin:EdgeInsets.symmetric(vertical: 25),
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        decoration: BoxDecoration(
          color: Color(0XFF2B2B2B),
          borderRadius: BorderRadius.circular(50)
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
          return  buildContainer(onTap: (){
            setState(() {
              selectedIndex = index;
            });
          },icon: icons[index],color:selectedIndex== index ? const Color(0XFFFC9E11):Colors.transparent,index: index );
        },itemCount: 5,)
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     buildContainer(onTap: (){},icon: Icons.search_outlined),
        //     buildContainer(onTap: (){},icon: Icons.message),
        //     buildContainer(onTap: (){},icon: Icons.access_time_filled_sharp),
        //     buildContainer(onTap: (){},icon: Icons.heart_broken),
        //     buildContainer(onTap: (){},icon: Icons.padding_rounded),
        //
        //   ],
        // ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
             if(selectedIndex == 2)...[
               Stack(
                 fit: StackFit.loose,
                 clipBehavior: Clip.none,
                 children: [
                   Column(
                     children: [
                       Container(
                         padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 20),
                         decoration: const BoxDecoration(
                             gradient: LinearGradient(
                               begin: Alignment.centerLeft,
                               end: Alignment.bottomRight,
                               tileMode: TileMode.mirror,
                               colors: [Color(0xFFF8F7F6), // Top color (lighter shade of orange)
                                 Color(0xFFF8F0E6),Color(0xFFFBDAB5), ],
                               // Color(0xFFF8F0E6)
                             )
                         ),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Column(
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
                                 const SizedBox(height: 30,),
                                 Text("Hi Marina",style: style.copyWith(fontSize: 20,color: const Color(0XFFA5967F)),),
                                 Text(
                                   "let's select your \nperfect place",
                                   style: style.copyWith(
                                       fontSize: 34, color: const Color(0XFF232220),fontWeight: FontWeight.w500),
                                 ),
                                 const SizedBox(height: 30,),
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
                                               Text("1034",style: style.copyWith(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
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
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Text("RENT",style: style.copyWith(fontSize: 15,color: const Color(0XFFA5957E)),),
                                           Column(
                                             children: [
                                               Text("2212",style: style.copyWith(fontSize: 30,fontWeight: FontWeight.bold,color: const Color(0XFFA5957E)),),
                                               Text("Offers",style: style.copyWith(fontSize: 15,color:const Color(0XFFA5957E)),)
                                             ],
                                           ),
                                           const SizedBox(),
                                         ],
                                       ),
                                     ),
                                   ],
                                 ),
                               ],
                             ),
                           ],
                         ),
                       ),

                     ],
                   ),
                   Positioned(
                       top:470.0,
                       // left: 20,
                       child:
                       Container(
                         height: 50,
                         width: MediaQuery.of(context).size.width,
                         decoration: const BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)
                             )
                         ),
                       )
                   ),
                 ],
               ),
               SizedBox(
                 height: 500,
                 width: 200,
                 child: ListView.builder(itemBuilder: (context,index){
                   return Container(
                     height: 200,
                     width: 100,
                     margin: EdgeInsets.symmetric(vertical: 10),
                     decoration: BoxDecoration(
                         color: Colors.greenAccent,
                         borderRadius: BorderRadius.circular(10)
                     ),
                   );
                 },itemCount: 4,),
               )
             ]else if(selectedIndex ==0)...[
               Text("MAP VIEW")
             ]else ...[
               Text("NOTHING TO RENDER")
             ]
            ],
          )
        ),
      ),
    );
  }

  Widget buildContainer({void Function()? onTap, IconData? icon,Color? color,int? index}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        margin: EdgeInsets.only(left:index == 0? 10:0),
        // padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              decoration:  BoxDecoration(
                shape: BoxShape.circle,
                color: color!,
              ),
              child: Container(
                // margin: EdgeInsets.only(left:index == 0? 10:0),
                  child: Center(child: Icon(icon,color: Colors.white,))),
            ),
    );
  }
}
