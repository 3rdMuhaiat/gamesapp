import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gamesapp/detail.dart';
import 'package:gamesapp/model/model.dart';
import 'package:gamesapp/service/categoryapi.dart';
import 'package:gamesapp/service/gameapi.dart';
import 'package:line_icons/line_icons.dart';
import 'package:gamesapp/categories.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  final PageController _pageController = PageController();
  late Timer _timer;
  late List<GameApi> apiGames = [];

  @override
  void initState() {
    super.initState();
    _startTimer();
    _fetchApiData();
  }

  void _fetchApiData() async {
    try {
      List<GameApi> data = await GameReq().getData();
      setState(() {
        apiGames = data;
      });
    } catch (e) {
      print('Error fetching data from API: $e');
    }
  }

  void _fetchGamesByCategory(String category) async {
    try {
      List<GameApi> games = await CategoryApi().fetchGamesByCategory(category);
      setState(() {
        print(games);
      });
    } catch (error) {
      print('Error: $error');
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentPage < 4) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              //gamesText
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Games",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              //categories
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: 17,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                CategoryPage(category: "MMORPG")));
                      },
                      child: categories(
                        warna: Color.fromARGB(255, 189, 178, 255),
                        icon: LineIcons.alternateShield,
                        nama: "MMORPG",
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                CategoryPage(category: "Shooter")));
                      },
                      child: categories(
                        warna: Color.fromARGB(255, 156, 246, 255),
                        icon: LineIcons.crosshairs,
                        nama: "Shooter",
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                CategoryPage(category: "Space")));
                      },
                      child: categories(
                        warna: Color.fromARGB(255, 255, 174, 173),
                        icon: LineIcons.plane,
                        nama: "Space",
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                CategoryPage(category: "Strategy")));
                      },
                      child: categories(
                        warna: Color.fromARGB(255, 203, 255, 191),
                        icon: LineIcons.chess,
                        nama: "Strategy",
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                CategoryPage(category: "Sports")));
                      },
                      child: categories(
                        warna: Color.fromARGB(255, 253, 255, 182),
                        icon: LineIcons.footballBall,
                        nama: "Sports",
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                CategoryPage(category: "Racing")));
                      },
                      child: categories(
                        warna: Color.fromARGB(255, 253, 198, 255),
                        icon: LineIcons.flagCheckered,
                        nama: "Racing",
                      ),
                    ),
                  ],
                ),
              ),
              //trending list
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Trending Now",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 1000,
                child: apiGames.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          GameApi apiGame = apiGames[index];
                          return trendinggames(
                              nama: apiGame.title,
                              kategori: apiGame.genre,
                              publisher: apiGame.publisher,
                              platform: apiGame.platform,
                              gambar: apiGame.thumbnail,
                              apigame: apiGame);
                        }),
              )
            ],
          ),
        ),
      ]),
    );
  }
}

class trendinggames extends StatelessWidget {
  final String nama;
  final String kategori;
  final String publisher;
  final String platform;
  final String gambar;
  final GameApi apigame;

  const trendinggames({
    required this.nama,
    required this.kategori,
    required this.publisher,
    required this.platform,
    required this.gambar,
    super.key,
    required this.apigame,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(apigame: apigame),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        child: Column(
          children: [
            Container(
              height: 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(gambar), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          nama,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Transform(
                          transform: new Matrix4.identity()..scale(0.7),
                          child: Chip(
                            label: Text(
                              kategori,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 156, 246, 255),
                          ),
                        ),
                        Text(
                          publisher,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Column(
                    children: [
                      SizedBox(
                        height: 4,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey.withOpacity(0.2), thickness: 1.5),
          ],
        ),
      ),
    );
  }
}

class categories extends StatelessWidget {
  final Color warna;
  final IconData icon;
  final String nama;

  const categories({
    super.key,
    required this.warna,
    required this.icon,
    required this.nama,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                color: warna, borderRadius: BorderRadius.circular(50)),
            child: Icon(icon, size: 40),
          ),
          SizedBox(height: 10),
          Text(
            nama,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
