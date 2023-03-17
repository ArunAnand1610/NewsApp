// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttersocial_app/HomeScreen/HomeModel/bookmarkeddata.dart';
import 'package:fluttersocial_app/HomeScreen/HomeModel/homenews.dart';
import 'package:fluttersocial_app/HomeScreen/HomeModel/newsmodel.dart';
import 'package:fluttersocial_app/Provider/newsprovider.dart';
import 'package:fluttersocial_app/core/apiservice.dart';
import 'package:fluttersocial_app/shared/shimmer.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transition/transition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   Transition(
              //     child: CategoryScreen(),
              //     transitionEffect: TransitionEffect.LEFT_TO_RIGHT,
              //   ),
              // );
            },
            icon: const Icon(
              Icons.amp_stories_outlined,
              size: 30,
              color: Colors.red,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                'News',
                style: TextStyle(color: Color(0xff50A3A4)),
              ),
              Text(
                'Wipe',
                style: TextStyle(color: Color(0xffFCAF38)),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () async {},
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // color: Colors.amberAccent,
              margin: const EdgeInsets.only(top: 24, bottom: 24),
              height: 32,
              width: double.infinity,
              child: TabBar(
                  indicatorColor: Color(0xff007ebc),
                  labelColor: Color(0xff007ebc),
                  unselectedLabelColor: Color(0xff222222),
                  indicatorSize: TabBarIndicatorSize.tab,
                  // labelStyle: tabtext,
                  tabs: [
                    Tab(
                        child: Text(
                      'Home',
                    )),
                    Container(
                      width: 130,
                      child: Tab(
                          child: Text(
                        'Bookmarked',
                        // style: TextStyle(
                        //     fontSize:
                        //         11.2) //color: Color(0xff787878),
                      )),
                    ),
                  ]),
            ),
            Expanded(
              child: TabBarView(children: [
                HomeNews(),
               ViewBookMarkData(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
