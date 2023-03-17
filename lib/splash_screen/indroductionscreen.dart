// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fluttersocial_app/login/loginscreen.dart';
import 'package:fluttersocial_app/splash_screen/intropagestyle.dart';



class Intro1 extends StatefulWidget {
  Intro1({Key? key}) : super(key: key);

  @override
  State<Intro1> createState() => _Intro1State();
}

class _Intro1State extends State<Intro1> {
  var page = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height - 10,
        width: MediaQuery.of(context).size.width,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Stack(children: [
                    Container(
                      // color: Colors.green,
                      decoration: gradientcolorbox,
                      height: MediaQuery.of(context).size.height / 1.9,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 31),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle
                      ),
                      child: Center(
                        child: CircleAvatar(
                          radius: 45,
                          backgroundImage: AssetImage("assets/intrologo.jpg"),
                            ),
                      ),
                    ),
                    Visibility(
                      visible: page == 1,
                      child: Container(
                        margin: logo_cont,
                        child: Center(
                          child: Image.asset(
                            'assets/intro1.jpg',
                            height: MediaQuery.of(context).size.height / 3 - 18,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                        visible: page == 2,
                        child: Container(
                          margin: logo_cont,
                          child: Center(
                            child: Image.asset(
                              'assets/intro2.jpg',
                              height:
                                  MediaQuery.of(context).size.height / 3 - 18,
                              width: double.infinity,
                              
 fit: BoxFit.fill,
                            ),
                          ),
                        )),
                    Visibility(
                        visible: page == 3,
                        child: Container(
                          margin: EdgeInsets.only(top: 150),
                          child: Image.asset(
                            'assets/intro3.jpg',
                            height:
                                MediaQuery.of(context).size.height / 3 - 18,
                            width: double.infinity,
                             fit: BoxFit.fill,
                          ),
                        ))
                  ]),
                  Container(
                    margin: learn_cont,
                    child: Center(
                      child: page == 1
                          ? Text(
                              'Breaking News',
                              style: learning,
                              textAlign: TextAlign.center,
                            )
                          : page == 2
                              ? Text(
                                  ' Event Activity',
                                  style: learning,
                                  textAlign: TextAlign.center,
                                )
                              : Text(
                                  'Sports News',
                                  style: learning,
                                  textAlign: TextAlign.center,
                                ),
                    ),
                  ),
                  Container(
                    height: 47,
                    width: double.infinity,
                    margin: H1_contmargin,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16),
                      child: Center(
                        child: Text(
                          'This the online news platform by the india today',
                          style: H1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (page < 3) {
                        setState(() {
                          page = page + 1;
                        });
                      } else {
                        Navigator.popUntil(context, (route) => false);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                       
                      }
                    },
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 24),
                        height: 48,
                        width: 152,
                        decoration: containernext,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: page == 1 || page == 2
                                  ? Text(
                                      'Next',
                                      style: next,
                                    )
                                  : Text(
                                      'Continue',
                                      style: next,
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 24, bottom: 16),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedContainer(
                              width: page == 1 ? 40 : 4,
                              height: 4,
                              decoration:
                                  page == 1 ? indication1 : inidication3,
                              duration: Duration(milliseconds: 400),
                              curve: Curves.fastOutSlowIn,
                            ),
                            AnimatedContainer(
                              margin: EdgeInsets.only(left: 4),
                              width: page == 2 ? 40 : 4,
                              height: 4,
                              decoration:
                                  page == 2 ? indication1 : inidication3,
                              duration: Duration(milliseconds: 400),
                              curve: Curves.fastOutSlowIn,
                            ),
                            AnimatedContainer(
                              margin: EdgeInsets.only(left: 4),
                              width: page == 3 ? 40 : 4,
                              height: 4,
                              decoration:
                                  page == 3 ? indication1 : inidication3,
                              duration: Duration(milliseconds: 400),
                              curve: Curves.fastOutSlowIn,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ]),
      ),
    ));
  }
}
