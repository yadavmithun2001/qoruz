// commonly used function
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qoruz/home.dart';

String basePath = 'assets/images/';
class ImagePaths{
  static profile(){
    return '${basePath}profile.png';
  }
  static clock(){
    return '${basePath}clock.png';
  }
  static landingpage(){
    return '${basePath}landing.png';
  }
  static profilestack(){
    return '${basePath}profiles.png';
  }
  static loading(){
    return '${basePath}loading.png';
  }
  static bottomNavigation(){
    return '${basePath}bottomnav.png';
  }
}

class ColorResources{
  static primary(){
    return const Color(0xff2f9bfe);
  }
}