class ImageModel
{
  String? id;
  String? updatedAt;
  int? width;
  int? height;
  String? description;
  String? link;
  int? likes;

  ImageModel({
    this.id,
    this.updatedAt,
    this.width,
    this.height,
    this.description,
    this.link,
    this.likes,
  });

  // Map -> Object
  factory ImageModel.fromMap(Map<String, dynamic> map)
  {
    return ImageModel(
      id: map['id'],
      updatedAt: map['updatedAt'],
      width: map['width'],
      height: map['height'],
      description: map['description'],
      link: map['link'],
      likes: map['likes']
    );
  }

  // Object -> Map
  Map<String, dynamic> toMap()
  {
    return {
      'id': id,
      'updatedAt': updatedAt,
      'width': width,
      'heigth': height,
      'description': description,
      'link': link,
      'likes': likes
    };
  }
}