
class PlaceHolder {
  const PlaceHolder({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  final int userId;
  final int id;
  final String title;
  final String body;


  factory PlaceHolder.fromJson(Map<String, dynamic> map) {
    return PlaceHolder(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }
}
