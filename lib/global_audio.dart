import 'package:audioplayers/audioplayers.dart';

class GlobalAudio {
  static final AudioPlayer player = AudioPlayer();

  static Future<void> startMusic() async {
    await player.setReleaseMode(ReleaseMode.loop);
    await player.play(AssetSource("songf.mp3"));
  }
}
