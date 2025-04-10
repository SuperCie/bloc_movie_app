import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Myytplayer extends StatelessWidget {
  const Myytplayer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = YoutubePlayerController(
      initialVideoId: '9KVG_X_7Naw',
      flags: YoutubePlayerFlags(autoPlay: false, mute: false),
    );

    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey.shade800),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade900,
            blurRadius: 2,
            offset: Offset(0, -2),
          ),
          BoxShadow(color: Colors.white, blurRadius: 2, offset: Offset(0, -2)),
        ],
        borderRadius: BorderRadius.circular(25),
      ),
      height: 180,
      width: 360,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: YoutubePlayer(
          controller: controller,
          aspectRatio: 16 / 9,

          showVideoProgressIndicator: true,
        ),
      ),
    );
  }
}
