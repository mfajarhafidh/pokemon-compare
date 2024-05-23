import 'dart:convert';

PokemonColorModel pokemonColorModelFromJson(String str) =>
    PokemonColorModel.fromJson(json.decode(str));

String pokemonColorModelToJson(PokemonColorModel data) =>
    json.encode(data.toJson());

class PokemonColorModel {
  int? id;
  String? name;
  List<Name>? names;
  List<PokemonSpecy>? pokemonSpecies;

  PokemonColorModel({
    this.id,
    this.name,
    this.names,
    this.pokemonSpecies,
  });

  factory PokemonColorModel.fromJson(Map<String, dynamic> json) =>
      PokemonColorModel(
        id: json["id"],
        name: json["name"],
        names: json["names"] == null
            ? []
            : List<Name>.from(json["names"]!.map((x) => Name.fromJson(x))),
        pokemonSpecies: json["pokemon_species"] == null
            ? []
            : List<PokemonSpecy>.from(
                json["pokemon_species"]!.map((x) => PokemonSpecy.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "names": names == null
            ? []
            : List<dynamic>.from(names!.map((x) => x.toJson())),
        "pokemon_species": pokemonSpecies == null
            ? []
            : List<dynamic>.from(pokemonSpecies!.map((x) => x.toJson())),
      };
}

class Name {
  PokemonSpecy? language;
  String? name;

  Name({
    this.language,
    this.name,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        language: json["language"] == null
            ? null
            : PokemonSpecy.fromJson(json["language"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "language": language?.toJson(),
        "name": name,
      };
}

class PokemonSpecy {
  String? name;
  String? url;

  PokemonSpecy({
    this.name,
    this.url,
  });

  factory PokemonSpecy.fromJson(Map<String, dynamic> json) => PokemonSpecy(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
