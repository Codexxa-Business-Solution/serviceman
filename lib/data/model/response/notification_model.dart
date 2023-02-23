class NotificationModel {
  String? responseCode;
  String? message;
  List<Content>? content;
  List<Errors>? errors;

  NotificationModel(
      {this.responseCode, this.message, this.content, this.errors});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    message = json['message'];
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(new Content.fromJson(v));
      });
    }
    if (json['errors'] != null) {
      errors = <Errors>[];
      json['errors'].forEach((v) {
        errors!.add(new Errors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response_code'] = this.responseCode;
    data['message'] = this.message;
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    if (this.errors != null) {
      data['errors'] = this.errors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Content {
  String? id;
  String? title;
  String? description;
  var coverImage;
  var zoneIds;
  List<String>? toUsers;
  int? isActive;
  String? createdAt;
  String? updatedAt;

  Content(
      {this.id,
        this.title,
        this.description,
        this.coverImage,
        this.zoneIds,
        this.toUsers,
        this.isActive,
        this.createdAt,
        this.updatedAt});

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    coverImage = json['cover_image'];
    zoneIds = json['zone_ids'];
    toUsers = json['to_users'].cast<String>();
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['cover_image'] = this.coverImage;
    data['zone_ids'] = this.zoneIds;
    data['to_users'] = this.toUsers;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Errors {
  String? errorCode;
  String? message;

  Errors({this.errorCode, this.message});

  Errors.fromJson(Map<String, dynamic> json) {
    errorCode = json['error_code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error_code'] = this.errorCode;
    data['message'] = this.message;
    return data;
  }
}
