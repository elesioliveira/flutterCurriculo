// ignore_for_file: public_member_api_docs, sort_constructors_first
class PersonModel {
  int id;
  String title;
  String body;
  int userId;

  PersonModel({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
        id: json['id'],
        userId: json['userId'],
        title: json['title'],
        body: json['body']);
  }

  static List<PersonModel> fromJsonList(List list) {
    return list.map((person) => PersonModel.fromJson(person)).toList();
  }

  @override
  String toString() {
    return 'PersonModel(id: $id, title: $title, body: $body, userId: $userId)';
  }
}
