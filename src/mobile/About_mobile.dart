import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components.dart';

class AboutMobile extends StatefulWidget {
  const AboutMobile({super.key});
  @override
  State<AboutMobile> createState() => _AboutMobileState();
}

class _AboutMobileState extends State<AboutMobile> {
  @override
  Widget build(BuildContext context) {
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
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(size: 30.0,color: Colors.tealAccent),
        ),
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
                          border: Border.all(
                              width: 2.0,color: Colors.black)),
                      child: ClipOval(
                        child: Image.asset(
                            'assests/me.jpg',
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                            width: 150.0
                        ),
                      )
                  )
              ),
              Tabsmob(text: "Home", route: "/"),
              SizedBox(height: 10.0),
              Tabsmob(text: "About", route: "/route"),
              SizedBox(height: 10.0,),
              Tabsmob(text: "Work", route: "/work"),
              SizedBox(height: 10.0,),
              Tabsmob(text: "Blog", route: "/blog"),
              SizedBox(height: 10.0,),
              Tabsmob(text: "Contact", route: "/contact"),
              SizedBox(height: 10.0,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: ()async => await launch('https://www.instagram.com/baqar0223/'),
                        icon: SvgPicture.asset(
                          "assests/instagram.svg",
                          color: Colors.tealAccent,
                          width: 25.0,
                        )
                    ), IconButton(
                        onPressed: ()async => await launch('http://github.com/MohammedBaqar0223/'),
                        icon: SvgPicture.asset(
                          "assests/github.svg",
                          color: Colors.tealAccent,
                          width: 25.0,
                        )
                    ), IconButton(
                        onPressed: ()async => await launch('http://www.linkedin.com/in/mohammedbaqar'),
                        icon: SvgPicture.asset(
                          "assests/download.svg",
                          width: 25.0,
                        )
                    ),
                  ]
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              CircleAvatar(
                radius: 116.0,
                backgroundColor: Colors.tealAccent,
                child: CircleAvatar(
                  radius: 114.0,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage("assests/me.jpg"),
                ),
              ),
              SizedBox(height: 10.0,),
              Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 15.0,),
                      Sansbold("About me", 15.0),
                      SizedBox(height: 10.0),
                      sans("Hi I am Mohammed Baqar an aspiring app developer who is working on his way to success", 10.0),
                      sans("I am making this as my first project", 10.0),
                      sans("Hope I learn somehting from this", 10.0),
                      sans("I have to fill this up", 10.0),
                      sans("So that I check the scroll condition to see if it is working", 10.0),
                      sans("This should work let's hope it doess", 10.0),
                      sans("Yessss it does!!!! ", 10.0),
                      SizedBox(height: 15.0,),
                      Wrap(
                        spacing: 10.0,
                        runSpacing: 10.0,
                        children: [
                          tealcontainer("FLutter"),
                          tealcontainer("Android"),
                          tealcontainer("FireBase"),
                          tealcontainer("Windows")
                        ],
                      ),
                    ],
                  )
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Anime(
                    imagepath: "assests/web.jpg",
                    text: "Web Development"
                  ),
                  SizedBox(height: 30.0),
                  sans("Looking to build a state-of-the-art web application designed for performance, scalability, and a seamless user experience",10.0),
                  SizedBox(height: 30.0,),
                  Anime(
                      imagepath: "assests/app.png",
                      fit: BoxFit.cover,
                      text: "App Development"
                  ),
                  SizedBox(height: 15.0,),
                  sans("Do you need high performance and responsive app?? I have got you covered", 10.0),
                  SizedBox(height: 30.0,),
                  Anime(
                      imagepath: "assests/Firebaseyyyy.png",
                      fit: BoxFit.cover,
                      text: "Back End Development"
                  ),
                  SizedBox(height: 15.0,),
                  sans("Do you want your back end to highly secure and scalable?? Let's have a conversation on how I can help you with that", 10.0),
                  SizedBox(height: 30.0)
                ]
              )
            ],
          )
        )
      )
    );
  }
}

