import '../../core/constants/image_assets.dart';
import '../model/ui/course_ui_model.dart';

List<CourseUiModel> staticCourseList = [
  CourseUiModel(
    id: "1",
    title: "Basics",
    course: "COURSE",
    type: "basic",
    time: "3-10 min",
    imageUrl: ImageAssets.basic,
  ),
  CourseUiModel(
    id: "2",
    title: "Relaxation",
    course: "MUSIC",
    type: "relax",
    time: "3-10 min",
    imageUrl: ImageAssets.relax,
  ),
];
