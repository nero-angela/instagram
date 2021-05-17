class FeedModel {
  String imageUrl;
  String name;
  String description;
  DateTime createdAt;
  int likes;
  bool likedByUser;

  FeedModel({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.likes,
    required this.likedByUser,
  });

  // factory는 해당 클래스의 인스턴스를 반환합니다.
  factory FeedModel.fromJson(Map<String, dynamic> json) {
    return FeedModel(
      imageUrl: json['urls']['regular'] as String,
      name: json['user']['name'] as String,

      // json['description']이 null인 경우 json['alt_description']을 넣음
      description: json['description'] == null ? json['alt_description'] : json['description'] as String,

      // json['created_at']이 null인 경우 현재 시간을 넣음
      createdAt: json['created_at'] == null ? DateTime.now() : DateTime.parse(json['created_at'] as String),
      likes: json['likes'] as int,
      likedByUser: json['liked_by_user'] as bool,
    );
  }
}
