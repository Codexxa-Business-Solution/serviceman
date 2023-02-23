import 'package:get/get.dart';
import 'package:demandium_serviceman/core/core_export.dart';

enum NoDataType {
  CART,
  NOTIFICATION,
  ORDER,
  CONVERSATION,
  OTHERS,
}

class NoDataScreen extends StatelessWidget {
  final NoDataType? type;
  final String? text;
  NoDataScreen({required this.text, this.type});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(),
            Image.asset(
              (type == NoDataType.CART || type == NoDataType.ORDER)
                  ? Images.emptyNotification
                  : type == NoDataType.CONVERSATION
                  ? Images.chatImage
                  : type == NoDataType.NOTIFICATION
                  ? Images.emptyNotification
                  : Images.emptyNotification,
              width: MediaQuery.of(context).size.height * 0.10,
              height: MediaQuery.of(context).size.height * 0.10,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.06),
            Text(
              type == NoDataType.CART
                  ? 'cart_is_empty'.tr
                  : type == NoDataType.ORDER
                  ? 'sorry_your_order_history_is_Empty'.tr
                  : type == NoDataType.CONVERSATION
                  ? 'your_inbox_list_empty_right_now'.tr
                  : type == NoDataType.NOTIFICATION
                  ? 'empty_notifications'.tr
                  : text!,
              style: ubuntuMedium.copyWith(
                  fontSize: Dimensions.fontSizeDefault,
                  color: Theme.of(context).primaryColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            //Text("There are no Services".tr),
          ]),
    );
  }
}