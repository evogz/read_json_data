class Country {
  Country({
    this.name,
    this.iso2,
    this.long,
    this.lat,
  });

  String? name;
  String? iso2;
  dynamic long;
  dynamic lat;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"],
        iso2: json["iso2"],
        long: json["long"],
        lat: json["lat"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "iso2": iso2,
        "long": long,
        "lat": lat,
      };
}
