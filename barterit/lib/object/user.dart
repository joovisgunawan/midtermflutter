class User {
  String? id;
  String? email;
  String? name;
  String? password;

  User({
    this.id,
    this.email,
    this.name,
    this.password,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['user_id'];
    email = json['user_email'];
    name = json['user_name'];
    password = json['user_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['name'] = name;
    data['password'] = password;
    return data;
  }
}
