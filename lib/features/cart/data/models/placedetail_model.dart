
class PlaceDetail {
  final Result result;

  PlaceDetail(this.result);
  factory PlaceDetail.fromJson(Map<String, dynamic> json) => PlaceDetail(
       Result.fromJson(json['result']) ,
      );
}

class Result {
  final Geometry geometry;

  Result(this.geometry);
  factory Result.fromJson(Map<String, dynamic> json) => Result(
       Geometry.fromJson(json['geometry']) ,
      );
}

class Geometry {
  final Location location;

  Geometry(this.location);
  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
       Location.fromJson(json['location']),
      );
}

class Location {
  final double lat;
  final double lng;

  Location(this.lat, this.lng);
  factory Location.fromJson(Map<String, dynamic> json) =>
      Location(json['lat'], json['lng']);
}
