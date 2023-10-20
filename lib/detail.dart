import 'package:flutter/material.dart';
import 'package:gamesapp/model/gameModel.dart';
import 'package:line_icons/line_icon.dart';

class DetailPage extends StatelessWidget {
  final Model gameModel;
  const DetailPage({super.key, required this.gameModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 25),
          child: Column(
            children: [
              Container(
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(gameModel.image), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: LineIcon.arrowCircleLeft(
                      color: Colors.white,
                      size: 40,
                    )),
                alignment: Alignment.topLeft,
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              gameModel.name,
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.w400),
                            ),
                            Row(
                              children: [
                                Text(
                                  "⭐ ${gameModel.rating}",
                                  style: TextStyle(fontWeight: FontWeight.w800),
                                ),
                                Text(" - 36K reviews",
                                    style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 155, 155, 155)))
                              ],
                            )
                          ],
                        ),
                        Text("\$ ${gameModel.price}",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      gameModel.description,
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                    SizedBox(height: 25),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Beli Sekarang"),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 40),
                          backgroundColor: Colors.blue),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
