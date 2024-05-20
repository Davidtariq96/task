import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moniepoint/components/animatedWidget.dart';
import 'package:moniepoint/components/numberCountingAnimation.dart';
import 'package:moniepoint/components/searchField.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}
final style =  GoogleFonts.ptSerif();

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  late Animation<double> _widthAnimation;
  List<String> icons = ["assets/search.png","assets/message.png",
   "assets/home.png","assets/heart.png","assets/user.png"
  ];
  CustomAnimatedWidgetState customAnimatedWidgetState = CustomAnimatedWidgetState();
  int selectedIndex = 2;
  bool showContainer = false;
   final GlobalKey<CustomAnimatedWidgetState> fadeInKey = GlobalKey<CustomAnimatedWidgetState>();
   final GlobalKey<CustomAnimatedWidgetState> slideInKey = GlobalKey<CustomAnimatedWidgetState>();
  final GlobalKey<CustomAnimatedWidgetState> countKey = GlobalKey<CustomAnimatedWidgetState>();

  bool shouldAnimate = true;

  void toggleAnimation() {
    setState(() {
      shouldAnimate = false;
    });
  }



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
    // _controller = AnimationController(
    //   vsync: this,
    //   duration: Duration(milliseconds: 500),
    // );
    // _widthAnimation = Tween<double>(
    //   begin: 50, // Initial width
    //   end: 100, // Final width
    // ).animate(_controller);
    // TODO: implement initState
    super.initState();
  }
  void _toggleExpansion() {
    setState(() {
      showContainer = !showContainer;
    });
  }

  @override
  void dispose() {
    // _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FutureBuilder(future: Future.delayed(const Duration(milliseconds: 1400)), builder: (context,snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
          );
        }else{
          return CustomAnimatedWidget(
            animationType: AnimationType.slideInFromBottom,
            child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width /1.4,
                margin:const EdgeInsets.only(bottom: 5),
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                decoration: BoxDecoration(
                    color: const Color(0XFF2B2B2B),
                    borderRadius: BorderRadius.circular(50)
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return  buildContainer(onTap: (){
                      setState(() {
                        selectedIndex = index;
                      });
                      if(selectedIndex ==0){
                        fadeInKey.currentState?.repeatAnimation();
                        slideInKey.currentState?.repeatAnimation();
                      }
                    },icon: icons[index],color:selectedIndex== index ? const Color(0XFFFC9E11):const Color(0XFF232220),index: index );
                  },itemCount: 5,)
            ),
          );
        }
      }),
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
                                     CustomAnimatedWidget(animationType: AnimationType.slideIn,
                                         child: Container(
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
                                     )),
                                     CustomAnimatedWidget(faded: false,animationType: AnimationType.fadeIn, child:  Container(
                                       margin: const EdgeInsets.only(top: 8),
                                       child: const CircleAvatar(
                                         radius: 30,
                                         backgroundImage: AssetImage("assets/profile.jpg"),
                                       ),
                                     ),),

                                   ],
                                 ),
                               ),
                               const SizedBox(height: 30,),
                               CustomAnimatedWidget(animationType: AnimationType.slideInFromBottom,child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                 Text("Hi Marina",style: style.copyWith(fontSize: 20,color: const Color(0XFFA5967F)),),
                                 Text(
                                   "let's select your \nperfect place",
                                   style: style.copyWith(
                                       fontSize: 34, color: const Color(0XFF232220),fontWeight: FontWeight.w500),
                                 ),
                               ],),),
                               const SizedBox(height: 30,),
                               // Text("${_countingAnimation.value}"),
                               CustomAnimatedWidget(
                                 faded: true,
                                 animationType: AnimationType.fadeIn,
                                 child: Row(
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
                                               const NumberCountingAnimation(startNumber: 850, endNumber: 1034, duration: Duration(milliseconds: 2000), color: Colors.white,),
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
                                               const NumberCountingAnimation(startNumber: 1790, endNumber: 2212, duration: Duration(milliseconds: 2400), color: Color(0XFFA5957E),),
                                               Text("Offers",style: style.copyWith(fontSize: 15,color:const Color(0XFFA5957E)),)
                                             ],
                                           ),
                                           const SizedBox(),
                                         ],
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                             ],
                           ),
                         ],
                       ),
                     ),

                   ],
                 ),
                FutureBuilder(future: Future.delayed(const Duration(milliseconds: 1000)), builder: (context,snap){
                  if (snap.connectionState == ConnectionState.waiting) {
                    return Container(
                    );
                  }else{
                    return  Positioned(
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
                    );
                  }
                })

               ],
             ),
             FutureBuilder(
              future: Future.delayed(const Duration(milliseconds: 500)),
              builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    height: MediaQuery.of(context).size.height*0.7,
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
                  ); // Display a loading indicator while waiting
                } else {
                  return CustomAnimatedWidget(
                    addSpeed: true,
                    animationType: AnimationType.slideInFromBottom,
                    child: Column(
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
                    ),);
                }

              },
            ),
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
                       CustomAnimatedWidget(
                         animationType: AnimationType.slideInFromTop,
                         child: Row(
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
                       showContainer ? SizedBox(height: 50,):SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.end,
                         children: [
                           CustomAnimatedWidget(
                             animationType: AnimationType.slideIn,
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 InkWell(
                                   onTap: (){
                                    _toggleExpansion();
                                   },
                                     child:showContainer? CustomAnimatedWidget(
                                       animationType: AnimationType.fadeIn,child:
                                     Container(
                                       margin:  EdgeInsets.only(left:showContainer? 20: 60),
                                       padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                       height: 120,width: 120,decoration:
                                     BoxDecoration(color: const Color(0XFFF9F7F2),
                                         borderRadius: BorderRadius.circular(10)),
                                       child:  Column(
                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                         children: [
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                             children: [
                                               const Icon(Icons.car_crash,color: Colors.grey),
                                               Text("copy text",style: style.copyWith(color: Colors.grey))
                                             ],
                                           ),
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                             children: [
                                               const Icon(Icons.access_time_filled,color: Colors.grey,),
                                               Text("dummy text",style: style.copyWith(color: Color(0XFFFC9E11)),)
                                             ],
                                           ),
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                             children: [
                                               const Icon(Icons.add,color: Colors.grey),
                                               Text("dummy text",style: style.copyWith(color: Colors.grey))
                                             ],
                                           ),
                                         ],
                                       ),
                                     ),)
                                        :dynamicIcons(iconData: Icons.cloud_rounded)),
                                 const SizedBox(height: 5,),
                                 Container(margin: EdgeInsets.only(left:showContainer? 20: 0),child: dynamicIcons(iconData: Icons.location_on)),
                               ],
                             ),
                           ),
                           CustomAnimatedWidget(
                             animationType: AnimationType.slideRight,
                             child: Container(
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
             SafeArea(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   const SizedBox(height: 40,),
                   Center(child: Text("COMING SOON",style: style,)),
                 ],
               ),
             )
           ]
          ],
        )
      ),
    );
  }


  Widget buildAlignLocations({AlignmentGeometry? position}) {
    return Align(
      alignment: position!,
      child: CustomAnimatedWidget(
        animationType: AnimationType.transform,
        isLocation: true,
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
          child:Text("10 km,p/h",style: style.copyWith(color: Colors.white),)
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
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color(0XFFCDC8C1)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            CustomAnimatedWidget(
              animationType: AnimationType.fadeIn,
                faded: true,
                child: Text("Gladkova.., 25",style: style,)),
            CustomAnimatedWidget(
              animationType: AnimationType.slideIn,
              fastSlide: true,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50)
                ),
                child: const Icon(Icons.arrow_forward_ios_rounded,size: 9,),
              ),
            )
          ],
        ),
      ),
    ),
    );
  }

  Widget buildContainer({void Function()? onTap, String? icon,Color? color,int? index}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 45,
        height: 45,
        margin:EdgeInsets.symmetric(horizontal:3.5 ),
        // padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              decoration:  BoxDecoration(
                shape: BoxShape.circle,
                color: color!,
              ),
              child: Center(child: Image.asset(icon!,width: 25,height: 25,)),
            ),
    );
  }
}
