import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:scissor_paper_rock/screens/SinglePlayer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
// Working with ads
  late BannerAd _bannerAd;
  bool _isAdLoaded = false;

  @override
  void initState() {
    super.initState();
    _initBannerAd();
    // playHomeMusic();
  }

  _initBannerAd() {
    _bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      // adUnitId: BannerAd.testAdUnitId,
      listener: BannerAdListener(onAdLoaded: (ad) {
        setState(() {
          _isAdLoaded = true;
        });
      }, onAdFailedToLoad: (ad, error) {
        print(error);
      }),
      request: const AdRequest(),
    );

    _bannerAd.load();
  }

  final player = AudioPlayer();
  dynamic playHomeMusic() {
    setState(() {
      player.play(AssetSource('sounds/homeBg.mp3'));
    });
  }

  dynamic pauseHomeMusic() {
    setState(() {
      player.pause();
    });
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      bottomNavigationBar: !_isAdLoaded
          ? const Text("Ad not loaded")
          : SizedBox(
              height: _bannerAd.size.height.toDouble(),
              width: _bannerAd.size.width.toDouble(),
              child: AdWidget(ad: _bannerAd),
            ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/homeBg.png'),
                repeat: ImageRepeat.repeat,
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FractionallySizedBox(
                      widthFactor: 0.9,
                      child: SizedBox(
                        child: ElevatedButton(
                          onPressed: (() => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SinglePlayer(),
                                  ),
                                )
                              }),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(168, 12, 76, 10),
                          ),
                          child: const Text("Single Player"),
                        ),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.9,
                      child: SizedBox(
                        child: ElevatedButton(
                          onPressed: (() => {pauseHomeMusic()}),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber),
                          child: const Text("Multiplayer"),
                        ),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.9,
                      child: SizedBox(
                        child: ElevatedButton(
                          onPressed: (() => {
                                Navigator.pushNamed(context, "/leaderboards"),
                              }),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.cyan),
                          child: const Text("Leaderboards"),
                        ),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.9,
                      child: SizedBox(
                        child: ElevatedButton(
                          onPressed: (() => {playHomeMusic()}),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white),
                          child: const Text(
                            "Donate",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
