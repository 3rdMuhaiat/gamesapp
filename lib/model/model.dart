class GameApi {
  final int id;
  final String title;
  final String thumbnail;
  final String genre;
  final String description;
  final String release_date;
  final String game_url;
  final String platform;
  final String publisher;

  const GameApi({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.genre,
    required this.description,
    required this.release_date,
    required this.game_url,
    required this.platform,
    required this.publisher,
  });

  factory GameApi.fromJson(Map<String, dynamic> json) {
    return GameApi(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      genre: json['genre'] ?? '',
      description: json['short_description'] ?? '',
      release_date: json['release_date'] ?? '',
      game_url: json['game_url'] ?? '',
      platform: json['platform'] ?? '',
      publisher: json['publisher'] ?? '',
    );
  }
}
