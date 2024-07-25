class FetchAllStudentsModel {
  bool? success;
  List<Students>? students;

  FetchAllStudentsModel({this.success, this.students});

  FetchAllStudentsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['students'] != null) {
      students = <Students>[];
      json['students'].forEach((v) {
        students!.add(new Students.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.students != null) {
      data['students'] = this.students!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Students {
  String? sId;
  String? email;
  String? password;
  String? role;
  String? name;
  int? phone;
  String? grade;
  List<String>? subjects;
  String? gender;
  String? city;
  String? profilePic;
  int? iV;

  Students(
      {this.sId,
      this.email,
      this.password,
      this.role,
      this.name,
      this.phone,
      this.grade,
      this.subjects,
      this.gender,
      this.city,
      this.profilePic,
      this.iV});

  Students.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    password = json['password'];
    role = json['role'];
    name = json['name'];
    phone = json['phone'];
    grade = json['grade'];
    subjects =
        json['subjects'] != null ? List<String>.from(json['subjects']) : null;
    gender = json['gender'];
    city = json['city'];
    profilePic = json['profilePic'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['password'] = this.password;
    data['role'] = this.role;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['grade'] = this.grade;
    if (this.subjects != null) {
      data['subjects'] = this.subjects;
    }
    data['gender'] = this.gender;
    data['city'] = this.city;
    data['profilePic'] = this.profilePic;
    data['__v'] = this.iV;
    return data;
  }
}
