import 'package:get/get.dart';
import 'package:demandium_serviceman/core/core_export.dart';
import '../controller/booking_details_controller.dart';
import '../repository/booking_details_repo.dart';


class BookingDetailsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => BookingDetailsController(bookingDetailsRepo: BookingDetailsRepo(apiClient: Get.find())));
    Get.lazyPut(() => ConversationController(conversationRepo: ConversationRepo(apiClient: Get.find())));
  }
}