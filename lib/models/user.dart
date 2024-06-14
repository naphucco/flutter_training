class User {
  final int usrId;
  final String usrLoginname;

  User(this.usrId, this.usrLoginname);

  @override
  String toString() {
    return 'User{usrId: $usrId, usrLoginname: $usrLoginname}';
  }

  // Factory method to create ListItem from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['usrId'] as int,
      json['usrLoginname'] as String,
    );
  }
}
