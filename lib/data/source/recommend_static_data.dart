import 'package:metidation_app/core/constants/image_assets.dart';

import '../model/ui/recommend_ui_model.dart';

List<RecommendUiModel> staticRecommendList = [
  RecommendUiModel(
    id: "1",
    title: "Focus",
    type: "focus",
    time: "3-10 min",
    imagePath: ImageAssets.focus,
  ),
  RecommendUiModel(
    id: "2",
    title: "Happiness",
    type: "happiness",
    time: "3-10 min",
    imagePath: ImageAssets.happiness,
  ),
  RecommendUiModel(
    id: "3",
    title: "Sleep",
    type: "sleep",
    time: "3-10 min",
    imagePath: ImageAssets.sleep,
  ),
];
