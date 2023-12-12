import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutterweb/data/data.dart';
import 'package:flutterweb/firebase_options.dart';
import 'package:flutterweb/model/project_details.dart';
import 'package:flutterweb/responsive.dart';
import 'package:flutterweb/screens/banner_area.dart';
import 'package:flutterweb/tail.dart';
import 'package:flutterweb/utils/common_string.dart';
import 'package:flutterweb/utils/text_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
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
    return Scaffold(
      body: Column(
        children: [
          ColoredBox(
            color: const Color.fromARGB(255, 215, 237, 255).withOpacity(0.5),
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
                    const Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          CommonString.work,
                          style: regular,
                        ),
                        SizedBox(width: 20),
                        Text(
                          CommonString.about,
                          style: regular,
                        ),
                        SizedBox(width: 20),
                        Text(
                          CommonString.contact,
                          style: regular,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          PortfolioBanner(
            image: '../asset/images/js.png',
            h1: 'werwer',
            subtitle: 'ewer',
            socialMediaLinks: [],
          ),
          Expanded(
              child: Container(
            constraints: BoxConstraints(minWidth: 100, maxWidth: 900),
            child: GridView.custom(
              gridDelegate: SliverStairedGridDelegate(
                crossAxisSpacing: XmpResponsive.isWeb(context) ? 10 : 0,
                mainAxisSpacing: XmpResponsive.isWeb(context) ? 24 : 20,
                startCrossAxisDirectionReversed: true,
                pattern: [
                  XmpResponsive.isWeb(context)
                      ? StairedGridTile(0.5, 1)
                      : StairedGridTile(1, 1),
                  XmpResponsive.isWeb(context)
                      ? StairedGridTile(0.5, 3 / 4)
                      : StairedGridTile(1, 1),
                  XmpResponsive.isWeb(context)
                      ? StairedGridTile(1.0, 10 / 4)
                      : StairedGridTile(1, 1),
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
          )),
        ],
      ),
    );
  }
}
