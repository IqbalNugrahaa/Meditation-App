import 'package:flutter/material.dart';
import 'package:metidation_app/core/components/app_button.dart';
import 'package:metidation_app/core/components/app_text.dart';

class CourseCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String course;
  final String time;
  final Color cardColor;
  final Color textColor;
  final Color buttonColor;
  final Color buttonTextColor;
  final Color timeTextColor;
  const CourseCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.course,
    required this.time,
    required this.cardColor,
    required this.textColor,
    required this.buttonColor,
    required this.buttonTextColor,
    required this.timeTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topRight: Radius.circular(10)),
              child: Image.asset(
                imagePath,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 85),
                AppText(
                  text: title,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
                SizedBox(height: 9.55),
                AppText(
                  text: course,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
                SizedBox(height: 35.86),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: time,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: timeTextColor,
                    ),
                    AppButton.contained(
                      width: 70,
                      height: 35,
                      text: "START",
                      onPressed: () {},
                      backgroundColor: buttonColor,
                      textColor: buttonTextColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
