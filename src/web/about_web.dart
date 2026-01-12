import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newpro/components.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutWeb extends StatefulWidget {
  const AboutWeb({super.key});

  @override
  State<AboutWeb> createState() => _AboutWebState();
}

class _AboutWebState extends State<AboutWeb> {
  urlLauncher(String imagepath,String link){
    return IconButton(
      icon: SvgPicture.asset(
          imagepath,
          width: 25.0,
          color: Colors.tealAccent
      ),
      onPressed: () async{
        await launchUrl(Uri.parse(link));
      },
    );
  }
  tealcontainer(String text){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.tealAccent,
            width: 2.0,
            style: BorderStyle.solid
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Text(
        text,
        style: GoogleFonts.orbitron(fontSize: 15.0,color: Colors.tealAccent),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    var widthy = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: Drawer(
          backgroundColor: Colors.black,
          child: Column(
            children: [
              SizedBox(height: 200.0,),
              CircleAvatar(
                radius: 75.0,
                backgroundImage: AssetImage("assests/me.jpg"),
              ),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  urlLauncher(
                      "assests/instagram.svg",
                      "http://instagram.com/baqar0223/"),
                  urlLauncher(
                      "assests/github.svg",
                      "http://github.com/MohammedBaqar0223/"),
                  IconButton(
                    icon: SvgPicture.asset(
                      "assests/download.svg",
                      width: 25.0,
                    ),
                    onPressed: () async{
                      await launchUrl(Uri.parse("http://www.linkedin.com/in/mohammedbaqar"));
                    },
                  )
                ],
              )
            ],
          )
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
            size: 25.0,
            color: Colors.tealAccent
        ),
        title: Row(
          children: [
            Spacer(flex: 3),
            TabsWeb("Home",'/'),
            Spacer(),
            TabsWeb("Blog",'/blog'),
            Spacer(),
            TabsWeb("Works",'/works'),
            Spacer(),
            TabsWeb("Contact",'/contact'),
            Spacer(),
          ],
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 500.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Sansbold("About me", 30.0),
                    SizedBox(height: 15.0),
                    sans(
                      "Hi, I’m Mohammed Baqar,",
                      15.0,
                    ),
                    sans(
                        "an aspiring app developer with strong interest in building cross-platform applications using Flutter."
                        ,15.0
                    ),
                    sans(
                        "I don’t claim to know everything yet, but I bring consistency, curiosity, and a strong willingness to learn. "
                        ,15.0
                    ),
                    sans(
                        "I believe growth comes from discipline and hands-on experience, and I’m committed to improving myself "
                        ,15.0
                    ),
                    sans(
                        "every day  both as a developer and as an individual."
                        ,15.0
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      children: [
                        tealcontainer("FLutter"),
                        SizedBox(width: 7.0,),
                        tealcontainer("Android"),
                        SizedBox(width: 7.0,),
                        tealcontainer("FireBase"),
                        SizedBox(width: 7.0,),
                        tealcontainer("Windows")
                      ],
                    )
                  ],
                ),
                CircleAvatar(
                  radius: 107.0,
                  backgroundColor: Colors.tealAccent,
                  child: CircleAvatar(
                    radius: 103.0,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 100.0,
                      backgroundImage: AssetImage("assests/me.jpg"),
                    ),
                  )
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Anime(
                  imagepath: "assests/webL.png",
                  text: "Web Development",
              height: 250,
              width: 250,),
              SizedBox(
                width: widthy/3.0,
                child: Column(
                  children: [
                    sans("Looking to build a state-of-the-art web application designed for performance, scalability, and a seamless user experience? I’m here for you.", 15.0),
                    SizedBox(height: 10.0,),
                  ],
                )
              )
            ],
          ),
          SizedBox(height: 20.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: widthy/3.0,
                child: Column(
                  children: [
                    sans("Do you need a high-performance, responsive application that delivers smooth user experiences across all devices? I’ve got you covered.", 15.0),
                    SizedBox(height: 10.0,),
                  ]
                ),
              ),
              Anime(
                imagepath: "assests/app.png",
                text: "App Development",
                reverse: true,
                height: 250,
                width: 250,
              ),
            ],
          ),
          SizedBox(height: 20.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Anime(
                imagepath: "assests/Firebaseyyyy.png",
                text: "App Development",
                reverse: true,
                height: 250,
                width: 250,
              ),
              SizedBox(
                width: widthy/3.0,
                child: Column(
                    children: [
                      sans(
                          "Do you need a highly scalable and secure backend built to handle growth, performance, and reliability? I’ve got you covered."
                          , 15.0
                      ),
                      SizedBox(height: 10.0,),
                    ]
                ),
              ),
              SizedBox(height: 20.0,)
            ],
          ),
          SizedBox(height: 20.0,)
        ],
      ),
    );
  }
}
