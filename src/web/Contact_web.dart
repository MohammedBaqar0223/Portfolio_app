import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newpro/components.dart';
import 'package:url_launcher/url_launcher.dart';
class ContactWeb extends StatefulWidget {
  const ContactWeb({super.key});
  @override
  State<ContactWeb> createState() => _ContactWebState();
}
class _ContactWebState extends State<ContactWeb> {
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
            SizedBox(height: 10.0,),
            Sansbold("Mohammed Baqar", 10.0),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: ()async{
                  await launch('https://www.instagram.com/baqar0223/');
                },icon: SvgPicture.asset("assests/instagram.svg"
                ,color: Colors.tealAccent,
                  width: 25.0,)
                ),
                IconButton(onPressed: ()async{
                  await launch('http://github.com/MohammedBaqar0223/');
                },icon: SvgPicture.asset("assests/github.svg"
                  ,color: Colors.tealAccent,
                  width: 25.0,)
                ),
                IconButton(onPressed: ()async{
                  await launch('http://www.linkedin.com/in/mohammedbaqar');
                },icon: SvgPicture.asset("assests/download.svg"
                  ,color: Colors.tealAccent,
                  width: 25.0,)
                )
              ],
            )
          ],
        )
      ),
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
            return <Widget>[
              SliverAppBar(
                expandedHeight: 400.0,
                backgroundColor: Colors.black,
                iconTheme: IconThemeData(
                  size: 25.0,
                  color: Colors.tealAccent,
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset("assests/Contact.jpg",fit: BoxFit.cover,filterQuality: FilterQuality.high),
                ),
                title: Row(
                  children: [
                    Spacer(flex: 3),
                    TabsWeb("Home",'/'),
                    Spacer(flex:3),
                    TabsWeb("Works", '/works'),
                    Spacer(flex: 3),
                    TabsWeb("Blog", '/blog'),
                    Spacer(flex:3),
                    TabsWeb("About me",'/about'),
                    Spacer(flex: 3),
                  ],
                ),
              )
            ];
          },
          body: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  SizedBox(height: 30.0),
                  Sansbold("Contact me", 30.0,color: Colors.tealAccent,),
                  SizedBox(height:20.0),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Textform(one: "First Name"
                              ,two: "Enter first name"
                              ,mx:1
                              ,width: 350.0
                              ,controller: _firstnameController
                              ,validator: (text){
                              if(text.toString().isEmpty){
                                return "Please enter your first name";
                              }
                            },
                          ),
                          Textform(one: "Second Name"
                              ,two: "Enter second name"
                              ,mx:1
                              ,width: 350.0
                            ,controller: _lastnameController
                            ,validator: (text){
                              if(text.toString().isEmpty){
                                return "Please enter your last name";
                              }
                            },
                          ),
                        ],
                      ),
                      SizedBox(height:20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Textform(one: "Phone Number"
                              ,two: "Enter your phone number"
                              ,mx: 1
                              ,width: 350.0
                            ,controller: _contactController
                            ,validator: (text){
                              if(text.toString().isEmpty){
                                return "Please enter your contact number";
                              }
                            },
                          ),
                          Textform(one: "Email Id"
                              ,two: "Enter your email Id"
                              ,mx: 1
                              ,width: 350.0
                            ,controller: _emailIdController
                            ,validator: (text){
                              if(text.toString().isEmpty){
                                return "Please enter your email Id";
                              }
                            },
                          )
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Textform(one: "Message"
                          ,two: "message"
                          ,mx: 6
                          ,width: 700
                        ,controller: _messageController
                        ,validator: (text){
                          if(text.toString().isEmpty){
                            return "Please enter your message";
                          }
                        },
                      ),
                      SizedBox(height:20.0),
                      MaterialButton(
                          onPressed: ()async{
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
                          elevation: 20.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)
                        ),
                        height: 45.0,
                        minWidth: 135.0,
                        color: Colors.teal,
                          child: Sansbold("Submit", 15.0,color: Colors.tealAccent,),
                      )
                    ]
                  )
                ],
              ),
            )
          ),
      ),
    );
  }
}
