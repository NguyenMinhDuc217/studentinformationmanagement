import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';

class Post {
  int id;
  String image;
  String title;
  String content;
  int like;


  Post(this.id, this.image, this.title, this.content, this.like);
  

  // Future<int> getMaBV() async {
  //   return mabaiviet;
  // }

  // Future<void> setMaBV(int mabaiviet) async {
  //   this.mabaiviet = mabaiviet;
  // }

  // Future<String> getAnh() async {
  //   return anh;
  // }

  // Future<void> setAnh(String anh) async {
  //   this.anh = anh;
  // }

  // Future<String> getTieuDe() async {
  //   return tieude;
  // }

  // Future<void> setTieuDe(String tieude) async {
  //   this.tieude = tieude;
  // }

  // Future<String> getNoiDung() async {
  //   return noidung;
  // }

  // Future<void> setNoiDung(String noidung) async {
  //   this.noidung = noidung;
  // }

  // // Future<void> getdata() async {
  // //   FirebaseDatabase database = FirebaseDatabase.instance;
  // //   DatabaseReference ref = FirebaseDatabase.instance.ref("BaiViet/0");
  // //   DatabaseEvent event = await ref.once();
  // //   print(event.snapshot.value);
  // // }
}
