class UserModel {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  UserModel(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.avatar});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'] ?? 'First Name',
      lastName: json['last_name'] ?? 'Last Name',
      avatar: json['avatar'] ??
          "https://www.freepik.com/free-vector/breast-cancer-awareness-with-realistic-ribbon_5582997.htm#query=breast%20cancer&position=1&from_view=search&track=sph",
    );
  }
}
