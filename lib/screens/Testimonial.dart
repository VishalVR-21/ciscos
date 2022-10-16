import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Testinomial extends StatelessWidget {
  Testinomial();
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'V89BOZhJFlI',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );
  List<String> video_links = [
    "V89BOZhJFlI",
    "V89BOZhJFlI",
    "V89BOZhJFlI",
    "V89BOZhJFlI",
    "V89BOZhJFlI",
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          elevation: 2.0,
          title: Text("Testimonial"),
        ),
        body: ListView.builder(
            itemCount: video_links.length,
            itemBuilder: ((context, index) => Card(
                  elevation: 3,
                  margin: EdgeInsets.all(10),
                  child: Container(
                    child: YoutubePlayer(
                      controller: _controller,
                      showVideoProgressIndicator: true,
                    ),
                  ),
                ))),
      ),
    );
  }
}
