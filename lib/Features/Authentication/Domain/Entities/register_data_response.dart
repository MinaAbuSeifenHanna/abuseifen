class RegisterDataResponse {
  final int id;
  final String email;
  final String name;
  final String user_name;
  final String bio;
  final String address;
  final String gender;
  final String token;
  final bool complete_profile;

  RegisterDataResponse({
    required this.id,
    required this.email,
    required this.name,
    required this.user_name,
    required this.bio,
    required this.address,
    required this.gender,
    required this.token,
    required this.complete_profile,
  });

  factory RegisterDataResponse.fromJson(Map<String, dynamic> json) {
    return RegisterDataResponse(
      id: json['id'],
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      user_name: json['user_name'] ?? '',
      bio: json['bio'] ?? '',
      address: json['address'] ?? '',
      gender: json['gender'] ?? '',
      token: json['token'] ?? '',
      complete_profile: json['complete_profile'] ?? true,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'user_name': user_name,
      'bio': bio,
      'address': address,
      'gender': gender,
      'token': token,
      'complete_profile': complete_profile,
    };
  }
}
