class DashboardModel {
  String? responseCode;
  String? message;
  List<Content>? content;


  DashboardModel({this.responseCode, this.message, this.content});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    message = json['message'];
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(new Content.fromJson(v));
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

    return data;
  }
}

class Content {
  TopCards? topCards;
  List<StatsMonthly>? bookingStats;
  List<Booking>? bookings;

  Content({this.topCards, this.bookingStats, this.bookings});

  Content.fromJson(Map<String, dynamic> json) {
    topCards = json['top_cards'] != null
        ? new TopCards.fromJson(json['top_cards'])
        : null;
    if (json['booking_stats'] != null) {
      bookingStats = <StatsMonthly>[];
      json['booking_stats'].forEach((v) {
        bookingStats!.add(new StatsMonthly.fromJson(v));
      });
    }
    if (json['bookings'] != null) {
      bookings = <Booking>[];
      json['bookings'].forEach((v) {
        bookings!.add(new Booking.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.topCards != null) {
      data['top_cards'] = this.topCards!.toJson();
    }
    if (this.bookingStats != null) {
      data['booking_stats'] =
          this.bookingStats!.map((v) => v.toJson()).toList();
    }
    if (this.bookings != null) {
      data['bookings'] = this.bookings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TopCards {
  int? pendingBookings;
  int? ongoingBookings;
  int? completedBookings;
  int? canceledBookings;

  TopCards(
      {this.pendingBookings,
        this.ongoingBookings,
        this.completedBookings,
        this.canceledBookings});

  TopCards.fromJson(Map<String, dynamic> json) {
    pendingBookings = int.parse(json['total_bookings'].toString());
    ongoingBookings = int.parse(json['ongoing_bookings'].toString());
    completedBookings = int.parse(json['completed_bookings'].toString());
    canceledBookings = int.parse(json['canceled_bookings'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pending_bookings'] = this.pendingBookings;
    data['ongoing_bookings'] = this.ongoingBookings;
    data['completed_bookings'] = this.completedBookings;
    data['canceled_bookings'] = this.canceledBookings;
    return data;
  }
}

///Mothly Stats
class StatsMonthly{
  int? total;
  int? year;
  String? month;
  int? day;

  StatsMonthly({this.total, this.year, this.month, this.day});

  StatsMonthly.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    year = json['year'];
    month = json['month'];
    day = json['day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['year'] = this.year;
    data['month'] = this.month;
    data['day'] = this.day;
    return data;
  }
}

class Booking {
  String? id;
  int? readableId;
  String? customerId;
  String? providerId;
  String? zoneId;
  String? bookingStatus;
  int? isPaid;
  String? paymentMethod;
  String? transactionId;
  num? totalBookingAmount;
  num? totalTaxAmount;
  num? totalDiscountAmount;
  String? serviceSchedule;
  String? serviceAddressId;
  String? createdAt;
  String? updatedAt;
  String? categoryId;
  String? subCategoryId;
  String? servicemanId;
  List<RecentOrderDetail>? detail;

  Booking(
      {this.id,
        this.readableId,
        this.customerId,
        this.providerId,
        this.zoneId,
        this.bookingStatus,
        this.isPaid,
        this.paymentMethod,
        this.transactionId,
        this.totalBookingAmount,
        this.totalTaxAmount,
        this.totalDiscountAmount,
        this.serviceSchedule,
        this.serviceAddressId,
        this.createdAt,
        this.updatedAt,
        this.categoryId,
        this.subCategoryId,
        this.servicemanId,
        this.detail,
      });

  Booking.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    readableId = json['readable_id'];
    customerId = json['customer_id'];
    providerId = json['provider_id'];
    zoneId = json['zone_id'];
    bookingStatus = json['booking_status'];
    isPaid = json['is_paid'];
    paymentMethod = json['payment_method'];
    transactionId = json['transaction_id'];
    totalBookingAmount = json['total_booking_amount'];
    totalTaxAmount = json['total_tax_amount'];
    totalDiscountAmount = json['total_discount_amount'];
    serviceSchedule = json['service_schedule'];
    serviceAddressId = json['service_address_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    servicemanId = json['serviceman_id'];
    if (json['detail'] != null) {
      detail = <RecentOrderDetail>[];
      json['detail'].forEach((v) {
        detail!.add(RecentOrderDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['readable_id'] = this.readableId;
    data['customer_id'] = this.customerId;
    data['provider_id'] = this.providerId;
    data['zone_id'] = this.zoneId;
    data['booking_status'] = this.bookingStatus;
    data['is_paid'] = this.isPaid;
    data['payment_method'] = this.paymentMethod;
    data['transaction_id'] = this.transactionId;
    data['total_booking_amount'] = this.totalBookingAmount;
    data['total_tax_amount'] = this.totalTaxAmount;
    data['total_discount_amount'] = this.totalDiscountAmount;
    data['service_schedule'] = this.serviceSchedule;
    data['service_address_id'] = this.serviceAddressId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['category_id'] = this.categoryId;
    data['sub_category_id'] = this.subCategoryId;
    data['serviceman_id'] = this.servicemanId;
    return data;
  }
}



class MonthlyStats {
  int? total;
  int? year;
  int? month;
  int? day;

  MonthlyStats({this.total, this.year, this.month, this.day});

  MonthlyStats.fromJson(Map<String, dynamic> json) {
    total = int.parse(json['total'].toString());
    year =int.parse( json['year'].toString());
    month = int.parse(json['month'].toString());
    day = int.parse(json['day'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['year'] = this.year;
    data['month'] = this.month;
    data['day'] = this.day;
    return data;
  }
}


class YearlyStats {
  int? total;
  int? year;
  int? month;

  YearlyStats({this.total, this.year, this.month});

  YearlyStats.fromJson(Map<String, dynamic> json) {
    total = int.parse(json['total'].toString());
    year = int.parse(json['year'].toString());
    month = int.parse(json['month'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['year'] = this.year;
    data['month'] = this.month;
    return data;
  }
}


class RecentOrderDetail {
  int? _id;
  String? _bookingId;
  String? _serviceId;
  String? _variantKey;
  num? _serviceCost;
  int? _quantity;
  num? _discountAmount;
  num? _taxAmount;
  num? _totalCost;
  String? _createdAt;
  String? _updatedAt;
  num? _campaignDiscountAmount;
  num? _overallCouponDiscountAmount;
  Service? _service;

  RecentOrderDetail(
      {int? id,
        String? bookingId,
        String? serviceId,
        String? variantKey,
        num? serviceCost,
        int? quantity,
        num? discountAmount,
        num? taxAmount,
        num? totalCost,
        String? createdAt,
        String? updatedAt,
        num? campaignDiscountAmount,
        num? overallCouponDiscountAmount,
        Service? service}) {
    if (id != null) {
      this._id = id;
    }
    if (bookingId != null) {
      this._bookingId = bookingId;
    }
    if (serviceId != null) {
      this._serviceId = serviceId;
    }
    if (variantKey != null) {
      this._variantKey = variantKey;
    }
    if (serviceCost != null) {
      this._serviceCost = serviceCost;
    }
    if (quantity != null) {
      this._quantity = quantity;
    }
    if (discountAmount != null) {
      this._discountAmount = discountAmount;
    }
    if (taxAmount != null) {
      this._taxAmount = taxAmount;
    }
    if (totalCost != null) {
      this._totalCost = totalCost;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (campaignDiscountAmount != null) {
      this._campaignDiscountAmount = campaignDiscountAmount;
    }
    if (overallCouponDiscountAmount != null) {
      this._overallCouponDiscountAmount = overallCouponDiscountAmount;
    }
    if (service != null) {
      this._service = service;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get bookingId => _bookingId;
  set bookingId(String? bookingId) => _bookingId = bookingId;
  String? get serviceId => _serviceId;
  set serviceId(String? serviceId) => _serviceId = serviceId;
  String? get variantKey => _variantKey;
  set variantKey(String? variantKey) => _variantKey = variantKey;
  num? get serviceCost => _serviceCost;
  set serviceCost(num? serviceCost) => _serviceCost = serviceCost;
  int? get quantity => _quantity;
  set quantity(int? quantity) => _quantity = quantity;
  num? get discountAmount => _discountAmount;
  set discountAmount(num? discountAmount) =>
      _discountAmount = discountAmount;
  num? get taxAmount => _taxAmount;
  set taxAmount(num? taxAmount) => _taxAmount = taxAmount;
  num? get totalCost => _totalCost;
  set totalCost(num? totalCost) => _totalCost = totalCost;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  num? get campaignDiscountAmount => _campaignDiscountAmount;
  set campaignDiscountAmount(num? campaignDiscountAmount) =>
      _campaignDiscountAmount = campaignDiscountAmount;
  num? get overallCouponDiscountAmount => _overallCouponDiscountAmount;
  set overallCouponDiscountAmount(num? overallCouponDiscountAmount) =>
      _overallCouponDiscountAmount = overallCouponDiscountAmount;
  Service? get service => _service;
  set service(Service? service) => _service = service;

  RecentOrderDetail.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _bookingId = json['booking_id'];
    _serviceId = json['service_id'];
    _variantKey = json['variant_key'];
    _serviceCost = json['service_cost'];
    _quantity = json['quantity'];
    _discountAmount = json['discount_amount'];
    _taxAmount = json['tax_amount'];
    _totalCost = json['total_cost'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _campaignDiscountAmount = json['campaign_discount_amount'];
    _overallCouponDiscountAmount = json['overall_coupon_discount_amount'];
    _service =
    json['service'] != null ? new Service.fromJson(json['service']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['booking_id'] = this._bookingId;
    data['service_id'] = this._serviceId;
    data['variant_key'] = this._variantKey;
    data['service_cost'] = this._serviceCost;
    data['quantity'] = this._quantity;
    data['discount_amount'] = this._discountAmount;
    data['tax_amount'] = this._taxAmount;
    data['total_cost'] = this._totalCost;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['campaign_discount_amount'] = this._campaignDiscountAmount;
    data['overall_coupon_discount_amount'] = this._overallCouponDiscountAmount;
    if (this._service != null) {
      data['service'] = this._service!.toJson();
    }
    return data;
  }
}

class Service {
  String? _id;
  String? _name;
  String? _thumbnail;

  Service({String? id, String? name, String? thumbnail}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (thumbnail != null) {
      this._thumbnail = thumbnail;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get thumbnail => _thumbnail;
  set thumbnail(String? thumbnail) => _thumbnail = thumbnail;

  Service.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['thumbnail'] = this._thumbnail;
    return data;
  }
}
