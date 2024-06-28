class AllTeachersModel {
  bool? success;
  List<Teachers>? teachers;

  AllTeachersModel({this.success, this.teachers});

  AllTeachersModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['teachers'] != null) {
      teachers = <Teachers>[];
      json['teachers'].forEach((v) {
        teachers!.add(new Teachers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.teachers != null) {
      data['teachers'] = this.teachers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Teachers {
  String? sId;
  String? email;
  String? password;
  String? role;
  String? name;
  int? phone;
  List<String>? subjects;
  String? gender;
  String? profilePic;
  int? iV;

  Teachers(
      {this.sId,
      this.email,
      this.password,
      this.role,
      this.name,
      this.phone,
      this.subjects,
      this.gender,
      this.profilePic,
      this.iV});

  Teachers.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    password = json['password'];
    role = json['role'];
    name = json['name'];
    phone = json['phone'];
    subjects = json['subjects'].cast<String>();
    gender = json['gender'];
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
    data['subjects'] = this.subjects;
    data['gender'] = this.gender;
    data['profilePic'] = this.profilePic;
    data['__v'] = this.iV;
    return data;
  }
}
