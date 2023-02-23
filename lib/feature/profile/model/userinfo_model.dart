
class ProfileDataModel {
  ProfileDataModel({
    this.responseCode,
    this.message,
    this.content,
  });

  String?  responseCode;
  String?  message;
  ProfileContent?  content;

  factory ProfileDataModel.fromJson(Map<String, dynamic> json) => ProfileDataModel(
    responseCode: json["response_code"],
    message: json["message"],
    content: ProfileContent.fromJson(json["content"]),
  );

  Map<String, dynamic> toJson() => {
    "response_code": responseCode,
    "message": message,
    "content": content!.toJson(),
  };
}

class ProfileContent {
  String? id;
  String? providerId;
  String? userId;
  String? createdAt;
  String? updatedAt;
  var deletedAt;
  int? bookingsCount;
  int? completedBookingsCount;
  Provider ? provider;
  ProfileContent(
      {this.id,
        this.providerId,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.bookingsCount,
        this.completedBookingsCount,
        this.provider,
      });

  ProfileContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    providerId = json['provider_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    bookingsCount = int.parse(json['bookings_count'].toString());
    completedBookingsCount = int.parse(json['completed_bookings_count'].toString());
    provider =  Provider.fromJson(json['provider']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['provider_id'] = this.providerId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['bookings_count'] = this.bookingsCount;
    data['completed_bookings_count'] = this.completedBookingsCount;
    return data;
  }
}

class Provider {
  String? _id;
  String? _zoneId;

  Provider({String? id, String? zoneId}) {
    if (id != null) {
      this._id = id;
    }
    if (zoneId != null) {
      this._zoneId = zoneId;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get zoneId => _zoneId;
  set zoneId(String? zoneId) => _zoneId = zoneId;

  Provider.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _zoneId = json['zone_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['zone_id'] = this._zoneId;
    return data;
  }
}

