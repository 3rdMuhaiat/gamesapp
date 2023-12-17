import 'package:flutter/material.dart';
import 'package:gamesapp/model/model.dart';
import 'package:gamesapp/service/detailapi.dart';
import 'package:line_icons/line_icon.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final GameApi apigame;
  final DetailReq detailReq = DetailReq();

  DetailPage({Key? key, required this.apigame}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: detailReq.fetchDetail(apigame.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 10, top: 25),
                child: Column(
                  children: [
                    Container(
                      height: 350,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(apigame.thumbnail),
                            fit: BoxFit.cover),
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
                                    apigame.title,
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "${apigame.release_date}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800),
                                      ),
                                      Text(" - Released",
                                          style: TextStyle(
                                              color: const Color.fromARGB(
                                                  255, 155, 155, 155)))
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            apigame.description,
                            style: TextStyle(fontSize: 16, height: 1.5),
                          ),
                          SizedBox(height: 25),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: ElevatedButton(
                                onPressed: () {
                                  _launchUrl(apigame.game_url);
                                },
                                child: Text("Beli Sekarang"),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(double.infinity, 40),
                                  backgroundColor: Colors.blue,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri(scheme: "", host: url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
