import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components.dart';

class WorkMobile extends StatefulWidget {
  const WorkMobile({super.key});

  @override
  State<WorkMobile> createState() => _WorkMobileState();
}

class _WorkMobileState extends State<WorkMobile> {
  urlLauncher(String imagepath, String link) {
    return IconButton(
      icon: SvgPicture.asset(imagepath, width: 25.0, color: Colors.tealAccent),
      onPressed: () async {
        await launchUrl(Uri.parse(link));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        endDrawer: Drawer(
          backgroundColor: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DrawerHeader(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2.0, color: Colors.black),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assests/me.jpg',
                      fit: BoxFit.cover,
                      width: 150.0,
                    ),
                  ),
                ),
              ),
              Tabsmob(text: "Home", route: "/"),
              SizedBox(height: 10.0),
              Tabsmob(text: "About", route: "/route"),
              SizedBox(height: 10.0),
              Tabsmob(text: "Work", route: "/work"),
              SizedBox(height: 10.0),
              Tabsmob(text: "Blog", route: "/blog"),
              SizedBox(height: 10.0),
              Tabsmob(text: "Contact", route: "/contact"),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () async =>
                        await launch('https://www.instagram.com/baqar0223/'),
                    icon: SvgPicture.asset(
                      "assests/instagram.svg",
                      color: Colors.tealAccent,
                      width: 25.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () async =>
                        await launch('http://github.com/MohammedBaqar0223/'),
                    icon: SvgPicture.asset(
                      "assests/github.svg",
                      color: Colors.tealAccent,
                      width: 25.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () async => await launch(
                      'http://www.linkedin.com/in/mohammedbaqar',
                    ),
                    icon: SvgPicture.asset("assests/download.svg", width: 25.0),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 400.0,
                backgroundColor: Colors.transparent,
                iconTheme: IconThemeData(size: 35.0, color: Colors.tealAccent),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    "assests/works.jpg",
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.0,),
                Sansbold("Works", 30.0,color: Colors.tealAccent,),
                SizedBox(height: 15.0,),
                Anime(imagepath: "assests/Screen.png",
                  text: "Portfolio App",
                  fit: BoxFit.contain,
                  height: 150.0,width: 250.0,),
                SizedBox(height: 15.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: sans(
                    "Deployed on Android, IOS and Web, the portfolio project was truly an achievement. I used Flutter to develop the beautiful and responsive UI and Firebase for the back-end.",
                    15.0,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
