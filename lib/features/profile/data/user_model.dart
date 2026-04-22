class UserModel {
  final String id;
  final String name;
  final String email;
  final String profilePictureUrl;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.profilePictureUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      profilePictureUrl: json['profile_picture'] ?? '',
    );
  }
}