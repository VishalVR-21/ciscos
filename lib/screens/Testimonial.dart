import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Testinomial extends StatefulWidget {
  Testinomial();

  @override
  State<Testinomial> createState() => _TestinomialState();
}

class _TestinomialState extends State<Testinomial> {
  YoutubePlayerController controller = YoutubePlayerController(
    initialVideoId: 'V89BOZhJFlI',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  List<String> video_links = [];
  @override
  void initState() {
    // TODO: implement initState
    getVideo();
    super.initState();
  }

  getVideo() async {
    var data = await FirebaseFirestore.instance.collection('videos').get();
    data.docs.forEach((element) {
      var video = element.data();
      String links = video['link'];
      print(video_links.length);
      setState(() {
        video_links.add(links);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          snap: true,
          floating: true,
          expandedHeight: 100,
          iconTheme: IconThemeData(color: Colors.purple),
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'Testimonial',
              style: TextStyle(
                  color: Colors.teal,
                  fontFamily: GoogleFonts.playball().fontFamily,
                  fontSize: 30),
            ),
            centerTitle: true,
            background: Image.asset(
              'assets/inorganic.jpeg',
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Card(
              elevation: 3,
              margin: EdgeInsets.all(10),
              child: Container(
                child: GestureDetector(
                  onTap: () {
                    final new_video = video_links[index];
                    controller.load(new_video);
                    controller.pause();
                  },
                  child: YoutubePlayer(
                    controller: controller,
                    showVideoProgressIndicator: true,
                  ),
                ),
              ),
            ),
            childCount: video_links.length,
          ),
        ),
      ]),
    );
  }
}
