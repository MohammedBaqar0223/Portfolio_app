import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newpro/components.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({super.key});

  @override
  State<LandingPageMobile> createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _message = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
    var Widths=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
                    fit: BoxFit.cover,
                    width: 150.0
                  ),
                )
                )
              ),
              Tabsmob(text: "Home", route: "/"),
              SizedBox(height: 10.0),
              Tabsmob(text: "About", route: "/about"),
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
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 116.0,
                  backgroundColor: Colors.tealAccent,
                  child: CircleAvatar(
                    radius: 114.0,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 110.0,
                      backgroundImage: AssetImage("assests/me.jpg"),
                    ),
                  )
                ),
                SizedBox(height: 15.0),
      
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.tealAccent,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0)
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 5.0
                        ),
                        child: Sansbold("Hi I'm",20.0)
                    ),
                    SizedBox(height: 10.0,),
                    Sansbold("Mohammed Baqar", 45.0,color: Colors.tealAccent),
                    Sansbold("Flutter developer", 45.0,color: Colors.tealAccent,),
                    SizedBox(height: 25.0),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Wrap(
                  direction: Axis.vertical,
                  spacing: 2.0,
                  children: [
                    SizedBox(height: 10.0,),
                    Icon(Icons.email,color: Colors.tealAccent,),
                    Icon(Icons.call,color:Colors.tealAccent),
                    Icon(Icons.location_pin,color: Colors.tealAccent),
                  ],
                 ),
                SizedBox(width: 10.0),
                Wrap(
                  direction: Axis.vertical,
                  spacing: 2.0,
                  children: [
                    SizedBox(height: 10.0,),
                    Sansbold("mohammedbaqar841@gmail.com", 15.0),
                    Sansbold("+91 74834 36577", 15.0),
                    Sansbold("HBR Layout, Banglore", 15.0),
                  ],
                )
              ],//children
            ),
            SizedBox(height: 85.0,),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Sansbold("About me", 15.0,color: Colors.tealAccent,),
                  sans("Hi I am Mohammed Baqar an aspiring app developer who is working his way to success", 10.0),
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
                  )
                ],
              )
            ),
            SizedBox(height: 60.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Sansbold("What do I do??", 15.0,color: Colors.tealAccent,),
                SizedBox(height: 30.0,),
                Anime(imagepath: "assests/webL.png",
                  fit: BoxFit.cover,
                  text: "Web Development",
                  width: 300.0
                ),
                SizedBox(height: 30.0,),
                Anime(imagepath: "assests/app.png",
                  fit: BoxFit.cover,
                  text: "App Development",
                  width: 300.0
                ),
                SizedBox(height: 30.0,),
                Anime(imagepath: "assests/Firebaseyyyy.png",
                  fit: BoxFit.cover,
                  text: "Back End Development",
                  width: 300.0
                )
              ]
            ),
            SizedBox(height: 80.0,),
            Container(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
                minWidth: MediaQuery.of(context).size.width
              ),
              child: Form(
                key: formKey,
                child: Wrap(
                    runSpacing: 20.0,
                    spacing: 20.0,
                    alignment: WrapAlignment.center,
                  children: [
                    Sansbold("Contact me", 25.0,color: Colors.tealAccent,),
                    SizedBox(height: 80.0),
                    Textform(one: "First Name"
                        ,two: "Enter First name"
                        , mx: 1
                        , width: 350.0
                        , controller: _firstName
                        ,validator: (text){
                      if(text.toString().isEmpty){
                        return "Please enter your first name";
                       }
                      },
                    ),
                    SizedBox(height: 30.0),
                    Textform(one: "Second Name"
                        , two: "Enter Second Name"
                        , mx: 1
                        , width: 350.0
                        ,controller: _lastName
                        ,validator: (text){
                      if(text.toString().isEmpty){
                        return "Please enter your last name";
                        }
                      },
                    ),
                    SizedBox(height: 30.0),
                    Textform(one: "Phone no."
                        , two: "Enter Phone Number"
                        , mx: 1
                        , width: 350.0
                        ,controller: _phone
                        ,validator: (text){
                      if(text.toString().isEmpty){
                        return "Please enter your phone number";
                        }
                      },
                    ),
                    SizedBox(height: 30.0),
                    Textform(one: "Email ID"
                        , two: "Enter your email"
                        , mx: 1
                        , width: 350.0
                        ,controller: _email
                        ,validator: (text){
                      if(text.toString().isEmpty){
                        return "Please enter your email Id";
                        }
                      },
                    ),
                    Textform(one: "Message"
                      , two: "Message"
                      , mx: 1
                      , width: 350.0
                      ,controller: _message
                      ,validator: (text){
                        if(text.toString().isEmpty){
                          return "Please enter your Message";
                        }
                      },
                    ),
                    SizedBox(height: 30.0,),
                    MaterialButton(
                        elevation: 20.0,
                        color: Colors.tealAccent,
                        height: 45.0,
                        minWidth: 150.0,
                        shape: RoundedRectangleBorder(
                            borderRadius:BorderRadius.circular(15.0)
                        ),
                        child: Sansbold("Submit", 15.0),
                        onPressed: ()async{
                          final addData = new addDataFirestore();
                          if(formKey.currentState!.validate()){
                            await addData.addResponse(
                                _firstName.text
                                , _lastName.text
                                , _email.text
                                , _phone.text
                                ,_message.text
                            );
                            formKey.currentState!.reset();
                            showDialog(context: context, builder: (
                                BuildContext context)=>AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                              ),
                                title: Sansbold("Message Sent", 15.0),
                            ));
                          }
                        }
                    ),
                    SizedBox(height: 15.0)
                  ]
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
