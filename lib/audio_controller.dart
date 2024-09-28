// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:audio_service/audio_service.dart';
// import 'package:provider/provider.dart';
//
// class AudioController with ChangeNotifier {
//   final _audioPlayer = AudioPlayer();
//   final _audioService = AudioService();
//
//   bool _isPlaying = false;
//   String _currentSongTitle = '';
//
//   bool get isPlaying => _isPlaying;
//   String get currentSongTitle => _currentSongTitle;
//
//   Future<void> init() async {
//     await _audioPlayer.setAudioSource(
//       AudioSource.uri(Uri.parse('https://example.com/music.mp3')),
//     );
//     await _audioService.start(backgroundTaskEntrypoint: _backgroundTaskEntrypoint);
//   }
//
//   Future<void> play() async {
//     await _audioPlayer.play();
//     _isPlaying = true;
//     notifyListeners();
//   }
//
//   Future<void> pause() async {
//     await _audioPlayer.pause();
//     _isPlaying = false;
//     notifyListeners();
//   }
//
//   Future<void> stop() async {
//     await _audioPlayer.stop();
//     _isPlaying = false;
//     notifyListeners();
//   }
//
//   Future<void> seek(Duration position) async {
//     await _audioPlayer.seek(position);
//   }
//
//   void _backgroundTaskEntrypoint() async {
//     await AudioService.waitForStart();
//     await init();
//     await AudioService.updateState(
//       playing: true,
//       processingState: AudioProcessingState.ready,
//     );
//   }
//
//   void updateCurrentSongTitle(String title) {
//     _currentSongTitle = title;
//     notifyListeners();
//   }
// }
//
// class AudioProvider with Provider<AudioController> {
//   @override
//   AudioController create(BuildContext context) => AudioController();
// }