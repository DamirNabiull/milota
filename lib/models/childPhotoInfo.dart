import 'package:flutter/material.dart';

class ChildInfo {
  String? name, parent, phone, link;
  Image? photo;
  DateTime? photoDate, publicationDate;

  ChildInfo(name, parent, phone, link, photo, photoDate, publicationDate) {
    this.name = name;
    this.parent = parent;
    this.phone = phone;
    this.link = link;
    this.photo = photo;
    this.photoDate = photoDate;
    this.publicationDate = publicationDate;
  }
}