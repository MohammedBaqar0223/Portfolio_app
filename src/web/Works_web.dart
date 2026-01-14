import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components.dart';

class WorksWeb extends StatefulWidget {
  const WorksWeb({super.key});

  @override
  State<WorksWeb> createState() => _WorksWebState();
}

class _WorksWebState extends State<WorksWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 75.0,
              backgroundColor: Colors.tealAccent,
              child: CircleAvatar(
                radius: 72.0,
                backgroundColor: Colors.black,
                backgroundImage: AssetImage("assests/me.jpg"),
              ),
            ),
            SizedBox(height: 10.0),
            Sansbold("Mohammed Baqar", 10.0),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () async {
                    await launch('https://www.instagram.com/baqar0223/');
                  },
                  icon: SvgPicture.asset(
                    "assests/instagram.svg",
                    color: Colors.tealAccent,
                    width: 25.0,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await launch('http://github.com/MohammedBaqar0223/');
                  },
                  icon: SvgPicture.asset(
                    "assests/github.svg",
                    color: Colors.tealAccent,
                    width: 25.0,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await launch('http://www.linkedin.com/in/mohammedbaqar');
                  },
                  icon: SvgPicture.asset(
                    "assests/download.svg",
                    color: Colors.tealAccent,
                    width: 25.0,
                  ),
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
              backgroundColor: Colors.black,
              iconTheme: IconThemeData(size: 25.0, color: Colors.tealAccent),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assests/works.jpg",
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
              title: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Spacer(flex: 3),
                    TabsWeb("Home", '/'),
                    Spacer(flex: 3),
                    TabsWeb("Works", '/works'),
                    Spacer(flex: 3),
                    TabsWeb("Blog", '/blog'),
                    Spacer(flex: 3),
                    TabsWeb("About me", '/about'),
                    Spacer(flex: 3),
                  ],
                ),
              ),
            ),
          ];
        },
        body: ListView(
          children: [
            Column(
              children: [
                Sansbold("Works", 30.0, color: Colors.tealAccent),
                Row(
                  children: [
                    Anime(
                      imagepath: "assests/Screen.png",
                      height: 200.0,
                      width: 300.0,
                      text: "Portfolio App",
                      fit: BoxFit.contain,
                    ),
                    Spacer(),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width)/2.0,
                      child: Column(
                        children: [
                          SizedBox(height: 10.0),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: sans(
                              "Deployed on Android, IOS and Web, the portfolio project was truly an achievement. I used Flutter to develop the beautiful and responsive UI and Firebase for the back-end.",
                              15.0,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
