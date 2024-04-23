class NoteModel {
  final int? id;
  final String title;
  final String description;

  // constructor
  const NoteModel({this.id, required this.title, required this.description});

  // map to json
  Map<String, dynamic> toJson() =>{
    'id':id,
    'title':title,
    'description':description
  };

  // json to map
  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
    id: json['id'],
    title: json['title'],
    description: json['description'],
  );
}
