import 'package:get/get.dart';
import 'package:demandium_serviceman/core/core_export.dart';
import 'package:demandium_serviceman/core/helper/price_converter.dart';
import 'package:demandium_serviceman/feature/booking_details/controller/booking_details_controller.dart';
import 'package:demandium_serviceman/feature/booking_details/widget/booking_item.dart';

class BookingInformationView extends StatelessWidget {
  const BookingInformationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<BookingDetailsController>(builder: (bookingDetailsController){
      final bookingDetails =bookingDetailsController.bookingDetailsContent;
      return Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          SizedBox(height:Dimensions.PADDING_SIZE_DEFAULT),
          BookingItem(
            img: Images.iconCalendar,
            title: '${'booking_date'.tr} : ',
            date: '${DateConverter.dateMonthYearTime(
                DateConverter.isoUtcStringToLocalDate(bookingDetails!.createdAt!))
            }',
          ),
          SizedBox(height:Dimensions.PADDING_SIZE_SMALL),

          BookingItem(
            img: Images.iconCalendar,
            title: '${'schedule_date'.tr} : ',
            date: ' ${DateConverter.dateMonthYearTime(DateTime.tryParse(bookingDetails.serviceSchedule!))}',
          ),
          SizedBox(height:Dimensions.PADDING_SIZE_SMALL),

          BookingItem(
            img: Images.iconLocation,
            title: '${'service_address'.tr} : ${bookingDetails.serviceAddress !=null?''
                '${bookingDetails.serviceAddress!.address}'
                :'address_not_found'.tr
            }',
            date: '',
          ),
          SizedBox(height:Dimensions.PADDING_SIZE_DEFAULT),
          Text("payment_method".tr,
            style: ubuntuBold.copyWith(
                fontSize: Dimensions.fontSizeDefault,
                color: Theme.of(context).textTheme.bodyText1!.color),
          ),
          SizedBox(height:Dimensions.PADDING_SIZE_EXTRA_SMALL),

          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(bookingDetails.paymentMethod!.tr,
                style: ubuntuRegular.copyWith(
                  fontSize: Dimensions.fontSizeSmall,
                  color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.6),
                ),
              ),
              RichText(
                text: TextSpan(text: "${'payment_status'.tr} ",
                  style: ubuntuMedium.copyWith(fontSize: Dimensions.fontSizeDefault, color: Theme.of(context).hintColor),
                  children: <TextSpan>[
                    TextSpan(
                      text: bookingDetails.isPaid == 0 ? "unpaid".tr : "paid".tr,
                      style: ubuntuBold.copyWith(
                        fontSize: Dimensions.fontSizeDefault,
                        color: bookingDetails.isPaid == 0 ?
                        Theme.of(context).errorColor: Colors.green,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height:Dimensions.PADDING_SIZE_EXTRA_SMALL),

          bookingDetails.paymentMethod!="cash_after_service" ?
          Text("${'transaction_id'.tr} : ${bookingDetails.transactionId}",
            style: ubuntuRegular.copyWith(
              fontSize: Dimensions.fontSizeSmall,
              color: Theme.of(context).hintColor,
            ),
          ):SizedBox.shrink(),

          SizedBox(height:Dimensions.PADDING_SIZE_EXTRA_SMALL),

          Row(
            children: [
              Text("${'amount'.tr} : ",
                style: ubuntuBold.copyWith(
                  fontSize: Dimensions.fontSizeSmall,
                  color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.7),
                ),
              ),

              Text("${PriceConverter.convertPrice(double.parse(bookingDetails.totalBookingAmount),isShowLongPrice:true)}",
                style: ubuntuBold.copyWith(
                  fontSize: Dimensions.fontSizeSmall,
                  color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}