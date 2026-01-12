import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../components.dart';
class BlogMobile extends StatefulWidget {
  const BlogMobile({super.key});

  @override
  State<BlogMobile> createState() => _BlogMobileState();
}

class _BlogMobileState extends State<BlogMobile> {
  // List title=["Who am I?","Who are you?"];
  // List body=["I am Mohammed Baqar","You are ass"];
  void article()async{
    await FirebaseFirestore.instance
        .collection("articles")
        .get()
        .then((querySnapshot){
      querySnapshot.docs.forEach((element){
        // print(element.data()['title']);
      });
    });
  }
  void streamArticle()async{
    await for(var snapshot
    in FirebaseFirestore.instance.collection('articles').snapshots()){
      for(var title in snapshot.docs.reversed){
        print(title.data()['title']);
      }
    }
  }
  // @override
  // void initState() {
  //   streamArticle();
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
            return <Widget>[
              SliverAppBar(
                expandedHeight: 400.0,
                backgroundColor: Colors.transparent,
                iconTheme: IconThemeData(
                    size: 35.0,
                    color: Colors.tealAccent
                ),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(3.0)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: AbelCustom(text: "Welcome to my blog",size: 24.0,
                    color: Colors.tealAccent,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                  background: Image.asset(
                      "assests/blog.jpg",fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
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
          ),
      ),
    );
  }
}

class Blogpost extends StatefulWidget {
  final title;
  final body;
  const Blogpost({super.key, @required this.title,@required this.body});

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
