class User {
  String name;
  DateTime birthdate;

  User({required this.name, required this.birthdate});

  void updateData({required String name, required DateTime birthdate}) {
    this.name = name;
    this.birthdate = birthdate;
  }
}

User user = User(name: 'aaa', birthdate: DateTime.now());
