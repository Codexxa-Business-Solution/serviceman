class BookingItemModel {
  String? _id;
  int? _readableId;
  String? _customerId;
  String? _providerId;
  String? _zoneId;
  String? _bookingStatus;
  int? _isPaid;
  String? _paymentMethod;
  String? _transactionId;
  num? _totalBookingAmount;
  num? _totalTaxAmount;
  num? _totalDiscountAmount;
  String? _serviceSchedule;
  String? _serviceAddressId;
  String? _createdAt;
  String? _updatedAt;
  String? _categoryId;
  String? _subCategoryId;
  String? _servicemanId;
  Customer? _customer;

  BookingItemModel(
      {String? id,
        int? readableId,
        String? customerId,
        String? providerId,
        String? zoneId,
        String? bookingStatus,
        int? isPaid,
        String? paymentMethod,
        String? transactionId,
        num? totalBookingAmount,
        num? totalTaxAmount,
        num? totalDiscountAmount,
        String? serviceSchedule,
        String? serviceAddressId,
        String? createdAt,
        String? updatedAt,
        String? categoryId,
        String? subCategoryId,
        String? servicemanId,
        Customer? customer}) {
    if (id != null) {
      this._id = id;
    }
    if (readableId != null) {
      this._readableId = readableId;
    }
    if (customerId != null) {
      this._customerId = customerId;
    }
    if (providerId != null) {
      this._providerId = providerId;
    }
    if (zoneId != null) {
      this._zoneId = zoneId;
    }
    if (bookingStatus != null) {
      this._bookingStatus = bookingStatus;
    }
    if (isPaid != null) {
      this._isPaid = isPaid;
    }
    if (paymentMethod != null) {
      this._paymentMethod = paymentMethod;
    }
    if (transactionId != null) {
      this._transactionId = transactionId;
    }
    if (totalBookingAmount != null) {
      this._totalBookingAmount = totalBookingAmount;
    }
    if (totalTaxAmount != null) {
      this._totalTaxAmount = totalTaxAmount;
    }
    if (totalDiscountAmount != null) {
      this._totalDiscountAmount = totalDiscountAmount;
    }
    if (serviceSchedule != null) {
      this._serviceSchedule = serviceSchedule;
    }
    if (serviceAddressId != null) {
      this._serviceAddressId = serviceAddressId;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (categoryId != null) {
      this._categoryId = categoryId;
    }
    if (subCategoryId != null) {
      this._subCategoryId = subCategoryId;
    }
    if (servicemanId != null) {
      this._servicemanId = servicemanId;
    }
    if (customer != null) {
      this._customer = customer;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  int? get readableId => _readableId;
  set readableId(int? readableId) => _readableId = readableId;
  String? get customerId => _customerId;
  set customerId(String? customerId) => _customerId = customerId;
  String? get providerId => _providerId;
  set providerId(String? providerId) => _providerId = providerId;
  String? get zoneId => _zoneId;
  set zoneId(String? zoneId) => _zoneId = zoneId;
  String? get bookingStatus => _bookingStatus;
  set bookingStatus(String? bookingStatus) => _bookingStatus = bookingStatus;
  int? get isPaid => _isPaid;
  set isPaid(int? isPaid) => _isPaid = isPaid;
  String? get paymentMethod => _paymentMethod;
  set paymentMethod(String? paymentMethod) => _paymentMethod = paymentMethod;
  String? get transactionId => _transactionId;
  set transactionId(String? transactionId) => _transactionId = transactionId;
  num? get totalBookingAmount => _totalBookingAmount;
  num? get totalTaxAmount => _totalTaxAmount;
  set totalTaxAmount(num? totalTaxAmount) =>
      _totalTaxAmount = totalTaxAmount;
  num? get totalDiscountAmount => _totalDiscountAmount;
  set totalDiscountAmount(num? totalDiscountAmount) =>
      _totalDiscountAmount = totalDiscountAmount;
  String? get serviceSchedule => _serviceSchedule;
  set serviceSchedule(String? serviceSchedule) =>
      _serviceSchedule = serviceSchedule;
  String? get serviceAddressId => _serviceAddressId;
  set serviceAddressId(String? serviceAddressId) =>
      _serviceAddressId = serviceAddressId;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  String? get categoryId => _categoryId;
  set categoryId(String? categoryId) => _categoryId = categoryId;
  String? get subCategoryId => _subCategoryId;
  set subCategoryId(String? subCategoryId) => _subCategoryId = subCategoryId;
  String? get servicemanId => _servicemanId;
  set servicemanId(String? servicemanId) => _servicemanId = servicemanId;
  Customer? get customer => _customer;
  set customer(Customer? customer) => _customer = customer;

  BookingItemModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _readableId = json['readable_id'];
    _customerId = json['customer_id'];
    _providerId = json['provider_id'];
    _zoneId = json['zone_id'];
    _bookingStatus = json['booking_status'];
    _isPaid = json['is_paid'];
    _paymentMethod = json['payment_method'];
    _transactionId = json['transaction_id'];
    if(json['total_booking_amount'] != null){
      _totalBookingAmount = json['total_booking_amount'];
    }else{
      _totalBookingAmount = 0.0;
    }

    _totalTaxAmount = json['total_tax_amount'];
    _totalDiscountAmount = json['total_discount_amount'];
    _serviceSchedule = json['service_schedule'];
    _serviceAddressId = json['service_address_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _categoryId = json['category_id'];
    _subCategoryId = json['sub_category_id'];
    _servicemanId = json['serviceman_id'];
    _customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['readable_id'] = this._readableId;
    data['customer_id'] = this._customerId;
    data['provider_id'] = this._providerId;
    data['zone_id'] = this._zoneId;
    data['booking_status'] = this._bookingStatus;
    data['is_paid'] = this._isPaid;
    data['payment_method'] = this._paymentMethod;
    data['transaction_id'] = this._transactionId;
    data['total_booking_amount'] = this._totalBookingAmount;
    data['total_tax_amount'] = this._totalTaxAmount;
    data['total_discount_amount'] = this._totalDiscountAmount;
    data['service_schedule'] = this._serviceSchedule;
    data['service_address_id'] = this._serviceAddressId;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['category_id'] = this._categoryId;
    data['sub_category_id'] = this._subCategoryId;
    data['serviceman_id'] = this._servicemanId;
    if (this._customer != null) {
      data['customer'] = this._customer!.toJson();
    }
    return data;
  }
}

class Customer {
  String? _id;
  var _roleId;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _phone;
  var _identificationNumber;
  String? _identificationType;
  List<Null>? _identificationImage;
  var _dateOfBirth;
  String? _gender;
  String? _profileImage;
  String? _fcmToken;
  int? _isPhoneVerified;
  int? _isEmailVerified;
  var _phoneVerifiedAt;
  var _emailVerifiedAt;
  int? _isActive;
  String? _userType;
  var _rememberToken;
  var _deletedAt;
  String? _createdAt;
  String? _updatedAt;

  Customer(
      {String? id,
        var roleId,
        String? firstName,
        String? lastName,
        String? email,
        String? phone,
        var identificationNumber,
        String? identificationType,
        List<Null>? identificationImage,
        var dateOfBirth,
        String? gender,
        String? profileImage,
        String? fcmToken,
        int? isPhoneVerified,
        int? isEmailVerified,
        var phoneVerifiedAt,
        var emailVerifiedAt,
        int? isActive,
        String? userType,
        var rememberToken,
        var deletedAt,
        String? createdAt,
        String? updatedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (roleId != null) {
      this._roleId = roleId;
    }
    if (firstName != null) {
      this._firstName = firstName;
    }
    if (lastName != null) {
      this._lastName = lastName;
    }
    if (email != null) {
      this._email = email;
    }
    if (phone != null) {
      this._phone = phone;
    }

    if (identificationType != null) {
      this._identificationType = identificationType;
    }
    if (identificationImage != null) {
      this._identificationImage = identificationImage;
    }
    if (dateOfBirth != null) {
      this._dateOfBirth = dateOfBirth;
    }
    if (gender != null) {
      this._gender = gender;
    }
    if (profileImage != null) {
      this._profileImage = profileImage;
    }
    if (fcmToken != null) {
      this._fcmToken = fcmToken;
    }
    if (isPhoneVerified != null) {
      this._isPhoneVerified = isPhoneVerified;
    }
    if (isEmailVerified != null) {
      this._isEmailVerified = isEmailVerified;
    }
    if (phoneVerifiedAt != null) {
      this._phoneVerifiedAt = phoneVerifiedAt;
    }
    if (emailVerifiedAt != null) {
      this._emailVerifiedAt = emailVerifiedAt;
    }
    if (isActive != null) {
      this._isActive = isActive;
    }
    if (userType != null) {
      this._userType = userType;
    }
    if (rememberToken != null) {
      this._rememberToken = rememberToken;
    }
    if (deletedAt != null) {
      this._deletedAt = deletedAt;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
   get roleId => _roleId;
  set roleId(var roleId) => _roleId = roleId;
  String? get firstName => _firstName;
  set firstName(String? firstName) => _firstName = firstName;
  String? get lastName => _lastName;
  set lastName(String? lastName) => _lastName = lastName;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get phone => _phone;
  set phone(String? phone) => _phone = phone;
   get identificationNumber => _identificationNumber;
  set identificationNumber(var identificationNumber) =>
      _identificationNumber = identificationNumber;
  String? get identificationType => _identificationType;
  set identificationType(String? identificationType) =>
      _identificationType = identificationType;
  List<Null>? get identificationImage => _identificationImage;
  set identificationImage(List<Null>? identificationImage) =>
      _identificationImage = identificationImage;
   get dateOfBirth => _dateOfBirth;
  set dateOfBirth(var dateOfBirth) => _dateOfBirth = dateOfBirth;
  String? get gender => _gender;
  set gender(String? gender) => _gender = gender;
  String? get profileImage => _profileImage;
  set profileImage(String? profileImage) => _profileImage = profileImage;
  String? get fcmToken => _fcmToken;
  set fcmToken(String? fcmToken) => _fcmToken = fcmToken;
  int? get isPhoneVerified => _isPhoneVerified;
  set isPhoneVerified(int? isPhoneVerified) =>
      _isPhoneVerified = isPhoneVerified;
  int? get isEmailVerified => _isEmailVerified;
  set isEmailVerified(int? isEmailVerified) =>
      _isEmailVerified = isEmailVerified;
   get phoneVerifiedAt => _phoneVerifiedAt;
  set phoneVerifiedAt(var phoneVerifiedAt) =>
      _phoneVerifiedAt = phoneVerifiedAt;
   get emailVerifiedAt => _emailVerifiedAt;
  set emailVerifiedAt(var emailVerifiedAt) =>
      _emailVerifiedAt = emailVerifiedAt;
  int? get isActive => _isActive;
  set isActive(int? isActive) => _isActive = isActive;
  String? get userType => _userType;
  set userType(String? userType) => _userType = userType;
   get rememberToken => _rememberToken;
  set rememberToken(var rememberToken) => _rememberToken = rememberToken;
   get deletedAt => _deletedAt;
  set deletedAt(var deletedAt) => _deletedAt = deletedAt;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  Customer.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _roleId = json['role_id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _email = json['email'];
    _phone = json['phone'];
    _identificationNumber = json['identification_number'];
    _identificationType = json['identification_type'];

    _dateOfBirth = json['date_of_birth'];
    _gender = json['gender'];
    _profileImage = json['profile_image'];
    _fcmToken = json['fcm_token'];
    _isPhoneVerified = json['is_phone_verified'];
    _isEmailVerified = json['is_email_verified'];
    _phoneVerifiedAt = json['phone_verified_at'];
    _emailVerifiedAt = json['email_verified_at'];
    _isActive = json['is_active'];
    _userType = json['user_type'];
    _rememberToken = json['remember_token'];
    _deletedAt = json['deleted_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['role_id'] = this._roleId;
    data['first_name'] = this._firstName;
    data['last_name'] = this._lastName;
    data['email'] = this._email;
    data['phone'] = this._phone;
    data['identification_number'] = this._identificationNumber;
    data['identification_type'] = this._identificationType;

    data['date_of_birth'] = this._dateOfBirth;
    data['gender'] = this._gender;
    data['profile_image'] = this._profileImage;
    data['fcm_token'] = this._fcmToken;
    data['is_phone_verified'] = this._isPhoneVerified;
    data['is_email_verified'] = this._isEmailVerified;
    data['phone_verified_at'] = this._phoneVerifiedAt;
    data['email_verified_at'] = this._emailVerifiedAt;
    data['is_active'] = this._isActive;
    data['user_type'] = this._userType;
    data['remember_token'] = this._rememberToken;
    data['deleted_at'] = this._deletedAt;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}
