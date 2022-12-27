class PlacesModel {
  final String status;
  final List<Suggestion> suggestions;

  PlacesModel(this.status, this.suggestions);

  factory PlacesModel.fromJson(Map<String, dynamic> json) {
    return PlacesModel(
      json['status'],
      List<Suggestion>.from(
          json['predictions'].map((x) => Suggestion.fromJson(x))),
    );
  }
}

class Suggestion {
  final String placeId;
  final String description;

  Suggestion(
    this.placeId,
    this.description,
  );

  factory Suggestion.fromJson(Map<String, dynamic> json) {
    return Suggestion(json["place_id"], json["description"]);
  }
}
