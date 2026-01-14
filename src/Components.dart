import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

class TabsWeb extends StatefulWidget {
  final title;
  final route;
  const TabsWeb(this.title,@ required this.route, {super.key});

  @override
  State<TabsWeb> createState() => _TabsWebState();
}

class Tabsmob extends StatefulWidget {
  final text;
  final route;
  const Tabsmob({super.key, @required this.text, @required this.route});

  @override
  State<Tabsmob> createState() => _TabsmobState();
}

class _TabsmobState extends State<Tabsmob> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 20.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0)
        ),
        height: 15.0,
        minWidth: 20.0,
        color: Colors.tealAccent,
        child: Text(
          widget.text,
          style: GoogleFonts.orbitron(
            fontSize: 20.0,
            color: Colors.black
          ),
        ),
        onPressed: (){
        Navigator.of(context).pushNamed(widget.route);
        }
    );
  }
}


class _TabsWebState extends State<TabsWeb> {
  bool Isselected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: MouseRegion(
        onEnter: (_){
          setState(() {
            Isselected = true;
          });
        },
        onExit: (_){
          setState(() {
            Isselected = false;
          });
        },
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: Isselected?GoogleFonts.oswald(
            color: Colors.white,
            fontSize: 25.0,
            decoration: TextDecoration.underline,
            decorationThickness: 1,
            decorationColor: Colors.tealAccent
          ):GoogleFonts.oswald(
              color: Colors.black,
              fontSize: 23.0,
          ),
          child: Text(
              widget.title,style: GoogleFonts.oswald(color: Colors.tealAccent),
          ),
        ),
      ),
      onTap: (){
        Navigator.of(context).pushNamed(widget.route);
      },
    );
  }
}

class Sansbold extends StatelessWidget {
  final text;
  final fontsize;
  final color;
  const Sansbold(this.text, this.fontsize,{super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.orbitron(fontSize: fontsize,
            fontWeight: FontWeight.bold,
            color: color==null?Colors.teal:color)
    );
  }
}

class sans extends StatelessWidget {
  final text;
  final size;
  const sans(this.text,this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.orbitron(fontSize: size,
            color: Colors.tealAccent)
    );
  }
}

class Textform extends StatelessWidget {
  final validator;
  final controller;
  final one;
  final two;
  final int mx;
  final double width;
  const Textform({super.key,
    required this.one,
    required this.two,
    required this.mx,
    required this.width
    ,this.controller
    ,this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sans(one, 10.0),
        SizedBox(height: 15.0),
        SizedBox(
            width: width,
            child: TextFormField(
              style: TextStyle(
                color: Colors.tealAccent
              ),
              validator: validator,
              controller: controller,
              inputFormatters: [
                LengthLimitingTextInputFormatter(600),
              ],
              maxLines: mx,
              decoration: InputDecoration(
                  label: sans(two, 15.0),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.tealAccent,
                      ),
                      borderRadius: BorderRadius.circular(15.0)
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.red,
                          width: 2.0
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15.0))
                  )
                  ,focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.tealAccent,
                          width: 2.0
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                  )
              ),
            )
        ),
      ],
    );
  }
}

class Anime extends StatefulWidget {
  final imagepath;
  final fit;
  final text;
  final reverse;
  final height;
  final width;
  const Anime( {
    super.key, required this.imagepath,
    this.text,
    this.fit,
    this.reverse, this.height, this.width});

  @override
  State<Anime> createState() => _AnimeState();
}

class _AnimeState extends State<Anime> with SingleTickerProviderStateMixin {
  late AnimationController _controller= AnimationController(
      vsync: this,
      duration: Duration(seconds:4 )
  )..repeat(reverse: true);

  late Animation<Offset> _animation = Tween(
    begin: widget.reverse==true?Offset(0,0.08):Offset.zero,
    end: widget.reverse==true?Offset.zero:Offset(0,0.08)
  ).animate(_controller);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: _animation,
    child:  Card(
        color: Colors.black,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              color: Colors.tealAccent,
            )
        ),
        shadowColor: Colors.tealAccent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              children: [
                Image.asset(
                    widget.imagepath,
                    width: widget.width==null?200:widget.width,
                    height: widget.height==null?200:widget.height,
                ),
                SizedBox(height: 10.0),
                sans(widget.text, 15.0),
              ]
          ),
        )
    ),
    );
  }
}

class AbelCustom extends StatefulWidget {
  final text;
  final size;
  final color;
  final fontWeight;
  const AbelCustom({super.key, @required this.text, @required this.size, this.color, this.fontWeight});

  @override
  State<AbelCustom> createState() => _AbelCustomState();
}

class _AbelCustomState extends State<AbelCustom> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: GoogleFonts.abel(
        fontSize: widget.size,
        color: widget.color==null?Colors.black:widget.color,
        fontWeight: widget.fontWeight==null?FontWeight.normal:widget.fontWeight,
      ),
    );
  }
}

class addDataFirestore{
  var logger = Logger();
  CollectionReference response = FirebaseFirestore.instance.collection('messages');
  Future<void> addResponse(
      final firstname,
      final lastname,
      final emailId,
      final phone,
      final message
      )async{
    return response.add({
      'firstname': firstname,
      'lastname': lastname,
      'emailId': emailId,
      'phone': phone,
      'message': message
    }).then((value)=>logger.d("Succes")).catchError((error)=>logger.d("Failed"));
  }
}
