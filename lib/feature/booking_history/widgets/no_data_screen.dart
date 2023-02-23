import 'package:get/get.dart';
import 'package:demandium_serviceman/core/core_export.dart';

enum NoDataType {
  CART,
  NOTIFICATION,
  ORDER,
  COUPON,
  OTHERS,
}

class NoDataScreen extends StatelessWidget {
  final NoDataType? type;
  final String? text;
  NoDataScreen({required this.text, this.type});

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              Image.asset(
                (type == NoDataType.CART || type == NoDataType.ORDER)
                    ? Images.noInternet
                    : type == NoDataType.COUPON
                    ? Images.noInternet
                    : type == NoDataType.NOTIFICATION
                    ? Images.noInternet
                    : Images.noData,
                width: MediaQuery.of(context).size.height * 0.12,
                height: MediaQuery.of(context).size.height * 0.12,
                color: Get.isDarkMode?light.cardColor:null,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.06),
              Text(
                type == NoDataType.CART
                    ? 'cart_is_empty'.tr
                    : type == NoDataType.ORDER
                    ? 'sorry_your_order_history_is_Empty'.tr
                    : type == NoDataType.COUPON
                    ? 'your_voucher_is_not_available_right_now'.tr
                    : type == NoDataType.NOTIFICATION
                    ? 'empty_notifications'.tr
                    : text!,
                style: ubuntuMedium.copyWith(
                    fontSize: Dimensions.fontSizeDefault,
                    color: Theme.of(context).primaryColor),
                textAlign: TextAlign.center,
              ),
            ]),
    );
  }
}