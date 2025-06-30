import 'package:flutter/material.dart';
import 'package:metidation_app/core/components/app_text.dart';
import 'package:metidation_app/core/constants/image_assets.dart';
import 'package:metidation_app/core/extensions/numbering_ext.dart';
import 'package:metidation_app/data/model/ui/course_ui_model.dart';

import '../../../core/constants/app_colors.dart';

class CourseDetailPage extends StatelessWidget {
  final CourseUiModel data;
  const CourseDetailPage({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 288.78,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  ImageAssets.courseDetail,
                  fit: BoxFit.cover,
                ),
              ),
              leading: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.favorite_border, color: Colors.black),
                      onPressed: () {},
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.download, color: Colors.black),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    AppText(
                      text: data.title,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColorBlack,
                    ),
                    SizedBox(height: 16.37),
                    AppText(
                      text: data.course,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColorGrey,
                    ),
                    SizedBox(height: 20),
                    AppText(
                      text: data.description,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: AppColors.textColorGrey,
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Icon(Icons.favorite, color: AppColors.textColorPink),
                        SizedBox(width: 10.68),
                        AppText(
                          text: "${data.favorite.format3Digit()} Favorites",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColorGrey,
                        ),
                        SizedBox(width: 16),
                        Icon(Icons.headphones, color: AppColors.textColorBlue),
                        SizedBox(width: 4),
                        AppText(
                          text: "${data.listener.format3Digit()} Listeners",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColorGrey,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
