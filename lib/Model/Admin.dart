class AdminList {
  List<Admin> adminList = new List<Admin>();

  AdminList.fromJson(json) {
    json.forEach((data) {
      print("Admin Data  ${data}");

      adminList.add(Admin.fromJson(data));
    });
  }
}

class Admin {
  int id;
  String name;
  String email;
  String phone;
  String joiningDate;
  String picture;
  String nid;
  String address;
  String password;
  String familyContact;
  String type;
  String createdAt;
  String updatedAt;

  Admin(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.joiningDate,
      this.picture,
      this.nid,
      this.address,
      this.password,
      this.familyContact,
      this.type,
      this.createdAt,
      this.updatedAt});

  Admin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['Name'];
    email = json['Email'];
    phone = json['Phone'];
    joiningDate = json['JoiningDate'];
    picture = json['Picture'];
    nid = json['Nid'];
    address = json['Address'];
    password = json['Password'];
    familyContact = json['FamilyContact'];
    type = json['type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Name'] = this.name;
    data['Email'] = this.email;
    data['Phone'] = this.phone;
    data['JoiningDate'] = this.joiningDate;
    data['Picture'] = this.picture;
    data['Nid'] = this.nid;
    data['Address'] = this.address;
    data['Password'] = this.password;
    data['FamilyContact'] = this.familyContact;
    data['type'] = this.type;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
