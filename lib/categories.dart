import 'package:flutter/material.dart';
import 'package:gamesapp/home.dart';
import 'package:gamesapp/model/gameModel.dart';

class CategoryPage extends StatelessWidget {
  final String category;

  CategoryPage({required this.category});

  @override
  Widget build(BuildContext context) {
    List<Model> games =
        Model.gameList().where((game) => game.category == category).toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          category,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView.builder(
        itemCount: games.length,
        itemBuilder: (context, index) {
          return trendinggames(
            nama: games[index].name,
            kategori: games[index].category,
            warna: games[index].color,
            harga: games[index].price,
            rating: games[index].rating,
            gambar: games[index].imageLogo,
            gameModelDetail: games[index],
          );
        },
      ),
    );
  }
}
