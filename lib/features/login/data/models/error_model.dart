class ErrorModel {
  bool? success;
  String? message;

  ErrorModel(this.message, this.success);
  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      ErrorModel(json["message"], json['success']);
}
