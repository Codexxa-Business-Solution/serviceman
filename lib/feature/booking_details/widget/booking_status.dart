import 'package:get/get.dart';
import 'package:demandium_serviceman/core/core_export.dart';
import 'package:demandium_serviceman/feature/booking_details/controller/booking_details_controller.dart';
import 'package:demandium_serviceman/feature/booking_details/model/booking_details_model.dart';
import 'package:demandium_serviceman/utils/color_resources.dart';
import 'package:timelines/timelines.dart';


class BookingStatus extends StatelessWidget {
  const BookingStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingDetailsController>(builder: (bookingDetailsController){
      if(bookingDetailsController.bookingDetailsContent!=null){
        return Padding(
          padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
          child: SingleChildScrollView(
            child: Column(children: [

              SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${'booking_date'.tr} : ',
                      style: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeDefault)
                  ),
                  Text('${DateConverter.dateMonthYearTime(DateConverter
                      .isoUtcStringToLocalDate(bookingDetailsController.bookingDetailsContent!.createdAt!))}',
                    style: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeDefault),
                    textDirection: TextDirection.ltr,
                  ),
                ],
              ),

              SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${'schedule_date'.tr} : ',
                      style: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeDefault)
                  ),

                  Text('${DateConverter.dateMonthYearTime(DateTime
                      .tryParse(bookingDetailsController.bookingDetailsContent!.serviceSchedule!))}',
                    style: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeDefault),
                    textDirection: TextDirection.ltr,
                  )
                ],
              ),

              SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT,),
              RichText(
                text:TextSpan(text: '${'payment_status'.tr} ',
                    style: ubuntuMedium.copyWith(fontSize: Dimensions.fontSizeDefault,
                        color: Theme.of(context).textTheme.bodyText1!.color),
                    children: [
                      TextSpan(text:bookingDetailsController.bookingDetailsContent!.isPaid==1? 'paid'.tr: 'unpaid'.tr,
                        style: ubuntuMedium.copyWith(fontSize: Dimensions.fontSizeDefault,
                            color:bookingDetailsController.bookingDetailsContent!.isPaid==1?Colors.green:
                            Theme.of(context).errorColor,
                            decoration: TextDecoration.none),),
                    ]),
              ),

              SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT,),
              RichText(text:  TextSpan(text: '${'booking_status'.tr}:   ',
                  style: ubuntuMedium.copyWith(fontSize: Dimensions.fontSizeDefault,
                    color:Theme.of(context).textTheme.bodyText1!.color,),
                  children: [
                    TextSpan(text: bookingDetailsController.bookingDetailsContent!.bookingStatus!.tr,
                        style: ubuntuMedium.copyWith(fontSize: Dimensions.fontSizeDefault,
                            color: ColorResources.buttonTextColorMap[bookingDetailsController.bookingDetailsContent!.bookingStatus],
                            decoration: TextDecoration.none)
                    ),
                  ]),
              ),

              SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT,),
              Container(
                child: Timeline1(
                  bookingDetailsContent: bookingDetailsController.bookingDetailsContent,
                  statusHistories: bookingDetailsController.bookingDetailsContent!.statusHistories,
                  scheduleHistories: bookingDetailsController.bookingDetailsContent!.scheduleHistories,
                  increment: bookingDetailsController.bookingDetailsContent!.scheduleHistories!.length>1?2:1,
                ),
              ),

              SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE,),
            ],
            ),
          ),
        );
      }else{
        return SizedBox();
      }
    });
  }
}


class Timeline1 extends StatelessWidget {
  final BookingDetailsContent? bookingDetailsContent;
  final List<StatusHistories>? statusHistories;
  final List<ScheduleHistories>? scheduleHistories;
  final int increment;
  Timeline1({required this.statusHistories, this.scheduleHistories, required this.increment,this.bookingDetailsContent});

  @override
  Widget build(BuildContext context) {

    return Timeline.tileBuilder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      theme: TimelineThemeData(
          nodePosition: 0,
          indicatorTheme: IndicatorThemeData(position: 0, size: 30.0)),
      padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: Get.find<LocalizationController>().isLtr?0:10),
      builder: TimelineTileBuilder.connected(connectionDirection: ConnectionDirection.before,

        itemCount: statusHistories!.length+increment,

        contentsBuilder: (_, index) {

          return Padding(padding:  EdgeInsets.only(left: 20.0,bottom: 20.0,top: 7,right: 10), child:
          index==0?
          Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${'booking_placed_by'.tr} ${scheduleHistories![index].user!=null?scheduleHistories![index].user!.firstName:"customer".tr} "
                  "${scheduleHistories![index].user!=null?scheduleHistories![index].user!.lastName:""}",
                  style: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeDefault)
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

              Text("${DateConverter.dateMonthYearTime(DateConverter.isoUtcStringToLocalDate(scheduleHistories![index].createdAt!))}",
                style: ubuntuRegular.copyWith(
                  fontSize: Dimensions.fontSizeSmall,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
                textDirection: TextDirection.ltr,
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            ],
          )


              :index==1 ?
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${'booking'.tr} ${statusHistories![index-1].bookingStatus.toString().tr.toLowerCase()} ${'by'.tr} "
                  "${statusHistories![index-1].user!.userType.toString().tr} ",
                style: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeDefault,),
              ),


              SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
              statusHistories![index-1].user!.userType!='provider-admin'?
              Text("${statusHistories![index-1].user!.firstName} ${statusHistories![index-1].user!.lastName}",
                style: ubuntuRegular.copyWith(
                  fontSize: Dimensions.fontSizeSmall,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
              ): Text(bookingDetailsContent?.provider?.companyName??"",
                style: ubuntuRegular.copyWith(
                  fontSize: Dimensions.fontSizeSmall,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
              ),


              SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),

              Text("${DateConverter.dateMonthYearTime(DateConverter.isoUtcStringToLocalDate(statusHistories![index-1].updatedAt!))}",
                style: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeSmall,color: Theme.of(context).secondaryHeaderColor),
                textDirection: TextDirection.ltr,
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT,),
            ],
          )

              :index==2 && scheduleHistories!.length>1?
          Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: (scheduleHistories!.length-1)*80,

                child: ListView.builder(itemBuilder: (_,_index){
                  return  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${'booking_schedule_changed_by'.tr} ${scheduleHistories![_index+1].user!.userType.toString().tr}",
                        style: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeDefault,),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),
                      if(scheduleHistories![_index+1].user!.userType!='provider-admin')
                        Text("${scheduleHistories![_index+1].user?.firstName.toString()} ${scheduleHistories![_index+1].user?.lastName.toString()}",
                          style: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeSmall,
                              color: Theme.of(context).secondaryHeaderColor),
                          textDirection: TextDirection.ltr,
                        ),
                      if(scheduleHistories![_index+1].user!.userType=='provider-admin')
                        Text("${bookingDetailsContent?.provider?.companyName??""} ",
                          style: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeSmall,
                              color: Theme.of(context).secondaryHeaderColor),
                          textDirection: TextDirection.ltr,
                        ),
                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),
                      Text("${DateConverter.dateMonthYearTime(DateTime.tryParse(scheduleHistories![_index+1].schedule!))}",
                        style: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeSmall,
                            color: Theme.of(context).secondaryHeaderColor),
                        textDirection: TextDirection.ltr,
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL,),

                    ],
                  );},
                  shrinkWrap:true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: scheduleHistories!.length-1,
                ),
              ),
            ],
          )
              :Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${'booking'.tr} ${statusHistories![index-increment].bookingStatus.toString().tr.toLowerCase()} ${'by'.tr} "
                  "${statusHistories![index-increment].user!.userType.toString().tr} ",
                  style: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeDefault)
              ),

              SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
              statusHistories![index-increment].user!.userType!='provider-admin'?
              Text("${statusHistories![index-increment].user!.firstName} ${statusHistories![index-increment].user!.lastName}",
                style: ubuntuRegular.copyWith(
                  fontSize: Dimensions.fontSizeSmall,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
              ):Text(bookingDetailsContent?.provider?.companyName??"",
                  style: ubuntuRegular.copyWith(
                    fontSize: Dimensions.fontSizeSmall,
                    color: Theme.of(context).secondaryHeaderColor,
                  )
              ),

              SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

              Text("${DateConverter.dateMonthYearTime(DateConverter
                  .isoUtcStringToLocalDate(statusHistories![index-increment].updatedAt!))}",
                style: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeSmall,color: Theme.of(context).secondaryHeaderColor),
                textDirection: TextDirection.ltr,
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT,),
            ],
          ),
          );},

        connectorBuilder: (_, index, __) => SolidLineConnector(color: Theme.of(context).primaryColor),

        indicatorBuilder: (_, index) {
          return DotIndicator(
            color: Theme.of(context).primaryColor,
            child: Center(child : Icon(Icons.check,color:light.cardColor)),
          );
        },
      ),
    );
  }
}