class User {
  // final String id;
  // final String bio;
  // final String email;
  // final String authType;
  // final String authId;
  // final String status;
  final String givenName;
  final String familyName;
  final String middleName;
  // final String gender;
  // final String dob;
  // final String address;
  // final String citizenship;
  // final String phone;
  // final String height;
  // final String weight;
  // final String religion;
  // final String picture;
  // final String date;

  User({
    // this.id,
    // this.bio,
    // this.email,
    // this.authType,
    // this.authId,
    // this.status,
    this.givenName,
    this.familyName,
    this.middleName,
    // this.gender,
    // this.dob,
    // this.address,
    // this.citizenship,
    // this.phone,
    // this.height,
    // this.weight,
    // this.religion,
    // this.picture,
    // this.date,
  });

  factory User.fromJson(Map<String,dynamic> json) {
    return new User(
      // id: json[0],
      // bio: json[1],
      // email: json[2],
      // authType: json[4],
      // authId: json[5],
      // status: json[6],
      givenName: json['othan'], //]json[8],
      familyName: json['millet'], //json[9],
      middleName: json['binalay'], //json[10],
      // gender: json[11],
      // dob: json[12],
      // address: json[13],
      // citizenship: json[14],
      // phone: json[15],
      // height: json[16],
      // weight: json[17],
      // religion: json[18],
      // picture: json[19],
      // date: json[20],
    );
  }
}
