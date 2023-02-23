import 'package:get/get.dart';
import 'package:demandium_serviceman/core/helper/price_converter.dart';
import 'package:demandium_serviceman/feature/booking_details/controller/booking_details_controller.dart';
import 'package:demandium_serviceman/core/core_export.dart';
import '../model/booking_details_model.dart';

class BookingSummeryWidget extends StatelessWidget{
  final BookingDetailsContent bookingDetailsContent;
  const BookingSummeryWidget({Key? key, required this.bookingDetailsContent}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return GetBuilder<BookingDetailsController>(
      builder:(bookingDetailsController){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor.withOpacity(Get.isDarkMode?0.5:1),
          boxShadow: shadow
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Theme.of(context).cardColor.withOpacity(0.1),
              height: 40,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("service_info".tr, style:ubuntuBold.copyWith(color: Theme.of(context).textTheme.bodyText1!.color!)),
                  Text("service_cost".tr,style:ubuntuBold.copyWith(color: Theme.of(context).textTheme.bodyText1!.color!)),
                ],
              ),
            ),

            ListView.builder(
              itemCount: bookingDetailsController.bookingDetailsContent!.detail!.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context,index){
              return ServiceInfoItem(
                bookingService:bookingDetailsController.bookingDetailsContent!.detail![index],
                bookingDetailsController: bookingDetailsController,
                index: index,
              );},
            ),

            SizedBox(height:Dimensions.PADDING_SIZE_SMALL),
            Divider(height: 2, color: Theme.of(context).hintColor),
            SizedBox(height:Dimensions.PADDING_SIZE_SMALL),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text("subtotal_vat_ex".tr,
                      style: ubuntuRegularLow.copyWith(color: Theme.of(context).textTheme.bodyText1!.color)
                  )
                ),
                Text("${PriceConverter.convertPrice(bookingDetailsController.allTotalCost)}",
                  style: ubuntuRegularLow.copyWith(color: Theme.of(context).textTheme.bodyText1!.color),
                ),
              ],
            ),
            SizedBox(height:Dimensions.PADDING_SIZE_SMALL),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text("service_discount".tr,
                    style: ubuntuRegularLow.copyWith(color: Theme.of(context).textTheme.bodyText1!.color,),
                  ),
                ),
                Text("(-) ${PriceConverter.convertPrice(bookingDetailsController.totalDiscount)}",
                  style: ubuntuRegularLow.copyWith(color: Theme.of(context).textTheme.bodyText1!.color,),
                ),
              ],
            ),
            SizedBox(height:Dimensions.PADDING_SIZE_SMALL),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text("coupon_discount".tr,
                    style: ubuntuRegularLow.copyWith(color: Theme.of(context).textTheme.bodyText1!.color,),
                  ),
                ),
                Text("(-)${PriceConverter.convertPrice(
                    double.parse(bookingDetailsController.bookingDetailsContent!.totalCouponDiscountAmount!))}",
                  style: ubuntuRegularLow.copyWith(color: Theme.of(context).textTheme.bodyText1!.color),
                ),
              ],
            ),
            SizedBox(height:Dimensions.PADDING_SIZE_SMALL),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text("service_vat".tr,
                    style: ubuntuRegularLow.copyWith(color: Theme.of(context).textTheme.bodyText1!.color,),
                  ),
                ),
                Text("(+)${PriceConverter.convertPrice(
                    double.parse(bookingDetailsController.bookingDetailsContent!.totalTaxAmount))}",
                  style: ubuntuRegularLow.copyWith(color: Theme.of(context).textTheme.bodyText1!.color)
                ),
              ],
            ),
            SizedBox(height:Dimensions.PADDING_SIZE_SMALL),

            Divider(height: 2,color: Theme.of(context).hintColor),
            SizedBox(height:Dimensions.PADDING_SIZE_SMALL),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text("grand_total".tr,
                      style: ubuntuMediumLow.copyWith(color: Theme.of(context).textTheme.bodyText1!.color,),
                  ),
                ),
                Text("${PriceConverter.convertPrice(
                    double.parse(bookingDetailsController.bookingDetailsContent!.totalBookingAmount))}",
                  style: ubuntuMediumLow.copyWith(color: Theme.of(context).textTheme.bodyText1!.color)
                ),
              ],
            ),
            SizedBox(height:Dimensions.PADDING_SIZE_SMALL),
          ],
        ),
      );
      },
    );
  }
}


class ServiceInfoItem extends StatelessWidget {
  final int index;
  final BookingDetailsController bookingDetailsController;
  final BookingService bookingService;
  const ServiceInfoItem({
    Key? key,
    required this.bookingService,
    required this.bookingDetailsController,
    required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height:Dimensions.PADDING_SIZE_DEFAULT),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(bookingService.serviceName?? '',
                    style: ubuntuMediumLow.copyWith(color: Theme.of(context).textTheme.bodyText1!.color), overflow: TextOverflow.ellipsis,maxLines:2)),
                Text("${PriceConverter.convertPrice(bookingDetailsController.unitTotalCost[index])}",
                    style: ubuntuMediumLow.copyWith(color:Theme.of(context).textTheme.bodyText1!.color)),
              ],
            ),
            SizedBox(height:Dimensions.PADDING_SIZE_EXTRA_SMALL),

            Text("${bookingService.variantKey?.replaceAll("-", " ").capitalizeFirst??""}",
                style: ubuntuRegularLow.copyWith(color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.8))),
            SizedBox(height:Dimensions.PADDING_SIZE_SMALL),

            PriceText("unit_price".tr, double.tryParse(bookingService.serviceCost!), context),

            Text("quantity".tr + " :${bookingService.quantity}",
              style: ubuntuRegularLow.copyWith(color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.5))),
            SizedBox(height:Dimensions.PADDING_SIZE_SMALL),

            double.tryParse(bookingService.discountAmount!)! > 0
                ? PriceText("discount".tr, double.tryParse(bookingService.discountAmount!),context)
                : SizedBox(),

            double.tryParse(bookingService.campaignDiscountAmount!)! > 0
                ? PriceText("campaign".tr, double.tryParse(bookingService.campaignDiscountAmount!), context)
                : SizedBox(),

            double.tryParse(bookingService.overallCouponDiscountAmount!)! > 0
                ? PriceText("coupon".tr, double.tryParse(
                bookingService.overallCouponDiscountAmount!), context)
                : SizedBox(),

            bookingService.service != null && bookingService.service!.tax! > 0
                ? PriceText(
                "tax".tr, double.tryParse(bookingService.taxAmount!), context)
                : SizedBox(),
          ],
        );
  }
}


Widget PriceText(String title,var amount,context){
  return Column(
    children: [
      Row(
        children: [
          Text(title+" : ",
          style: ubuntuRegularLow.copyWith(color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.5))),
          Text("${PriceConverter.convertPrice(amount)}",
          style: ubuntuRegularLow.copyWith(color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.5))),
        ],
      ),
      Gaps.verticalGapOf(Dimensions.PADDING_SIZE_EXTRA_SMALL),
    ],
  );
}
