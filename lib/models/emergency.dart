class Emergency {
  int id;
  String name;
  String description;
  int type;
  String coordinates;
  String photo;

  Emergency({this.id, this.name, this.description, this.type, this.coordinates, this.photo});

  factory Emergency.fromMap(Map<String, dynamic> json) => new Emergency(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    type: json["type"],
    coordinates: json["coordinates"],
    photo: json["photo"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "description": description,
    "type": type,
    "coordinates": coordinates,
    "photo": photo,
  };
}