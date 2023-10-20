// Model/game.dart
import 'dart:ui';

import 'package:flutter/material.dart';

class Model {
  final String name;
  final String category;
  final Color color;
  final String price;
  final String rating;
  final String image;
  final String imageLogo;
  final String description;

  Model(
    this.name,
    this.category,
    this.color,
    this.price,
    this.rating,
    this.image,
    this.imageLogo,
    this.description,
  );

  static List<Model> gameList() {
    return [
      Model(
          "Genshin",
          "Adventure",
          Color.fromARGB(255, 189, 178, 255),
          "free",
          "4,2",
          "assets/image/genshin.jpeg",
          "assets/image/gamelogo/genshinlogo.png",
          "Genshin Impact adalah permainan video yang dikembangkan oleh miHoYo, dirilis pada tahun 2020. Ini adalah permainan aksi dan petualangan yang berfokus pada peran pemain (RPG) yang tersedia secara gratis. Game ini tersedia untuk berbagai platform, termasuk PC, konsol, dan perangkat seluler."),
      Model(
          "Valorant",
          "Shooters",
          Color.fromARGB(255, 156, 246, 255),
          "free",
          "3,2",
          "assets/image/valorant.jpg",
          "assets/image/gamelogo/valorantlogo.png",
          "tetst desc"),
      Model(
          "CS 2",
          "Shooters",
          Color.fromARGB(255, 156, 246, 255),
          "free",
          "4,5",
          "assets/image/cs.jpg",
          "assets/image/gamelogo/cs.png",
          "tetst desc"),
      Model(
          "Fifa 23",
          "Sport",
          Color.fromARGB(255, 253, 255, 182),
          "Rp. 759.000",
          "2,5",
          "assets/image/fifa.jpg",
          "assets/image/gamelogo/fifa.png",
          "tetst desc"),
    ];
  }
}
