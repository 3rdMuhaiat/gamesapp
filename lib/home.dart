import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:gamesapp/detail.dart';
import 'package:gamesapp/model/gameModel.dart';
import 'package:line_icons/line_icons.dart';
import 'package:gamesapp/categories.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indexNow = 0;

  @override
  Widget build(BuildContext context) {
    List<Model> listGame = Model.gameList();
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
                                CategoryPage(category: "Adventure")));
                      },
                      child: categories(
                        warna: Color.fromARGB(255, 189, 178, 255),
                        icon: LineIcons.alternateShield,
                        nama: "Adventure",
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                CategoryPage(category: "Shooters")));
                      },
                      child: categories(
                        warna: Color.fromARGB(255, 156, 246, 255),
                        icon: LineIcons.crosshairs,
                        nama: "Shooters",
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                CategoryPage(category: "Simulation")));
                      },
                      child: categories(
                        warna: Color.fromARGB(255, 255, 174, 173),
                        icon: LineIcons.plane,
                        nama: "Simulation",
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
                                CategoryPage(category: "Sport")));
                      },
                      child: categories(
                        warna: Color.fromARGB(255, 253, 255, 182),
                        icon: LineIcons.footballBall,
                        nama: "Sport",
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                CategoryPage(category: "Race")));
                      },
                      child: categories(
                        warna: Color.fromARGB(255, 253, 198, 255),
                        icon: LineIcons.flagCheckered,
                        nama: "Race",
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
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: listGame.length,
                itemBuilder: (context, index) => trendinggames(
                  nama: listGame[index].name,
                  kategori: listGame[index].category,
                  warna: listGame[index].color,
                  harga: listGame[index].price,
                  rating: listGame[index].rating,
                  gambar: listGame[index].imageLogo,
                  gameModelDetail: listGame[index],
                ),
              ),
              // trendinggames(),
              // trendinggames(),
              // trendinggames(),
              // trendinggames(),
              // trendinggames(),
              // trendinggames(),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: DotNavigationBar(
            onTap: (p0) {
              setState(() {
                indexNow = p0;
              });
            },
            currentIndex: indexNow,
            items: [
              DotNavigationBarItem(
                icon: Icon(LineIcons.list),
                selectedColor: Color.fromARGB(255, 160, 196, 255),
                unselectedColor: Colors.grey,
              ),
              DotNavigationBarItem(
                icon: Icon(LineIcons.home),
                selectedColor: Color.fromARGB(255, 160, 196, 255),
                unselectedColor: Colors.grey,
              ),
              DotNavigationBarItem(
                icon: Icon(LineIcons.user),
                selectedColor: Color.fromARGB(255, 160, 196, 255),
                unselectedColor: Colors.grey,
              ),
            ],
            boxShadow: [
              BoxShadow(color: Colors.grey, spreadRadius: 0.5, blurRadius: 5),
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
  final Color warna;
  final String harga;
  final String rating;
  final String gambar;
  final Model gameModelDetail;

  const trendinggames({
    required this.nama,
    required this.kategori,
    required this.warna,
    required this.harga,
    required this.rating,
    required this.gambar,
    super.key,
    required this.gameModelDetail,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(gameModel: gameModelDetail),
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
                            image: AssetImage(gambar), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  //name, categories, price
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
                            backgroundColor: warna,
                          ),
                        ),
                        Text(
                          harga,
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
                      Text(
                        "⭐ " + rating,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.normal),
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
