import 'package:flutter/material.dart';

class CourseUiModel {
  final String id;
  final String title;
  final String course;
  final String type;
  final String time;
  final String imageUrl;

  CourseUiModel({
    required this.id,
    required this.title,
    required this.course,
    required this.type,
    required this.time,
    required this.imageUrl,
  });
}

class CourseUiColorModel {
  final Color cardColor;
  final Color buttonColor;
  final Color textColor;
  final Color timeTextColor;
  final Color buttonTextColor;

  CourseUiColorModel({
    required this.cardColor,
    required this.buttonColor,
    required this.textColor,
    required this.timeTextColor,
    required this.buttonTextColor,
  });
}
