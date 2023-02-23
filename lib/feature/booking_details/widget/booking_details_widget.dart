import 'package:demandium_serviceman/components/custom_loader.dart';
import 'package:get/get.dart';
import 'package:demandium_serviceman/core/core_export.dart';
import 'package:demandium_serviceman/feature/booking_details/controller/invoice_controller.dart';
import 'package:demandium_serviceman/feature/booking_details/controller/pdf_controller.dart';
import 'package:demandium_serviceman/feature/booking_details/widget/booking_info_view.dart';
import 'package:demandium_serviceman/feature/booking_details/widget/customer_info.dart';
import 'package:demandium_serviceman/feature/booking_details/widget/provider_info_Card.dart';
import 'package:demandium_serviceman/feature/booking_details/widget/status_change_dropdown_Button.dart';
import 'package:demandium_serviceman/utils/color_resources.dart';
import '../controller/booking_details_controller.dart';
import 'booking_summery_widget.dart';

class BookingDetailsWidget extends StatefulWidget{
  BookingDetailsWidget({Key? key}) : super(key: key);

  @override
  State<BookingDetailsWidget> createState() => _BookingDetailsWidgetState();
}

class _BookingDetailsWidgetState extends State<BookingDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingDetailsController>(
      builder: (bookingDetailsController){
      return bookingDetailsController.bookingDetailsContent==null ?
        SizedBox(
            height: Get.height*0.8,
            child:Center(
                child: CircularProgressIndicator(color: Theme.of(context).hoverColor)
            )
        ) : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height:Dimensions.PADDING_SIZE_SMALL),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor.withOpacity(Get.isDarkMode?0.5:1),
                      boxShadow: shadow,
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.PADDING_SIZE_DEFAULT,
                        vertical: Dimensions.PADDING_SIZE_SMALL),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "booking".tr+' # ${bookingDetailsController.bookingDetailsContent!.readableId}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: ubuntuMediumHigh.copyWith(color: Theme.of(context).textTheme.bodyText1!.color)
                                ),
                                Gaps.verticalGapOf(Dimensions.PADDING_SIZE_SMALL),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                        horizontal: Dimensions.PADDING_SIZE_DEFAULT,
                                        vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL
                                    ),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
                                      color:Colors.grey.withOpacity(0.2)
                                  ),
                                  child: Center(
                                    child: Text("${bookingDetailsController.bookingDetailsContent!.bookingStatus!.tr}",
                                      style:ubuntuMediumLow.copyWith(
                                        color: ColorResources.buttonTextColorMap[bookingDetailsController.bookingDetailsContent!
                                            .bookingStatus],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            CustomButton(
                              height: 35,
                              width: 80,
                              fontSize: Dimensions.fontSizeSmall,
                              btnTxt: "invoice".tr,
                              onPressed: () async {
                                Get.dialog(CustomLoader(), barrierDismissible: false);
                                var pdfFile = await PdfInvoiceApi.generate(
                                    bookingDetailsController.bookingDetailsContent!,
                                    bookingDetailsController.invoiceItems,
                                    bookingDetailsController
                                );
                                Get.back();
                                PdfApi.openFile(pdfFile);
                              },
                            )
                          ]
                        ),
                        BookingInformationView(),

                      ],
                    ),
                  ),

                  Row(
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_SMALL,horizontal: Dimensions.PADDING_SIZE_DEFAULT),
                        child: Text("booking_summary".tr,
                            style:ubuntuMediumMid.copyWith(color: Theme.of(context).textTheme.bodyText1!.color)),
                      ),
                    ],
                  ),

                  BookingSummeryWidget(bookingDetailsContent: bookingDetailsController.bookingDetailsContent!),

                  SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT,),

                  BookingDetailsProviderInfo(),

                  SizedBox(height:Dimensions.PADDING_SIZE_DEFAULT),

                  BookingDetailsCustomerInfo(),

                  SizedBox(height:Dimensions.PADDING_SIZE_EXTRA_LARGE),
                ],
              ),
            ),),
            SafeArea(child: StatusChangeDropdownButton()),
          ],
      );
      },
    );
  }
}








