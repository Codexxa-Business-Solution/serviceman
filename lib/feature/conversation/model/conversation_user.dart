///conversation user for channel model and for conversation model
class ConversationUserModel {
  String? id;
  String? channelId;
  String? userId;
  var deletedAt;
  var createdAt;
  var updatedAt;
  int? isRead;
  ConversationUser? user;

  ConversationUserModel(
      {this.id,
        this.channelId,
        this.userId,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.user,
        this.isRead
      });

  ConversationUserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    channelId = json['channel_id'];
    userId = json['user_id'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new ConversationUser.fromJson(json['user']) : null;
    isRead= json['is_read'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['channel_id'] = this.channelId;
    data['user_id'] = this.userId;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class ConversationUser {
  String? id;
  var roleId;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  var identificationNumber;
  String? identificationType;
  var dateOfBirth;
  String? gender;
  String? profileImage;
  String? fcmToken;
  int? isPhoneVerified;
  int? isEmailVerified;
  var phoneVerifiedAt;
  var emailVerifiedAt;
  int? isActive;
  String? userType;
  var rememberToken;
  var deletedAt;
  String? createdAt;
  String? updatedAt;
  ProviderModel ? provider;

  ConversationUser(
      {this.id,
        this.roleId,
        this.firstName,
        this.lastName,
        this.email,
        this.phone,
        this.identificationNumber,
        this.identificationType,
        this.dateOfBirth,
        this.gender,
        this.profileImage,
        this.fcmToken,
        this.isPhoneVerified,
        this.isEmailVerified,
        this.phoneVerifiedAt,
        this.emailVerifiedAt,
        this.isActive,
        this.userType,
        this.rememberToken,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.provider,
      });

  ConversationUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roleId = json['role_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    identificationNumber = json['identification_number'];
    identificationType = json['identification_type'];

    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    profileImage = json['profile_image'];
    fcmToken = json['fcm_token'];
    isPhoneVerified = json['is_phone_verified'];
    isEmailVerified = json['is_email_verified'];
    phoneVerifiedAt = json['phone_verified_at'];
    emailVerifiedAt = json['email_verified_at'];
    isActive = json['is_active'];
    userType = json['user_type'];
    rememberToken = json['remember_token'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    provider = json['provider'] != null ? ProviderModel.fromJson(json['provider']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['role_id'] = this.roleId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['identification_number'] = this.identificationNumber;
    data['identification_type'] = this.identificationType;

    data['date_of_birth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['profile_image'] = this.profileImage;
    data['fcm_token'] = this.fcmToken;
    data['is_phone_verified'] = this.isPhoneVerified;
    data['is_email_verified'] = this.isEmailVerified;
    data['phone_verified_at'] = this.phoneVerifiedAt;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['is_active'] = this.isActive;
    data['user_type'] = this.userType;
    data['remember_token'] = this.rememberToken;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}




class ProviderModel {
  String? _id;
  String? _userId;
  String? _companyName;
  String? _companyPhone;
  String? _companyAddress;
  String? _companyEmail;
  String? _logo;
  String? _contactPersonName;
  String? _contactPersonPhone;
  String? _contactPersonEmail;
  int? _orderCount;
  int? _serviceManCount;
  int? _serviceCapacityPerDay;
  int? _ratingCount;
  int? _commissionStatus;
  int? _commissionPercentage;
  int? _isActive;
  String? _createdAt;
  String? _updatedAt;
  int? _isApproved;
  String? _zoneId;

  ProviderModel(
      {String? id,
        String? userId,
        String? companyName,
        String? companyPhone,
        String? companyAddress,
        String? companyEmail,
        String? logo,
        String? contactPersonName,
        String? contactPersonPhone,
        String? contactPersonEmail,
        int? orderCount,
        int? serviceManCount,
        int? serviceCapacityPerDay,
        int? ratingCount,
        int? avgRating,
        int? commissionStatus,
        int? commissionPercentage,
        int? isActive,
        String? createdAt,
        String? updatedAt,
        int? isApproved,
        String? zoneId}) {
    if (id != null) {
      this._id = id;
    }
    if (userId != null) {
      this._userId = userId;
    }
    if (companyName != null) {
      this._companyName = companyName;
    }
    if (companyPhone != null) {
      this._companyPhone = companyPhone;
    }
    if (companyAddress != null) {
      this._companyAddress = companyAddress;
    }
    if (companyEmail != null) {
      this._companyEmail = companyEmail;
    }
    if (logo != null) {
      this._logo = logo;
    }
    if (contactPersonName != null) {
      this._contactPersonName = contactPersonName;
    }
    if (contactPersonPhone != null) {
      this._contactPersonPhone = contactPersonPhone;
    }
    if (contactPersonEmail != null) {
      this._contactPersonEmail = contactPersonEmail;
    }
    if (orderCount != null) {
      this._orderCount = orderCount;
    }
    if (serviceManCount != null) {
      this._serviceManCount = serviceManCount;
    }
    if (serviceCapacityPerDay != null) {
      this._serviceCapacityPerDay = serviceCapacityPerDay;
    }
    if (ratingCount != null) {
      this._ratingCount = ratingCount;
    }
    if (commissionStatus != null) {
      this._commissionStatus = commissionStatus;
    }
    if (commissionPercentage != null) {
      this._commissionPercentage = commissionPercentage;
    }
    if (isActive != null) {
      this._isActive = isActive;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (isApproved != null) {
      this._isApproved = isApproved;
    }
    if (zoneId != null) {
      this._zoneId = zoneId;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get userId => _userId;
  set userId(String? userId) => _userId = userId;
  String? get companyName => _companyName;
  set companyName(String? companyName) => _companyName = companyName;
  String? get companyPhone => _companyPhone;
  set companyPhone(String? companyPhone) => _companyPhone = companyPhone;
  String? get companyAddress => _companyAddress;
  set companyAddress(String? companyAddress) =>
      _companyAddress = companyAddress;
  String? get companyEmail => _companyEmail;
  set companyEmail(String? companyEmail) => _companyEmail = companyEmail;
  String? get logo => _logo;
  set logo(String? logo) => _logo = logo;
  String? get contactPersonName => _contactPersonName;
  set contactPersonName(String? contactPersonName) =>
      _contactPersonName = contactPersonName;
  String? get contactPersonPhone => _contactPersonPhone;
  set contactPersonPhone(String? contactPersonPhone) =>
      _contactPersonPhone = contactPersonPhone;
  String? get contactPersonEmail => _contactPersonEmail;
  set contactPersonEmail(String? contactPersonEmail) =>
      _contactPersonEmail = contactPersonEmail;
  int? get orderCount => _orderCount;
  set orderCount(int? orderCount) => _orderCount = orderCount;
  int? get serviceManCount => _serviceManCount;
  set serviceManCount(int? serviceManCount) =>
      _serviceManCount = serviceManCount;
  int? get serviceCapacityPerDay => _serviceCapacityPerDay;
  set serviceCapacityPerDay(int? serviceCapacityPerDay) =>
      _serviceCapacityPerDay = serviceCapacityPerDay;
  int? get ratingCount => _ratingCount;
  set ratingCount(int? ratingCount) => _ratingCount = ratingCount;
  int? get commissionStatus => _commissionStatus;
  set commissionStatus(int? commissionStatus) =>
      _commissionStatus = commissionStatus;
  int? get commissionPercentage => _commissionPercentage;
  set commissionPercentage(int? commissionPercentage) =>
      _commissionPercentage = commissionPercentage;
  int? get isActive => _isActive;
  set isActive(int? isActive) => _isActive = isActive;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  int? get isApproved => _isApproved;
  set isApproved(int? isApproved) => _isApproved = isApproved;
  String? get zoneId => _zoneId;
  set zoneId(String? zoneId) => _zoneId = zoneId;

  ProviderModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _userId = json['user_id'];
    _companyName = json['company_name'];
    _companyPhone = json['company_phone'];
    _companyAddress = json['company_address'];
    _companyEmail = json['company_email'];
    _logo = json['logo'];
    _contactPersonName = json['contact_person_name'];
    _contactPersonPhone = json['contact_person_phone'];
    _contactPersonEmail = json['contact_person_email'];
    _orderCount = json['order_count'];
    _serviceManCount = json['service_man_count'];
    _serviceCapacityPerDay = json['service_capacity_per_day'];
    _ratingCount = json['rating_count'];
    _commissionStatus = json['commission_status'];
    _commissionPercentage = json['commission_percentage'];
    _isActive = json['is_active'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _isApproved = json['is_approved'];
    _zoneId = json['zone_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['user_id'] = this._userId;
    data['company_name'] = this._companyName;
    data['company_phone'] = this._companyPhone;
    data['company_address'] = this._companyAddress;
    data['company_email'] = this._companyEmail;
    data['logo'] = this._logo;
    data['contact_person_name'] = this._contactPersonName;
    data['contact_person_phone'] = this._contactPersonPhone;
    data['contact_person_email'] = this._contactPersonEmail;
    data['order_count'] = this._orderCount;
    data['service_man_count'] = this._serviceManCount;
    data['service_capacity_per_day'] = this._serviceCapacityPerDay;
    data['rating_count'] = this._ratingCount;
    data['commission_status'] = this._commissionStatus;
    data['commission_percentage'] = this._commissionPercentage;
    data['is_active'] = this._isActive;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['is_approved'] = this._isApproved;
    data['zone_id'] = this._zoneId;
    return data;
  }
}