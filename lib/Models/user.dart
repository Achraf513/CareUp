
class CustomUserFields{
  static final String id = "id";
  static final String firstTimeUse ="firstTimeUse";
  static final String email = "email";
  static final String birthday = "birthday";
  static final String location = "location";
  static final String passwordHashed = "passwordHashed";
  static final String phoneNumber = "phoneNumber";
  static final String picURL = "picURL";
  static final String gender = "gender";
  static final String name = "name";
  static final String familyname = "familyname";
}

class CustomUser{
  final String? id;
  final bool firstTimeUse;
  final String email;
  final String birthday;
  final String location;
  final String passwordHashed;
  final String phoneNumber;
  final String picURL;
  final String gender;
  final String name;
  final String familyname;

  CustomUser({
    this.id,
    required this.firstTimeUse,
    required this.birthday,
    required this.email,
    required this.gender,
    required this.location,
    required this.passwordHashed,
    required this.phoneNumber,
    required this.picURL,
    required this.name,
    required this.familyname
  });
 
  Map<String, Object?> toJSON(){
    return {
      CustomUserFields.id : id,
      CustomUserFields.firstTimeUse : firstTimeUse,
      CustomUserFields.birthday : birthday,
      CustomUserFields.email : email,
      CustomUserFields.gender : gender,
      CustomUserFields.location : location,
      CustomUserFields.passwordHashed : passwordHashed,
      CustomUserFields.phoneNumber : phoneNumber,
      CustomUserFields.picURL : picURL,
      CustomUserFields.name : name,
      CustomUserFields.familyname : familyname,
    };
  }

  static CustomUser fromJson(Map<String, Object?> json) => CustomUser(
    id: json[CustomUserFields.id] as String?,
    firstTimeUse: json[CustomUserFields.firstTimeUse] as bool,
    birthday: json[CustomUserFields.birthday] as String,
    email: json[CustomUserFields.email] as String,
    gender: json[CustomUserFields.gender] as String,
    location: json[CustomUserFields.location] as String,
    passwordHashed: json[CustomUserFields.passwordHashed] as String,
    phoneNumber: json[CustomUserFields.phoneNumber] as String,
    picURL: json[CustomUserFields.picURL] as String,
    name: json[CustomUserFields.name] as String,
    familyname: json[CustomUserFields.familyname] as String,
  );

  CustomUser copy({
    String? id,
    bool? firstTimeUse,
    String? email,
    String? birthday,
    String? location,
    String? passwordHashed,
    String? phoneNumber,
    String? picURL,
    String? gender,
    String? name,
    String? familyname
  }) => CustomUser(
    id : id?? this.id,
    firstTimeUse : firstTimeUse?? this.firstTimeUse,
    email : email?? this.email,
    birthday : birthday?? this.birthday,
    location : location?? this.location,
    passwordHashed : passwordHashed?? this.passwordHashed,
    phoneNumber : phoneNumber?? this.phoneNumber,
    picURL : picURL?? this.picURL,
    gender : gender?? this.gender,
    name : name?? this.name,
    familyname : familyname?? this.familyname,
  );

} 


