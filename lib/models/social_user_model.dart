
class SocialUserModel
{
  late String? name;
  late String? email;
  late String? phone;
  late String? uId;
  bool? isEmailVerified;

  SocialUserModel({
     this.email,
     this.phone,
     this.name,
     this.uId,
    this.isEmailVerified,
  });

  //  LoginModel.fromJson(Map<String, dynamic> json) {
  SocialUserModel.fromJson(Map<String, dynamic> json)
  {
  email = json['email'];
  phone = json['phone'];
  name = json['name'];
  uId = json['uId'];
  isEmailVerified = json['isEmailVerified'];
  }
  Map<String, dynamic> toMap()
  {
    return {
      'name':name,
      'email':email,
      'uId':uId,
      'phone':phone,
      'isEmailVerified':isEmailVerified,
      // 'phone':phone,
    };
  }
}