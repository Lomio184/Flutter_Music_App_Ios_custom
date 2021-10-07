import 'package:flutter/material.dart';

class CardInfo {
  CardInfo(this.imgSrc, this.title, this.alignment, this.position);

  String imgSrc;
  String title;
  Alignment alignment;
  int position;
}

class TrendCard{

  TrendCard(this.imgSrc, this.title, this.alignment);
  String imgSrc;
  String title;
  Alignment alignment;
}