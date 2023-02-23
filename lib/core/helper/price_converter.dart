import 'package:get/get.dart';
import 'package:demandium_serviceman/feature/splash/controller/splash_controller.dart';

class PriceConverter {

  static String currencySymbol ='';
  static String currencySymbolValue ='';

  static String getCurrency() {
    Get.find<SplashController>().configModel.content?.currencies?.forEach((cc) {
      if(cc.code == Get.find<SplashController>().configModel.content?.currencyCode){
        currencySymbol = cc.symbol!;
      }
    });
    return currencySymbol;

  }

  static String convertPrice(double? price, {double? discount, String? discountType, bool isShowLongPrice = false}) {
    if(discount != null && discountType != null){
      if(discountType == 'amount') {
        price = price! - discount;
      }else if(discountType == 'percent') {
        price = price! - ((discount / 100) * price);
      }
    }
    bool _isRightSide = Get.find<SplashController>().configModel.content?.currencySymbolPosition == 'right';
    return isShowLongPrice == true ?'${_isRightSide ? '' : currencySymbol}'
        '${(price!).toStringAsFixed(int.parse(Get.find<SplashController>().configModel.content!.currencyDecimalPoint!))
        .replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} '
        '${_isRightSide ? currencySymbol : ''}' :  longToShortPrice('${_isRightSide ? '' : currencySymbol}'
        '${(price!).toStringAsFixed(int.parse(Get.find<SplashController>().configModel.content!.currencyDecimalPoint!))
        .replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} '
        '${_isRightSide ? currencySymbol : ''}');

  }

  static double convertWithDiscount(double price, double discount, String discountType) {
    if(discountType == 'amount') {
      price = price - discount;
    }else if(discountType == 'percent') {
      price = price - ((discount / 100) * price);
    }
    return price;
  }

  static double calculation(double amount, double discount, String type, int quantity) {
    double calculatedAmount = 0;
    if(type == 'amount') {
      calculatedAmount = discount * quantity;
    }else if(type == 'percent') {
      calculatedAmount = (discount / 100) * (amount * quantity);
    }
    return calculatedAmount;
  }

  static String percentageCalculation(String price, String discount, String discountType) {
    return '$discount${discountType == 'percent' ? '%' : currencySymbol} OFF';
  }

  static String longToShortPrice(String price){
    return price.length > 15 ?
    "${price.substring(0, 12)}.......${price.substring(price.length - 1,price.length)}":
    price;
  }
}