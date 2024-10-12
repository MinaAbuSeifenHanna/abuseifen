class CreateAdvertiserEntity {
  final bool? status;
  final String? message;

  const CreateAdvertiserEntity({
    this.status,
    this.message,
  });

  factory CreateAdvertiserEntity.fromJson(Map<String, dynamic> json) {
    return CreateAdvertiserEntity(
      status: json['success'],
      message: json['message'],
    );
  }
}
