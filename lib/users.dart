class User {
  String _firstname;
  String _lastname;
  String _email;
  String _password;

  User(this._firstname, this._lastname, this._email, this._password);

  User.map(dynamic obj) {
    this._firstname = obj['firstname'];
    this._lastname = obj['lastname'];
    this._email = obj['email'];
    this._password = obj['password'];
  }

  String get firstname => _firstname;
  String get lastname => _lastname;
  String get email => _email;
  String get password => _password;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["firstname"] = _firstname;
    map["lastname"] = _lastname;    
    map["username"] = _email;
    map["password"] = _password;
    return map;
  }
}