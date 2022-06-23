import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';

class Post {
  int id = 0;
  String image = "";
  String title = "";
  String content = "";
  int like = 0;
  bool canseemore = true;


  Post(this.id, this.image, this.title, this.content, this.like, this.canseemore);
}
