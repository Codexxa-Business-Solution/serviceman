import 'package:demandium_serviceman/core/core_export.dart';
import 'package:get/get.dart';

class ConfirmationDialog extends StatelessWidget {
  final String? icon;
  final String? title;
  final String? description;
  final Color? yesButtonColor;
  final Function()? onYesPressed;
  final bool? isLogOut;
  final Color? imageBackgroundColor;
  final Function? onNoPressed;
  final bool isLoading;
  ConfirmationDialog({@required this.icon, this.title, @required this.description, @required this.onYesPressed,
    this.isLogOut = false, this.onNoPressed, this.yesButtonColor=const Color(0xFFF24646), this.imageBackgroundColor, this.isLoading=false});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT)),
      insetPadding: EdgeInsets.all(30),
      backgroundColor: Theme.of(context).cardColor,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: SizedBox(width: 320, child: Padding(
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
        child: Column(mainAxisSize: MainAxisSize.min, children: [

          Padding(
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
            child: Image.asset(
              icon!,
              width: 50,
              height: 50,
              color: imageBackgroundColor??null,
            ),
          ),

          title != null ? Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE),
            child: Text(
              title!, textAlign: TextAlign.center,
              style: ubuntuMedium.copyWith(
                  fontSize: Dimensions.fontSizeDefault,
                  color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.8)
              ),
            ),
          ) : SizedBox(),

          Padding(
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
            child: Text(description!,
                style: ubuntuRegular.copyWith(
                    fontSize: Dimensions.fontSizeSmall,color: Theme.of(context).hintColor),
                textAlign: TextAlign.center
            ),
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: Dimensions.PADDING_SIZE_LARGE),

                Expanded(child: TextButton(
                  onPressed: () => isLogOut! ? onYesPressed!() : onNoPressed != null ? onNoPressed!() : Get.back(),
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).hintColor.withOpacity(0.3),
                    minimumSize: Size(Dimensions.WEB_MAX_WIDTH, 40),
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL)),
                  ),
                  child: Text(
                    isLogOut! ? 'yes'.tr : 'no'.tr, textAlign: TextAlign.center,
                    style: ubuntuBold.copyWith(color: Theme.of(context).textTheme.bodyText1!.color),
                  ),
                )),
                SizedBox(width: Dimensions.PADDING_SIZE_LARGE),


                Expanded(
                    child: isLoading?
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(
                        color: Theme.of(context).hoverColor,
                      ),
                    ): CustomButton(
                      color: yesButtonColor,
                      btnTxt: isLogOut! ? 'no'.tr : 'yes'.tr,
                      onPressed: () => isLogOut! ? Get.back() : onYesPressed!(),
                      radius: Dimensions.RADIUS_SMALL, height: 40,
                    )
                ),
                SizedBox(width: Dimensions.PADDING_SIZE_LARGE),

              ]),

        ]),
      )),
    );
  }
}