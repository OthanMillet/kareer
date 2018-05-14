class Post {
  final int id;
  final String name;
  final String username;
  final String email;
  final String address;

  Post({this.id, this.name, this.username, this.email, this.address});

  factory Post.fromJson(Map<String, dynamic> json) {
    return new Post(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: json['address'],
    );
  }
}

// class Insert {
//   final String firstname;
//   final String lastname;
//   final String email;
//   final String password;

//   Insert({this.firstname, this.lastname, this.email, this.password});

//   factory Insert.fromJson(Map<String, dynamic> json) {
//     return new Insert(
//       firstname: json['firstname'],
//       lastname: json['lastname'],
//       email: json['email'],
//       password: json['password'],
//     );
//   }
// }