import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components.dart';

class BlogWeb extends StatefulWidget {
  const BlogWeb({super.key});

  @override
  State<BlogWeb> createState() => _BlogWebState();
}

class _BlogWebState extends State<BlogWeb> {
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
  @override
  Widget build(BuildContext context) {
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
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context,bool innerBoxIsScrolled){
            return <Widget>[
              SliverAppBar(
                expandedHeight: 400.0,
                backgroundColor: Colors.black,
                iconTheme: IconThemeData(
                  size: 25.0,
                  color: Colors.tealAccent,
                ),
                flexibleSpace: FlexibleSpaceBar(
                  title: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(3.0)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: AbelCustom(text: "Welcome to my blog"
                      , size: 24,color: Colors.tealAccent
                      ,fontWeight: FontWeight.bold
                    ),
                  ),
                  background: Image.asset("assests/blog.jpg",fit: BoxFit.cover,filterQuality: FilterQuality.high),
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
            ]
              ),
            )
            ];
          },
          body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('articles').snapshots(),
            builder: (context,snapshot){
              if(snapshot.hasData) {
                return ListView.builder(itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];
                      return Blogpost(title: documentSnapshot['title']
                        ,body: documentSnapshot['body'],);
                    });
              }else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),),
    );
  }
}
class Blogpost extends StatefulWidget {
  final title;
  final body;
  const Blogpost({super.key,@required this.title,@required this.body});

  @override
  State<Blogpost> createState() => _BlogpostState();
}

class _BlogpostState extends State<Blogpost> {
  bool expand=false;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 30.0,bottom: 30.0),
        child: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              border: Border.all(
                  style: BorderStyle.solid,
                  width: 1.0,
                  color: Colors.tealAccent
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.tealAccent,
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: AbelCustom(text: widget.title, size: 25.0,color: Colors.teal,),
                  ),
                  IconButton(
                    onPressed: (){
                      setState(() {
                        expand=!expand;
                      });
                    },
                    icon: Icon(Icons.arrow_drop_down_circle_outlined),
                  )
                ],
              ),
              SizedBox(height: 7.0,),
              Text(
                widget.body,
                style: GoogleFonts.openSans(
                  fontSize: 15.0,
                  color: Colors.teal,
                ),
                maxLines: expand==true?null:3,
                overflow: expand==true?TextOverflow.visible:TextOverflow.ellipsis,
              ),

            ],
          ),
        )
    );
  }
}
