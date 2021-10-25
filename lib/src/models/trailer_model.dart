class TrailerModel
{
  String? name;
  String? key;
  String? type;
  bool? official;

  TrailerModel({
    this.name,
    this.key,
    this.type,
    this.official
  });

  factory TrailerModel.fromMap(Map<String, dynamic> map)
  {
    return TrailerModel(
      name: map['name'],
      key: map['key'],
      type: map['type'],
      official: map['official']
    );
  }
}