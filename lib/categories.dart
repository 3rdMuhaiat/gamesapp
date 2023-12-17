import 'package:flutter/material.dart';
import 'package:gamesapp/detail.dart';
import 'package:gamesapp/home.dart';
import 'package:gamesapp/model/model.dart';
import 'package:gamesapp/service/categoryapi.dart';

class CategoryPage extends StatefulWidget {
  final String category;
  const CategoryPage({Key? key, required this.category}) : super(key: key);
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late List<GameApi> games = [];
  late bool isLoading = true;
  @override
  void initState() {
    super.initState();
    _fetchGamesByCategory();
  }

  Future<void> _fetchGamesByCategory() async {
    try {
      List<GameApi> data =
          await CategoryApi().fetchGamesByCategory(widget.category);
      setState(() {
        games = data;
        isLoading = false;
      });
    } catch (error) {
      print('Error fetching data from API: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget _buildLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          _buildGameList(),
          if (isLoading) _buildLoadingIndicator(),
        ],
      ),
    );
  }

  _buildGameList() {
    return ListView.builder(
      itemCount: games.length,
      itemBuilder: (context, index) {
        GameApi apiGame = games[index];

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(apigame: apiGame),
              ),
            );
          },
          child: trendinggames(
              nama: apiGame.title,
              kategori: apiGame.genre,
              publisher: apiGame.publisher,
              platform: apiGame.platform,
              gambar: apiGame.thumbnail,
              apigame: apiGame),
        );
      },
    );
  }
}
