import 'package:get/get_connect/http/src/response/response.dart';
import '../../../data/provider/client_api.dart';
import '../../../utils/app_constants.dart';

class BookingDetailsRepo{
  final ApiClient apiClient;

  BookingDetailsRepo({required this.apiClient});

  Future<Response> getBookingDetailsData(String bookingID) async {
    return await apiClient.getData(AppConstants.BOOKING_DETAILS_URI+"/"+bookingID);
  }

  Future<Response> changeBookingStatus(String bookingID,String status) async {
    return await apiClient.postData(AppConstants.STATUS_UPDATE_URI+"/"+bookingID,{'booking_status':'${status}','_method':'put'});
  }

  Future<Response> changePaymentStatus(String bookingID,String paymentStatus) async {
    return await apiClient.postData(AppConstants.PAYMENT_STATUS_UPDATE+"/"+bookingID,{'payment_status':'${paymentStatus}','_method':'put'});
  }
}

