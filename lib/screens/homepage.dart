import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutterweb/data/data.dart';
import 'package:flutterweb/firebase_options.dart';
import 'package:flutterweb/model/project_details.dart';
import 'package:flutterweb/responsive.dart';
import 'package:flutterweb/screens/aboutMePage.dart';
import 'package:flutterweb/screens/banner_area.dart';
import 'package:flutterweb/screens/contactMe.dart';
import 'package:flutterweb/tail.dart';
import 'package:flutterweb/utils/common_string.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageView> {
  @override
  void initState() {
    firebase();
    super.initState();
  }

  firebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double textSize = screenWidth > 600 ? 24.0 : 10.0;
    double textSizeSmall = screenWidth > 600 ? 15.0 : 8.0;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // onStretchTrigger: () {
            //   return ;
            // },
            automaticallyImplyLeading: false,
            expandedHeight: 120.0,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                  'Sundar nivash',
                  style: GoogleFonts.lexend(
                      color: Colors.black87, fontSize: textSize),
                ),
              ),
              background: ColoredBox(
                color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.all(10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: const Image(
                                image: AssetImage('../asset/images/js.png'),
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        !XmpResponsive.isMobile(context)
                            ? Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(CommonString.work,
                                      style: GoogleFonts.lexend()),
                                  SizedBox(width: 20),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AboutMePage()));

                                      print('Contact text clickesdd!');
                                    },
                                    child: Text(
                                      CommonString.about,
                                      style: GoogleFonts.lexend(),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  contactMePage()));

                                      print('Contact text clickesdd!');
                                    },
                                    child: Text(
                                      CommonString.contact,
                                      style: GoogleFonts.lexend(),
                                    ),
                                  ),
                                ],
                              )
                            : PopupMenuButton<String>(
                                onSelected: (value) {
                                  // Handle menu item selection
                                  if (value == 'work') {
                                    // Handle "Work" action
                                    print('Work clicked');
                                  } else if (value == 'about') {
                                    // Handle "About" action
                                    print('About clicked');
                                  } else if (value == 'contact') {
                                    // Handle "Contact" action
                                    print('Contact clicked');
                                  }
                                },
                                itemBuilder: (BuildContext context) {
                                  return [
                                    PopupMenuItem<String>(
                                      value: 'work',
                                      child: Text('Work'),
                                    ),
                                    PopupMenuItem<String>(
                                      value: 'about',
                                      child: Text('About'),
                                    ),
                                    PopupMenuItem<String>(
                                      value: 'contact',
                                      child: Text('Contact'),
                                    ),
                                  ];
                                },
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                    width: XmpResponsive.isWeb(context)
                        ? 900
                        : XmpResponsive.deviceWidth(context),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 197, 228, 238),
                          Color.fromARGB(255, 196, 255, 211),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Column(children: [
                      Text("sdfasdfasdfasdf",
                          style: GoogleFonts.lexend(
                            color: Colors.black87,
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          )
                          // TextStyle(
                          //   color: Colors.black87,
                          //   fontFamily: 'Raleway',
                          //   fontSize: 32,
                          //   fontWeight: FontWeight.bold,
                          // ),
                          ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Text("fasdfasdfasdfasdfadf",
                            style: GoogleFonts.lexend(
                              color: Colors.black87,
                              textStyle:
                                  Theme.of(context).textTheme.displayLarge,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: socialMediaLinks
                            .map((link) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    link.icon,
                                    color:
                                        const Color.fromARGB(255, 155, 74, 74),
                                    size: 30,
                                  ),
                                ))
                            .toList(),
                      ),
                    ])),
                Container(
                  width: XmpResponsive.isWeb(context)
                      ? 900
                      : XmpResponsive.deviceWidth(context),
                  child: GridView.custom(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverStairedGridDelegate(
                      crossAxisSpacing: XmpResponsive.isWeb(context) ? 10 : 0,
                      mainAxisSpacing: XmpResponsive.isWeb(context) ? 24 : 20,
                      startCrossAxisDirectionReversed: true,
                      pattern: [
                        XmpResponsive.isWeb(context)
                            ? const StairedGridTile(0.5, 1)
                            : const StairedGridTile(1, 1),
                        XmpResponsive.isWeb(context)
                            ? const StairedGridTile(0.5, 3 / 4)
                            : const StairedGridTile(1, 1),
                        XmpResponsive.isWeb(context)
                            ? const StairedGridTile(1.0, 10 / 4)
                            : const StairedGridTile(1, 1),
                      ],
                    ),
                    childrenDelegate: SliverChildBuilderDelegate(
                      (context, index) {
                        ProjectDetails project = stories[index];
                        return ZoomableImage(
                          project: project,
                        );
                      },
                      childCount: stories.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 50,
                color: const Color.fromARGB(255, 119, 166, 247),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "sundar nivash | UI UX Designer | sundarnivash344@gmail.com",
                        style: GoogleFonts.lexend(
                          color: Color.fromARGB(221, 255, 255, 255),
                          fontSize: textSizeSmall,
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Social Media Icon 1
                              InkWell(
                                onTap: () {
                                  // Handle the click action for Social Media Icon 1
                                  print('Social Media Icon 1 clicked!');
                                },
                                child: Icon(
                                  Icons
                                      .facebook, // Replace with your desired icon
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              // Social Media Icon 2
                              InkWell(
                                onTap: () {
                                  // Handle the click action for Social Media Icon 2
                                  print('Social Media Icon 2 clicked!');
                                },
                                child: Icon(
                                  Icons
                                      .transfer_within_a_station_rounded, // Replace with your desired icon
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              // Social Media Icon 3
                              InkWell(
                                onTap: () {
                                  // Handle the click action for Social Media Icon 3
                                  print('Social Media Icon 3 clicked!');
                                },
                                child: Icon(
                                  Icons
                                      .transfer_within_a_station_rounded, // Replace with your desired icon
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StickyFooterDelegate extends SliverPersistentHeaderDelegate {
  _StickyFooterDelegate({required this.child});

  final Widget child;

  @override
  double get minExtent => 80.0;

  @override
  double get maxExtent => 80.0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(_StickyFooterDelegate oldDelegate) {
    return false;
  }
}
