import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:metidation_app/core/components/app_text.dart';
import 'package:metidation_app/core/constants/app_colors.dart';
import 'package:metidation_app/core/extensions/duration_ext.dart';
import 'package:metidation_app/core/utils/media_query_util.dart';
import 'package:metidation_app/data/model/response/sleep/sleep_response.dart';
import 'package:metidation_app/viewmodels/sleep/music_view_model.dart';

import '../../../core/components/app_button_back.dart';
import '../../../core/constants/image_assets.dart';

class SleepMusicPlayerPage extends HookConsumerWidget {
  final Item data;
  const SleepMusicPlayerPage({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(musicViewModelProvider.notifier);

    final isPlaying = ref.watch(musicViewModelProvider).value ?? false;

    final durationState =
        useStream(viewModel.player.durationStream, initialData: Duration.zero);
    final positionState =
        useStream(viewModel.player.positionStream, initialData: Duration.zero);
    final totalDuration = durationState.data ?? Duration.zero;
    final currentPosition = positionState.data ?? Duration.zero;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blueColor,
        body: Stack(
          children: [
            SizedBox(
              width: ScreenSize.width(context),
              height: ScreenSize.height(context),
              child: Image.asset(
                ImageAssets.musicPlayerSleep,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 50,
              left: 20.24,
              right: 20.24,
              bottom: 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppButtonBack(
                    onTap: () {
                      context.pop();
                    },
                  ),
                  SizedBox(height: 286.94),
                  SizedBox(
                    width: ScreenSize.width(context),
                    child: AppText(
                      text: data.name ?? "",
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColorWhite,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: ScreenSize.width(context),
                    child: AppText(
                      text: data.type ?? "",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColorGrey,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.replay_10_rounded, size: 40),
                        onPressed: () {
                          viewModel.rewind15();
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                          size: 60,
                        ),
                        onPressed: () async {
                          final player = viewModel.player;

                          if (isPlaying) {
                            await viewModel.pause();
                          } else {
                            // Jika sudah ada sumber audio, resume
                            if (player.playing == false &&
                                player.duration != null) {
                              await viewModel.resume();
                            } else {
                              // Jika belum pernah play sama sekali
                              await viewModel.loadAndPlay(data.url ?? "");
                            }
                          }
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.forward_10_rounded, size: 40),
                        onPressed: () {
                          viewModel.forward15();
                        },
                      ),
                    ],
                  ),
                  Slider(
                    value: currentPosition.inMilliseconds
                        .toDouble()
                        .clamp(0, totalDuration.inMilliseconds.toDouble()),
                    max: totalDuration.inMilliseconds.toDouble() > 0
                        ? totalDuration.inMilliseconds.toDouble()
                        : 1,
                    min: 0,
                    activeColor: AppColors.textColorWhite,
                    inactiveColor: AppColors.backgroundColorGrey,
                    onChanged: (value) {
                      viewModel.player.seek(
                        Duration(milliseconds: value.toInt()),
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: currentPosition.formatDuration(),
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: AppColors.textColorWhite,
                      ),
                      AppText(
                        text: totalDuration.formatDuration(),
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: AppColors.textColorWhite,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
