import '../../core/constants/image_assets.dart';
import '../model/ui/course_ui_model.dart';

List<CourseUiModel> staticCourseList = [
  CourseUiModel(
    id: "c98d22e6-c839-45f7-9f46-a2369d8be67b",
    title: "Basics",
    course: "COURSE",
    type: "basic",
    time: "3-10 min",
    imageUrl: ImageAssets.basic,
    description:
        "Ease the mind into a restful night’s sleep with these deep, amblent tones.",
    favorite: 34234,
    listener: 24234,
  ),
  CourseUiModel(
    id: "fa5c5b2a-0c44-4e2e-8473-2debfda04ab8",
    title: "Relaxation",
    course: "MUSIC",
    type: "relax",
    time: "3-10 min",
    imageUrl: ImageAssets.relax,
    description:
        "Ease the mind into a restful night’s sleep with these deep, amblent tones.",
    favorite: 24234,
    listener: 34234,
  ),
];
