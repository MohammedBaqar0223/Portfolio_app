import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components.dart';

class ContactMobile extends StatefulWidget {
  const ContactMobile({super.key});

  @override
  State<ContactMobile> createState() => _ContactMobileState();
}

class _ContactMobileState extends State<ContactMobile> {
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailIdController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var widthy=MediaQuery.of(context).size.width;
    return Scaffold(
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
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context,bool innerBoxIsScrolled){
          return <Widget>[
            SliverAppBar(
              expandedHeight: 400.0,
              backgroundColor: Colors.transparent,
              iconTheme: IconThemeData(
                size: 35.0,
                color: Colors.tealAccent
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset("assests/Contact.jpg",fit: BoxFit.cover,filterQuality: FilterQuality.high,),
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Sansbold("Contact me", 30.0,color: Colors.tealAccent,),
                SizedBox(height: 25.0,),
                Textform(one: "First name"
                    ,two: "Enter first name"
                    ,mx: 1
                    ,width: widthy/1.7
                    ,controller: _firstnameController,
                  validator: (text) {
                    if (text.toString().isEmpty) {
                      return "Please enter your first name";
                    }
                  },
                ),
                SizedBox(height: 25.0,),
                Textform(one: "Second name"
                    ,two: "Enter second name"
                    ,mx: 1
                    ,width: widthy/1.7
                    ,controller: _lastnameController,
                  validator: (text) {
                    if (text.toString().isEmpty) {
                      return "Please enter your last name";
                    }
                  },
                ),
                SizedBox(height: 25.0,),
                Textform(one: "Phone Number"
                    ,two: "Enter phone number"
                    ,mx: 1
                    ,width: widthy/1.7
                    ,controller: _contactController,
                  validator: (text) {
                    if (text.toString().isEmpty) {
                      return "Please enter your Number";
                    }
                  },
                ),
                SizedBox(height: 25.0,),
                Textform(one: "Email Id"
                    ,two: "Enter Email Id"
                    ,mx: 1
                    ,width: widthy/1.7
                    ,controller: _emailIdController,
                  validator: (text) {
                    if (text.toString().isEmpty) {
                      return "Please enter your email";
                    }
                  },
                ),
                SizedBox(height: 25.0,),
                Textform(one: "Message"
                  ,two: "Enter your Message"
                  ,mx: 1
                  ,width: widthy/1.7
                  ,controller: _messageController,
                  validator: (text) {
                    if (text.toString().isEmpty) {
                      return "Please enter Message";
                    }
                  },
                ),
                SizedBox(height: 25.0),
                MaterialButton(
                  onPressed: ()async{
                    final addData = new addDataFirestore();
                    if(formkey.currentState!.validate()){
                      await addData.addResponse(
                          _firstnameController.text
                          , _lastnameController.text
                          , _emailIdController.text
                          , _contactController.text
                          ,_messageController.text
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
                  elevation: 3.0,
                  color: Colors.tealAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Sansbold("Submit", 20.0),
                )
              ],
            ),
          )
          ),
        ),
      );
  }
}
