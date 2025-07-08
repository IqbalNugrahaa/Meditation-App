import 'dart:developer';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:just_audio/just_audio.dart';

part 'music_view_model.g.dart';

@riverpod
class MusicViewModel extends _$MusicViewModel {
  late AudioPlayer _audioPlayer;

  @override
  FutureOr<bool> build() async {
    _audioPlayer = AudioPlayer();

    // Cleanup ketika provider dihapus
    ref.onDispose(() {
      _audioPlayer.dispose();
    });

    return false; // state = AsyncValue.data(false)
  }

  AudioPlayer get player => _audioPlayer;

  Future<void> loadAndPlay(String url) async {
    try {
      state = AsyncValue.data(true);

      await _audioPlayer.setUrl(url);
      await _audioPlayer.play();
    } catch (e) {
      log('Error loading audio: $e');
      state = AsyncValue.data(false);
    }
  }

  Future<void> pause() async {
    await _audioPlayer.pause();
    state = AsyncValue.data(false);
  }

  Future<void> resume() async {
    await _audioPlayer.play();
    state = AsyncValue.data(true);
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
    state = AsyncValue.data(false);
  }

  Future<void> seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  Future<void> forward15() async {
    final current = _audioPlayer.position;
    final duration = _audioPlayer.duration;

    if (duration != null) {
      final newPosition = current + Duration(seconds: 10);
      if (newPosition < duration) {
        await _audioPlayer.seek(newPosition);
      } else {
        await _audioPlayer.seek(duration); // ke akhir jika melebihi durasi
      }
    }
  }

  Future<void> rewind15() async {
    final current = _audioPlayer.position;
    final newPosition = current - Duration(seconds: 10);
    await _audioPlayer
        .seek(newPosition >= Duration.zero ? newPosition : Duration.zero);
  }
}
