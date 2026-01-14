import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newpro/components.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});
  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
  urlLauncher(String imagepath, String link) {
    return IconButton(
      icon: SvgPicture.asset(imagepath, width: 25.0, color: Colors.tealAccent),
      onPressed: () async {
        await launchUrl(Uri.parse(link));
      },
    );
  }
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailIdController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var heighty = MediaQuery.of(context).size.height;
    var widthy = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: Column(
          children: [
            SizedBox(height: 200.0),
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
                  "http://instagram.com/baqar0223/",
                ),
                urlLauncher(
                  "assests/github.svg",
                  "http://github.com/MohammedBaqar0223/",
                ),
                IconButton(
                  icon: SvgPicture.asset("assests/download.svg", width: 25.0),
                  onPressed: () async {
                    await launchUrl(
                      Uri.parse("http://www.linkedin.com/in/mohammedbaqar"),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(size: 25.0, color: Colors.tealAccent),
        title: Row(
          children: [
            Spacer(flex: 3),
            TabsWeb("Blog", '/blog'),
            Spacer(),
            TabsWeb("Works", '/works'),
            Spacer(),
            TabsWeb("About", '/about'),
            Spacer(),
            TabsWeb("Contact", '/contact'),
            Spacer(),
          ],
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          //first section
          Container(
            height: heighty - 56,
            padding: const EdgeInsets.symmetric(horizontal: 150),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.tealAccent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 5.0,
                      ),
                      child: Sansbold("Hello I'm", 20.0),
                    ),
                    SizedBox(height: 15.0),
                    sans("Mohammed Baqar", 35.0),
                    SizedBox(height: 25.0),
                    Row(
                      children: [
                        Icon(Icons.email_outlined, color: Colors.tealAccent),
                        SizedBox(width: 8),
                        sans("mohammedbaqar841@gmail.com", 15.0),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.call, color: Colors.tealAccent),
                        SizedBox(width: 8),
                        sans("+91 74834 36577", 15.0),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_pin, color: Colors.tealAccent),
                        SizedBox(width: 8),
                        sans(
                          "51/2 Yaseen Nagar, HBR Layout, Bengaluru, Karnataka",
                          15.0,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                const CircleAvatar(
                  radius: 107.0,
                  backgroundColor: Colors.tealAccent,
                  child: CircleAvatar(
                    radius: 103.0,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 100.0,
                      backgroundImage: AssetImage("assests/me.jpg"),
                    ),
                  ),
                ),
              ], //Children
            ),
          ),
          //second page
          Container(
            height: heighty - 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assests/web2.png",
                  height: heighty / 1.7,
                  width: widthy / 3.0,
                ),
                SizedBox(width: 150.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Sansbold("About Me", 30.0, color: Colors.tealAccent),
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
                    SizedBox(height: 25.0),
                    Wrap(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.tealAccent,
                              style: BorderStyle.solid,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: EdgeInsets.all(7.0),
                          child: sans("Flutter", 15.0),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.tealAccent,
                              style: BorderStyle.solid,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: EdgeInsets.all(7.0),
                          child: sans("Kotlin", 15.0),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.tealAccent,
                              style: BorderStyle.solid,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: EdgeInsets.all(7.0),
                          child: sans("Firebase", 15.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          //third section
          Container(
            height: heighty - 56,
            child: Column(
              children: [
                Sansbold("What do I do??", 30.0, color: Colors.tealAccent),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Anime(
                      imagepath: "assests/web2.png",
                      fit: BoxFit.cover,
                      text: "Web Development",
                      reverse: true,
                    ),
                    Anime(
                      imagepath: "assests/app.png",
                      fit: BoxFit.contain,
                      text: "App Development",
                      reverse: true,
                    ),
                    Anime(
                      imagepath: "assests/Firebaseyyyy.png",
                      fit: BoxFit.contain,
                      text: "Back End Development",
                      reverse: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: heighty,
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Sansbold("Contact me", 30.0, color: Colors.tealAccent),
                  SizedBox(height: 150.0),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Textform(
                          one: "First Name",
                          two: "Enter first name",
                          mx: 1,
                          width: 350.0,
                          controller: _firstnameController,
                          validator: (text) {
                            if (text.toString().isEmpty) {
                              return "Please enter your first name";
                            }
                          },
                        ),
                        Textform(
                          one: "Second Name",
                          two: "Enter second name",
                          mx: 1,
                          width: 350.0,
                          controller: _lastnameController,
                          validator: (text) {
                            if (text.toString().isEmpty) {
                              return "Please enter your last name";
                            }
                          }
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50.0),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Textform(
                          one: "Phone Number",
                          two: "Enter number",
                          mx: 1,
                          width: 350.0,
                          controller: _contactController,
                          validator: (text) {
                            if (text.toString().isEmpty) {
                              return "Please enter your phone number";
                            }
                          },
                        ),
                        Textform(
                          one: "Email ID",
                          two: "Enter email",
                          mx: 1,
                          width: 350.0,
                          controller: _emailIdController,
                          validator: (text) {
                            if (text.toString().isEmpty) {
                              return "Please enter your email Id";
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Textform(
                    one: "Message"
                    ,two: "Message"
                    ,mx: 6,width: widthy / 1.5
                    ,controller: _messageController
                    ,validator: (text){
                      if(text.toString().isEmpty){
                        return "Enter your email Id";
                      }
                  },
                  ),
                  SizedBox(height: 25.0),
                  MaterialButton(
                    elevation: 20.0,
                    color: Colors.tealAccent,
                    height: 45.0,
                    minWidth: 135.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Sansbold("Submit", 20.0),
                    onPressed: () async{
                      final addData = new addDataFirestore();
                      if(formkey.currentState!.validate()){
                        await addData.addResponse(
                            _firstnameController.text
                            , _lastnameController.text
                            , _emailIdController.text
                            ,_contactController.text
                            , _messageController.text
                        );
                        formkey.currentState!.reset();
                        showDialog(context: context, builder: (
                            BuildContext context)=>AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          title: Sansbold("Message Sent", 15.0),
                        ));
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.0),
        ], //Children
      ),
    );
  }
}
