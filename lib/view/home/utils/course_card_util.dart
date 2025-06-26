import '../../../core/constants/app_colors.dart';
import '../../../data/model/ui/course_ui_model.dart';

CourseUiColorModel getColorCourseCard(String value) {
  switch (value) {
    case "basic":
      return CourseUiColorModel(
        cardColor: AppColors.cardBasic,
        buttonColor: AppColors.buttonColorGrey,
        textColor: AppColors.textLightYellow,
        timeTextColor: AppColors.textColorBrokenWhite,
        buttonTextColor: AppColors.textColorBlack,
      );
    case "relax":
      return CourseUiColorModel(
        cardColor: AppColors.cardRelax,
        buttonColor: AppColors.buttonColorBlack,
        textColor: AppColors.textColorBrokenWhite,
        timeTextColor: AppColors.textColorLightBlack,
        buttonTextColor: AppColors.textColorBrokenWhite,
      );
    default:
      return CourseUiColorModel(
        cardColor: AppColors.cardBasic,
        buttonColor: AppColors.buttonColorGrey,
        textColor: AppColors.textLightYellow,
        timeTextColor: AppColors.textColorBrokenWhite,
        buttonTextColor: AppColors.textColorBlack,
      );
  }
}
