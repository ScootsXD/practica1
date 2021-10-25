class ActorModel
{
  int? id;
  String? knownForDepartment;
  String? name;
  int? castId;
  String? profilePath;
  String? character;

  ActorModel({
    this.id,
    this.knownForDepartment,
    this.name,
    this.castId,
    this.profilePath,
    this.character,
  });

  factory ActorModel.fromMap(Map<String, dynamic> map)
  {
    return ActorModel(
      id: map['id'],
      knownForDepartment: map['known_for_department'],
      name: map['name'],
      castId: map['cast_id'],
      profilePath: map['profile_path'],
      character: map['character']
    );
  }
}
