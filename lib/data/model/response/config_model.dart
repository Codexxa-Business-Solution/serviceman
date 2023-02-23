class ConfigModel {
  String? _responseCode;
  String? _message;
  Content? _content;
  List<Null>? _errors;

  ConfigModel({String? responseCode, String? message, Content? content, List<Null>? errors}) {
    if (responseCode != null) {
      this._responseCode = responseCode;
    }
    if (message != null) {
      this._message = message;
    }
    if (content != null) {
      this._content = content;
    }
    if (errors != null) {
      this._errors = errors;
    }
  }

  String? get responseCode => _responseCode;
  set responseCode(String? responseCode) => _responseCode = responseCode;
  String? get message => _message;
  set message(String? message) => _message = message;
  Content? get content => _content;
  set content(Content? content) => _content = content;
  List<Null>? get errors => _errors;
  set errors(List<Null>? errors) => _errors = errors;

  ConfigModel.fromJson(Map<String, dynamic> json) {
    _responseCode = json['response_code'];
    _message = json['message'];
    _content = json['content'] != null ? new Content.fromJson(json['content']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response_code'] = this._responseCode;
    data['message'] = this._message;
    if (this._content != null) {
      data['content'] = this._content!.toJson();
    }
    return data;
  }
}

class Content {
  String? _currencySymbolPosition;
  int? _providerSelfRegistration;
  String? _businessName;
  String? _logo;
  String? _countryCode;
  String? _businessAddress;
  String? _businessPhone;
  String? _businessEmail;
  String? _baseUrl;
  String? _currencyCode;
  String? _aboutUs;
  String? _privacyPolicy;
  String? _termsAndConditions;
  String? _refundPolicy;
  String? _returnPolicy;
  String? _cancellationPolicy;
  DefaultLocation? _defaultLocation;
  String? _appUrlAndroid;
  String? _appUrlIos;
  int? _smsVerification;
  int? _phoneVerification;
  MapApiKey? _mapApiKey;
  String? _imageBaseUrl;
  int? _paginationLimit;
  List<Languages>? _languages;
  List<Currencies>? _currencies;
  List<Countries>? _countries;
  String? _currencyDecimalPoint;
  var _serviceManCanCancelBooking;
  MinimumVersion? _minimumVersion;
  String? _footerText;


  Content({String? currencySymbolPosition,
    int? providerSelfRegistration,
    String? businessName,
    String? logo,
    String? countryCode,
    String? businessAddress,
    String? businessPhone,
    String? businessEmail,
    String? baseUrl,
    String? currencyCode,
    String? aboutUs,
    String? privacyPolicy,
    String? termsAndConditions,
    String? refundPolicy,
    String? returnPolicy,
    String? cancellationPolicy,
    DefaultLocation? defaultLocation,
    String? appUrlAndroid,
    String? appUrlIos,
    int? smsVerification,
    int? phoneVerification,
    MapApiKey? mapApiKey,
    String? imageBaseUrl,
    int? paginationLimit,
    List<Languages>? languages,
    List<Currencies>? currencies,
    List<Countries>? countries,
    String? currencyDecimalPoint,
    int? serviceManCanCancelBooking,
    MinimumVersion? minimumVersion,
    String? footerText,

  }) {
    if (currencySymbolPosition != null) {
      this._currencySymbolPosition = currencySymbolPosition;
    }
    if (providerSelfRegistration != null) {
      this._providerSelfRegistration = providerSelfRegistration;
    }
    if (businessName != null) {
      this._businessName = businessName;
    }
    if (logo != null) {
      this._logo = logo;
    }
    if (countryCode == null) {
      this._countryCode = countryCode;
    }
    if (businessAddress != null) {
      this._businessAddress = businessAddress;
    }
    if (businessPhone != null) {
      this._businessPhone = businessPhone;
    }
    if (businessEmail != null) {
      this._businessEmail = businessEmail;
    }
    if (baseUrl != null) {
      this._baseUrl = baseUrl;
    }
    if (currencyCode != null) {
      this._currencyCode = currencyCode;
    }
    if (aboutUs != null) {
      this._aboutUs = aboutUs;
    }
    if (privacyPolicy != null) {
      this._privacyPolicy = privacyPolicy;
    }
    if (termsAndConditions != null) {
      this._termsAndConditions = termsAndConditions;
    }
    if (refundPolicy != null) {
      this._refundPolicy = refundPolicy;
    }
    if (returnPolicy != null) {
      this._returnPolicy = returnPolicy;
    }
    if (cancellationPolicy != null) {
      this._cancellationPolicy = cancellationPolicy;
    }
    if (defaultLocation != null) {
      this._defaultLocation = defaultLocation;
    }
    if (appUrlAndroid != null) {
      this._appUrlAndroid = appUrlAndroid;
    }
    if (appUrlIos != null) {
      this._appUrlIos = appUrlIos;
    }
    if (smsVerification != null) {
      this._smsVerification = smsVerification;
    }
    if (phoneVerification != null) {
      this._phoneVerification = phoneVerification;
    }
    if (mapApiKey != null) {
      this._mapApiKey = mapApiKey;
    }
    if (imageBaseUrl != null) {
      this._imageBaseUrl = imageBaseUrl;
    }
    if (paginationLimit != null) {
      this._paginationLimit = paginationLimit;
    }
    if (languages != null) {
      this._languages = languages;
    }
    if (currencies != null) {
      this._currencies = currencies;
    }
    if (countries != null) {
      this._countries = countries;
    }
    if (currencyDecimalPoint != null) {
      this._currencyDecimalPoint = currencyDecimalPoint;
    }
    if (serviceManCanCancelBooking !=null){
      this._serviceManCanCancelBooking = serviceManCanCancelBooking;
    }
    if (minimumVersion !=null){
      this._minimumVersion = minimumVersion;
    }
    if (footerText != null) {
      this._footerText = footerText;
    }
  }

  String? get currencySymbolPosition => _currencySymbolPosition;
  int? get providerSelfRegistration => _providerSelfRegistration;
  String? get businessName => _businessName;
  String? get logo => _logo;
  String? get countryCode => _countryCode;
  String? get businessAddress => _businessAddress;
  String? get businessPhone => _businessPhone;
  String? get businessEmail => _businessEmail;
  String? get baseUrl => _baseUrl;
  String? get currencyCode => _currencyCode;
  String? get aboutUs => _aboutUs;
  String? get privacyPolicy => _privacyPolicy;
  String? get termsAndConditions => _termsAndConditions;
  String? get refundPolicy => _refundPolicy;
  String? get returnPolicy => _returnPolicy;
  String? get cancellationPolicy => _cancellationPolicy;
  DefaultLocation? get defaultLocation => _defaultLocation;
  String? get appUrlAndroid => _appUrlAndroid;
  String? get appUrlIos => _appUrlIos;
  int? get smsVerification => _smsVerification;
  int? get phoneVerification => _phoneVerification;
  MapApiKey? get mapApiKey => _mapApiKey;
  String? get imageBaseUrl => _imageBaseUrl;
  int? get paginationLimit => _paginationLimit;
  List<Languages>? get languages => _languages;
  List<Currencies>? get currencies => _currencies;
  List<Countries>? get countries => _countries;
  String? get currencyDecimalPoint => _currencyDecimalPoint;
  MinimumVersion? get minimumVersion => _minimumVersion;
  get serviceManCanCancelBooking => _serviceManCanCancelBooking;
  String? get footerText => _footerText;


  Content.fromJson(Map<String, dynamic> json) {
    _currencySymbolPosition = json['currency_symbol_position'];
    _providerSelfRegistration = json['provider_self_registration'];
    _businessName = json['business_name'];
    _logo = json['logo'];
    _countryCode = json['country_code'];
    _businessAddress = json['business_address'];
    _businessPhone = json['business_phone'];
    _businessEmail = json['business_email'];
    _baseUrl = json['base_url'];
    _currencyCode = json['currency_code'];
    _aboutUs = json['about_us'];
    _privacyPolicy = json['privacy_policy'];
    _termsAndConditions = json['terms_and_conditions'];
    _refundPolicy = json['refund_policy'];
    _returnPolicy = json['return_policy'];
    _cancellationPolicy = json['cancellation_policy'];
    _defaultLocation = json['default_location'] != null ? new DefaultLocation.fromJson(json['default_location']) : null;
    _appUrlAndroid = json['app_url_android'];
    _appUrlIos = json['app_url_ios'];
    _smsVerification = json['sms_verification'];
    _phoneVerification = json['phone_verification'];
    _mapApiKey = json['map_api_key'] != null ? new MapApiKey.fromJson(json['map_api_key']) : null;
    _imageBaseUrl = json['image_base_url'];
    _paginationLimit = json['pagination_limit'];
    if (json['languages'] != null) {
      _languages = <Languages>[];
      json['languages'].forEach((v) { _languages!.add(new Languages.fromJson(v)); });
    }
    if (json['currencies'] != null) {
      _currencies = <Currencies>[];
      json['currencies'].forEach((v) { _currencies!.add(new Currencies.fromJson(v)); });
    }
    if (json['countries'] != null) {
      _countries = <Countries>[];
      json['countries'].forEach((v) { _countries!.add(new Countries.fromJson(v)); });
    }
    _currencyDecimalPoint = json['currency_decimal_point'];
    _serviceManCanCancelBooking = json['service_man_can_cancel_booking'];
    _minimumVersion = json['min_versions'] != null ? new MinimumVersion.fromJson(json['min_versions']) : null;
    _footerText = json['footer_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency_symbol_position'] = this._currencySymbolPosition;
    data['provider_self_registration'] = this._providerSelfRegistration;
    data['business_name'] = this._businessName;
    data['logo'] = this._logo;
    data['country_code'] = this._countryCode;
    data['business_address'] = this._businessAddress;
    data['business_phone'] = this._businessPhone;
    data['business_email'] = this._businessEmail;
    data['base_url'] = this._baseUrl;
    data['currency_code'] = this._currencyCode;
    data['about_us'] = this._aboutUs;
    data['privacy_policy'] = this._privacyPolicy;
    data['terms_and_conditions'] = this._termsAndConditions;
    data['refund_policy'] = this._refundPolicy;
    data['return_policy'] = this._returnPolicy;
    data['cancellation_policy'] = this._cancellationPolicy;
    if (this._defaultLocation != null) {
      data['default_location'] = this._defaultLocation!.toJson();
    }
    data['app_url_android'] = this._appUrlAndroid;
    data['app_url_ios'] = this._appUrlIos;
    data['sms_verification'] = this._smsVerification;
    data['phone_verification'] = this._phoneVerification;
    if (this._mapApiKey != null) {
      data['map_api_key'] = this._mapApiKey!.toJson();
    }
    data['image_base_url'] = this._imageBaseUrl;
    data['pagination_limit'] = this._paginationLimit;
    if (this._languages != null) {
      data['languages'] = this._languages!.map((v) => v.toJson()).toList();
    }
    if (this._currencies != null) {
      data['currencies'] = this._currencies!.map((v) => v.toJson()).toList();
    }
    if (this._countries != null) {
      data['countries'] = this._countries!.map((v) => v.toJson()).toList();
    }
    data['currency_decimal_point'] = this._currencyDecimalPoint;
    if (this._minimumVersion != null) {
      data['min_versions'] = this._minimumVersion!.toJson();
    }
    data['footer_text'] = this._footerText;
    return data;
  }
}

class DefaultLocation {
  Default? _default;




  DefaultLocation.fromJson(Map<String, dynamic> json) {
    _default = json['default'] != null ? new Default.fromJson(json['default']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._default != null) {
      data['default'] = this._default!.toJson();
    }
    return data;
  }
}

class Default {
  String ? _lat;
  String ? _lon;

  Default({String? lat, String? lon}) {
    if (lat != null) {
      this._lat = lat;
    }
    if (lon != null) {
      this._lon = lon;
    }
  }

  String? get lat => _lat;
  set lat(String? lat) => _lat = lat;
  String? get lon => _lon;
  set lon(String? lon) => _lon = lon;

  Default.fromJson(Map<String, dynamic> json) {
    _lat = json['lat'];
    _lon = json['lon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this._lat;
    data['lon'] = this._lon;
    return data;
  }
}

class MapApiKey {
  String? _id;
  String? _keyName;
  LiveValues? _liveValues;
  LiveValues? _testValues;
  String? _settingsType;
  String? _mode;
  int? _isActive;
  String? _createdAt;
  String? _updatedAt;

  MapApiKey({String? id, String? keyName, LiveValues? liveValues, LiveValues? testValues, String? settingsType, String? mode, int? isActive, String? createdAt, String? updatedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (keyName != null) {
      this._keyName = keyName;
    }
    if (liveValues != null) {
      this._liveValues = liveValues;
    }
    if (testValues != null) {
      this._testValues = testValues;
    }
    if (settingsType != null) {
      this._settingsType = settingsType;
    }
    if (mode != null) {
      this._mode = mode;
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
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get keyName => _keyName;
  set keyName(String? keyName) => _keyName = keyName;
  LiveValues? get liveValues => _liveValues;
  set liveValues(LiveValues? liveValues) => _liveValues = liveValues;
  LiveValues? get testValues => _testValues;
  set testValues(LiveValues? testValues) => _testValues = testValues;
  String? get settingsType => _settingsType;
  set settingsType(String? settingsType) => _settingsType = settingsType;
  String? get mode => _mode;
  set mode(String? mode) => _mode = mode;
  int? get isActive => _isActive;
  set isActive(int? isActive) => _isActive = isActive;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  MapApiKey.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _keyName = json['key_name'];
    _liveValues = json['live_values'] != null ? new LiveValues.fromJson(json['live_values']) : null;
    _testValues = json['test_values'] != null ? new LiveValues.fromJson(json['test_values']) : null;
    _settingsType = json['settings_type'];
    _mode = json['mode'];
    _isActive = json['is_active'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['key_name'] = this._keyName;
    if (this._liveValues != null) {
      data['live_values'] = this._liveValues!.toJson();
    }
    if (this._testValues != null) {
      data['test_values'] = this._testValues!.toJson();
    }
    data['settings_type'] = this._settingsType;
    data['mode'] = this._mode;
    data['is_active'] = this._isActive;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}

class LiveValues {
  String? _partyName;
  String? _mapApiKeyClient;
  String? _mapApiKeyServer;

  LiveValues({String? partyName, String? mapApiKeyClient, String? mapApiKeyServer}) {
    if (partyName != null) {
      this._partyName = partyName;
    }
    if (mapApiKeyClient != null) {
      this._mapApiKeyClient = mapApiKeyClient;
    }
    if (mapApiKeyServer != null) {
      this._mapApiKeyServer = mapApiKeyServer;
    }
  }

  String? get partyName => _partyName;
  set partyName(String? partyName) => _partyName = partyName;
  String? get mapApiKeyClient => _mapApiKeyClient;
  set mapApiKeyClient(String? mapApiKeyClient) => _mapApiKeyClient = mapApiKeyClient;
  String? get mapApiKeyServer => _mapApiKeyServer;
  set mapApiKeyServer(String? mapApiKeyServer) => _mapApiKeyServer = mapApiKeyServer;

  LiveValues.fromJson(Map<String, dynamic> json) {
    _partyName = json['party_name'];
    _mapApiKeyClient = json['map_api_key_client'];
    _mapApiKeyServer = json['map_api_key_server'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['party_name'] = this._partyName;
    data['map_api_key_client'] = this._mapApiKeyClient;
    data['map_api_key_server'] = this._mapApiKeyServer;
    return data;
  }
}

class Languages {
  String? _code;
  String? _name;
  String? _nativeName;

  Languages({String? code, String? name, String? nativeName}) {
    if (code != null) {
      this._code = code;
    }
    if (name != null) {
      this._name = name;
    }
    if (nativeName != null) {
      this._nativeName = nativeName;
    }
  }

  String? get code => _code;
  set code(String? code) => _code = code;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get nativeName => _nativeName;
  set nativeName(String? nativeName) => _nativeName = nativeName;

  Languages.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _name = json['name'];
    _nativeName = json['nativeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this._code;
    data['name'] = this._name;
    data['nativeName'] = this._nativeName;
    return data;
  }
}

class Currencies {
  String? _code;
  String? _symbol;
  String? _name;

  Currencies({String? code, String? symbol, String? name}) {
    if (code != null) {
      this._code = code;
    }
    if (symbol != null) {
      this._symbol = symbol;
    }
    if (name != null) {
      this._name = name;
    }
  }

  String? get code => _code;
  set code(String? code) => _code = code;
  String? get symbol => _symbol;
  set symbol(String? symbol) => _symbol = symbol;
  String? get name => _name;
  set name(String? name) => _name = name;

  Currencies.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _symbol = json['symbol'].replaceAll("\\", '');
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this._code;
    data['symbol'] = this._symbol;
    data['name'] = this._name;
    return data;
  }
}

class Countries {
  String? _name;
  String? _code;

  Countries({String? name, String? code}) {
    if (name != null) {
      this._name = name;
    }
    if (code != null) {
      this._code = code;
    }
  }

  String? get name => _name;
  set name(String? name) => _name = name;
  String? get code => _code;
  set code(String? code) => _code = code;

  Countries.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['code'] = this._code;
    return data;
  }
}


class MinimumVersion {
  String? _minVersionForAndroid;
  String? _minVersionForIos;

  MinimumVersion({String? minVersionForAndroid, String? minVersionForIos}) {
    if (minVersionForAndroid != null) {
      this._minVersionForAndroid = minVersionForAndroid;
    }
    if (minVersionForIos != null) {
      this._minVersionForIos = minVersionForIos;
    }
  }

  String? get minVersionForAndroid => _minVersionForAndroid;
  set minVersionForAndroid(String? minVersionForAndroid) =>
      _minVersionForAndroid = minVersionForAndroid;
  String? get minVersionForIos => _minVersionForIos;
  set minVersionForIos(String? minVersionForIos) =>
      _minVersionForIos = minVersionForIos;

  MinimumVersion.fromJson(Map<String, dynamic> json) {
    _minVersionForAndroid = json['min_version_for_android'];
    _minVersionForIos = json['min_version_for_ios'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['min_version_for_android'] = this._minVersionForAndroid;
    data['min_version_for_ios'] = this._minVersionForIos;
    return data;
  }
}
