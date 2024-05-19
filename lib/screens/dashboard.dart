import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moniepoint/components/searchField.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}
final style =  GoogleFonts.ptSerif();

class _DashboardState extends State<Dashboard> with SingleTickerProviderStateMixin {
   late AnimationController controller;
   late Animation<double> _animation;
  List<IconData> icons = [Icons.search_outlined,Icons.message,
    Icons.access_time_filled_sharp,Icons.heart_broken,Icons.padding_rounded
  ];
  int selectedIndex = 2;

   bool get isForwardAnimation =>
      controller.status == AnimationStatus.forward ||
      controller.status == AnimationStatus.completed;


   Future toggleHeader() => selectedIndex ==2 ? controller.reverse() :controller.forward();

  Container dynamicIcons({IconData? iconData}) {
    return Container(
      width: 50,
      height: 50,
      decoration:  const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0XFF737373),
      ),
      child:  Center(child: Icon(iconData,color: Colors.grey.shade400,)),
    );
  }
   final iconColor = const Color(0XFFBDBDBD);
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000), // Adjust duration as needed
    );
    _animation = Tween<double>(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
    controller.forward();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 70,
        width: MediaQuery.of(context).size.width /1.4,
        margin:const EdgeInsets.only(bottom: 6),
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0XFF2B2B2B),
          borderRadius: BorderRadius.circular(50)
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
          return  buildContainer(onTap: (){
            // toggleHeader();
            controller.forward();
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
      body: SingleChildScrollView(
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
                               Container(
                                 margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.02),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     SlideTransition(
                                       position: Tween<Offset>(
                                         begin: const Offset(-1, 0),
                                         end: Offset.zero,
                                       ).animate(controller),
                                       child:  Container(
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
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                         Text("RENT",style: style.copyWith(fontSize: 15,color: const Color(0XFFA5957E)),),
                                         Column(
                                           children: [
                                             Text("2212",style: style.copyWith(fontSize: 25,fontWeight: FontWeight.bold,color: const Color(0XFFA5957E)),),
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
                     top:500.0,
                     // left: 20,
                     child:
                     Container(
                       height: 24,
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
             Column(
               children: [
                 imageContainer(width: MediaQuery.of(context).size.width/1.09,height: 200,image: "assets/kitchen4.jpg"),
                 // ClipRRect(
                 //   borderRadius: BorderRadius.circular(10),
                 //   child: SizedBox(
                 //     width: MediaQuery.of(context).size.width/1.09,
                 //       child: Image.asset("assets/kitchen1.jpg",)),
                 // ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 17,vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      imageContainer(width: MediaQuery.of(context).size.width/2.3,height: 400,image: "assets/kitchen1.jpg"),
                      Column(
                        children: [
                          imageContainer(width: MediaQuery.of(context).size.width / 2.3,height: 195,image: "assets/kitchen3.jpg"),
                          const SizedBox(height: 10,),
                          imageContainer(width: MediaQuery.of(context).size.width / 2.3,height: 195,image: "assets/kitchen2.jpg"),
                        ],
                      )
                    ],
                  ),
                )
              ],
             )
           ]else if(selectedIndex ==0)...[
             Container(
               height: MediaQuery.of(context).size.height,
               decoration: const BoxDecoration(
                 image: DecorationImage(image: AssetImage("assets/moscow.jpg"),fit: BoxFit.cover)
               ),
               child: Container(
                 margin: const EdgeInsets.symmetric(horizontal: 30),
                 child: SafeArea(
                   child: Column(
                     children: [
                       const SizedBox(height: 20,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           const SearchField(showPrefixIcon: true,hintText: "Saint Petersburg",),
                           Container(
                             width: 50,
                             height: 50,
                             decoration:  const BoxDecoration(
                               shape: BoxShape.circle,
                               color: Colors.white,
                             ),
                             child: const Center(child: Icon(Icons.sort,color: Colors.grey,)),
                           ),
                         ],
                       ),
                       SizedBox(height: MediaQuery.of(context).size.height*0.07,),
                       buildAlignLocations(position: Alignment.center),
                       const SizedBox(height: 10,),
                       Container(
                         margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.1),
                         child: buildAlignLocations(position: Alignment.center),
                       ),
                       buildAlignLocations(position: Alignment.centerRight),
                       const SizedBox(height: 40,),
                       buildAlignLocations(position: Alignment.centerRight),
                       Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.1),
                          child: buildAlignLocations(
                              position: Alignment.centerLeft)),
                       Container(
                          margin: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.1),
                          child: buildAlignLocations(
                              position: Alignment.centerRight)),
                       SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.end,
                         children: [
                           Column(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               dynamicIcons(iconData: Icons.cloud_rounded),
                               SizedBox(height: 5,),
                               dynamicIcons(iconData: Icons.location_on),
                             ],
                           ),
                           Container(
                             padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                             decoration: BoxDecoration(
                              color: const Color(0XFF737373),
                               borderRadius: BorderRadius.circular(30)
                             ),
                             child: Row(
                               children: [
                                  Icon(Icons.sort_sharp,color: iconColor,),
                                 Text("List of variants",style: style.copyWith(color: iconColor),)
                               ],
                             ),
                           )
                         ],
                       ),
                    ],
                   ),
                 ),
               ),
             )
           ]else ...[
             Text("NOTHING TO RENDER",)
           ]
          ],
        )
      ),
    );
  }


  Align buildAlignLocations({AlignmentGeometry? position}) {
    return Align(
      alignment: position!,
      child: Container(
        height: 50,
        // width: 50,
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 13),
        decoration: const BoxDecoration(
            color: Color(0XFFFC9E11),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
                topLeft: Radius.circular(12))),
        child: const Icon(
          Icons.blinds_closed_outlined,
          color: Colors.white,
        ),
      ),
    );
  }

  Container imageContainer({double? width,String? image, double? height}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image:  DecorationImage(
          image: AssetImage(
            image!,
          ),
          fit: BoxFit.cover,
        ),
      ),
      clipBehavior: Clip.antiAlias, 
       child:  Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 7,horizontal: 7),
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color(0XFFCDC8C1)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            const Text("Gladkova.., 25"),
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50)
              ),
              child: const Icon(Icons.arrow_forward_ios_rounded,size: 9,),
            )
          ],
        ),
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
