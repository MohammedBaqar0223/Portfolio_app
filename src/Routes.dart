import 'package:flutter/material.dart';
import 'package:newpro/mobile/Blog_mobile.dart';
import 'package:newpro/mobile/landing_page_mobile.dart';
import 'package:newpro/mobile/work_mobile.dart';
import 'package:newpro/web/Blog_web.dart';
import 'package:newpro/web/about_web.dart';
import 'package:newpro/web/contact_web.dart';
import 'package:newpro/web/landing_page_web.dart';
import 'package:newpro/web/works_web.dart';
import 'package:newpro/web/works_web.dart';
import 'mobile/about_mobile.dart';
import 'mobile/contact_mobile.dart';
class Routes{
  static MaterialPageRoute generateRoute(RouteSettings settings,){
    switch(settings.name){
      case '/':
        return MaterialPageRoute(
          settings: settings,
            builder: (_) => LayoutBuilder(builder: (context, constraints){
            if(constraints.maxWidth > 800){
              return LandingPageWeb();
            }
            else{
              return LandingPageMobile();
            }
        })
        );
      case '/contact':
        return MaterialPageRoute(
          settings: settings,
          builder: (_)=> LayoutBuilder(builder: (context, constraints){
            if(constraints.maxWidth > 800){
              return ContactWeb();
            }
            else{
              return ContactMobile();
            }
          })
        );
      case '/about':
        return MaterialPageRoute(
          settings: settings,
            builder: (_)=> LayoutBuilder(builder: (context,constraints){
              if(constraints.maxWidth > 800){
                return AboutWeb();
              }
              else{
                return AboutMobile();
              }
            })
        );
      case '/work':
        return MaterialPageRoute(
            settings: settings,
            builder: (_)=> LayoutBuilder(builder: (context,constraints){
          if(constraints.maxWidth > 800){
            return WorksWeb();
          }
          else{
            return WorkMobile();
          }
        }
        )
        );
      case '/blog':
        return MaterialPageRoute(
          settings: settings,
          builder: (_)=> LayoutBuilder(builder: (context, constraints){
            if(constraints.maxWidth > 800){
              return BlogWeb();
            }
            else{
              return BlogMobile();
            }
          })
        );
      case '/works':
        return MaterialPageRoute(
            settings: settings,
            builder: (_)=> LayoutBuilder(builder: (context, constraints){
              if(constraints.maxWidth > 800){
                return WorksWeb();
              }
              else{
                return WorkMobile();
              }
            })
        );
      default:
        return  MaterialPageRoute(
            settings: settings,
            builder: (_) => LayoutBuilder(builder: (context, constraints){
              if(constraints.maxWidth > 800){
                return LandingPageWeb();
              }
              else{
                return LandingPageMobile();
              }
            })
        );
    }
  }
}
