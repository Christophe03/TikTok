import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:math' as math;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'TikTok',
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Découvrir',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/tiktok_add.png',
              height: 25,
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.messenger_outline_rounded),
            label: 'Boîte de réception',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF141518),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final List<Map> tiktokItems = [
    {
      "video": "assets/videos/tcd.mp4",
    },
    {
      "video": "assets/videos/music.mp4",
    },
    {
      "video": "assets/videos/madara.mp4",
    },
    {
      "video": "assets/videos/will.mp4",
    },
    {
      "video": "assets/videos/itachi.mp4",
    },
    {
      "video": "assets/videos/amv.mp4",
    },
    {
      "video": "assets/videos/naruto.mp4",
    },
    {
      "video": "assets/videos/snk.mp4",
    },
    {
      "video": "assets/videos/animer.mp4",
    },
    {
      "video": "assets/videos/Killua.mp4",
    },
    {
      "video": "assets/videos/Jujutsu.mp4",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: double.infinity,
        scrollDirection: Axis.vertical,
        viewportFraction: 1.0,
      ),
      items: tiktokItems.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              color: const Color(0xFF141518),
              child: Stack(
                children: [
                  VideoWidget(videoUrl: item['video']),
                  const PostContent()
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

class VideoWidget extends StatefulWidget {
  const VideoWidget({Key? key, required this.videoUrl}) : super(key: key);
  final String videoUrl;

  @override
  _VideoWidgetState createState() => _VideoWidgetState(this.videoUrl);
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _controller;
  final String videoUrl;
  _VideoWidgetState(this.videoUrl);

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(videoUrl)
      ..initialize().then((_) {
        _controller.setLooping(true);
        _controller.play();
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayer(_controller);
  }
}

class PostContent extends StatelessWidget {
  const PostContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          padding: const EdgeInsets.only(top: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Abonnements',
                style: TextStyle(
                  color: Colors.white54,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 20),
              Text(
                'Pour toi',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '@Hashirama_Tcd98',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Les meilleurs AMV du Monde. #live #epic #action @mangasZone # hashirama #art #magas #top #music',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: const [
                          Icon(
                            Icons.music_note,
                            color: Colors.white,
                            size: 15,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Original Sound-amv_mangasZone',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 80,
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 80,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: const CircleAvatar(
                              radius: 25,
                              backgroundImage:
                                  AssetImage('assets/images/Minato.jpg'),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 15,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 80,
                      child: Column(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: Colors.red.withOpacity(0.85),
                            size: 45,
                          ),
                          const Text(
                            '95.0M',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      child: Column(
                        children: [
                          Icon(
                            Icons.comment,
                            color: Colors.white.withOpacity(0.85),
                            size: 45,
                          ),
                          const Text(
                            '856.5K',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      child: Column(
                        children: [
                          Icon(
                            MdiIcons.share,
                            color: Colors.white.withOpacity(0.85),
                            size: 45,
                          ),
                          const Text(
                            '171.9K',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      child: Column(
                        children: [
                          Icon(
                            Icons.more_horiz,
                            color: Colors.white.withOpacity(0.85),
                            size: 45,
                          ),
                        ],
                      ),
                    ),
                    const AnimatedLogo(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({Key? key}) : super(key: key);

  @override
  _AnimatedLogoState createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 4000),
      vsync: this,
    );
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * math.pi,
          child: child,
        );
      },
      child: Container(
        height: 45,
        width: 45,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: const DecorationImage(
            image: AssetImage("assets/images/disc_icon.png"),
          ),
        ),
        child: Image.asset('assets/images/tiktok_icon.png'),
      ),
    );
  }
}
