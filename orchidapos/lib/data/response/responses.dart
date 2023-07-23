
//This code defines a set of data classes (models) that are used to map
// JSON responses from API calls to Dart objects and vice versa. It utilizes 
//the json_serializable package to automatically generate JSON serialization and deserialization methods for these classes.
import 'package:json_annotation/json_annotation.dart';
 part 'responses.g.dart';
@JsonSerializable()
class BaseResponse {
  // the first roul (اي اشي رح ييجي من ال api nullلازم اتوقع انه ممكن يكون )
  @JsonKey(name: 'statas')// اسمها في ال API
  int ?status;// اللي رح استخدمه بالمشروع
  @JsonKey(name: 'massage')
  String ?massage;
  
}

@JsonSerializable()
class CustomerResponse {
  // the first roul (اي اشي رح ييجي من ال api nullلازم اتوقع انه ممكن يكون )
  @JsonKey(name: 'id')// اسمها في ال API
  String ?id;// اللي رح استخدمه بالمشروع
  @JsonKey(name: 'name')
  String ?name;
  @JsonKey(name: 'nomberOfNotifications')// اسمها في ال API
  int ?inomberOfNotificationsd;
  CustomerResponse(this.id,this.name,this.inomberOfNotificationsd);

  // From json
 factory CustomerResponse.fromJson(Map<String,dynamic>json) => _$CustomerResponseFromJson(json);

  get numberOfNotifications => null;

  //To json
  Map<String,dynamic> toJson() => _$CustomerResponseToJson(this);
  
}

@JsonSerializable()
class ContactsResponse {
  // the first roul (اي اشي رح ييجي من ال api nullلازم اتوقع انه ممكن يكون )
  @JsonKey(name: 'phone')// اسمها في ال API
  int ?phone;// اللي رح استخدمه بالمشروع
  @JsonKey(name: 'email')
  String ?email;
  @JsonKey(name: 'link')// اسمها في ال API
  String ?link;
  ContactsResponse(this.phone,this.email,this.link);

  // From json
 factory ContactsResponse.fromJson(Map<String,dynamic>json) => _$ContactsResponseFromJson(json);

  //To json
  Map<String,dynamic> toJson() => _$ContactsResponseToJson(this);

  
}
@JsonSerializable()
class AuthenticationResponse extends BaseResponse {
   @JsonKey(name: 'customer')// اسمها في ال API
  CustomerResponse ?customer;
   @JsonKey(name: 'Contacts')
  ContactsResponse ?Contacts;
  AuthenticationResponse(this.customer , this.Contacts);
  // عشان اعمل الملف الثاني رحت على التيرمنال وحطيت هذا السطر :
  //flutter pub get ; flutter pub run build_runner build --delete-conflicting-outputs


  // From json
 factory AuthenticationResponse.fromJson(Map<String,dynamic>json) => _$AuthenticationResponseFromJson(json);

  //To json
  Map<String,dynamic> toJson() => _$AuthenticationResponseToJson(this);

  // Convert to domain model (Authentication)
  

  
}