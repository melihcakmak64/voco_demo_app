class User {
  int id;
  String email;
  String firstname;
  String lastname;
  String avatar;

  User(
      {required this.id,
      required this.email,
      required this.firstname,
      required this.lastname,
      required this.avatar});

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'],
        firstname = json['first_name'],
        lastname = json['last_name'],
        avatar = json['avatar'];

  @override
  String toString() {
    return 'User{id: $id, email: $email, firstname: $firstname, lastname: $lastname, avatar: $avatar}';
  }
}
