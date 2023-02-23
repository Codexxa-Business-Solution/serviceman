import 'package:demandium_serviceman/core/core_export.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final bool? transparent;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final double? fontSize;
  final double? radius;
  final IconData? icon;
  final Color? color;
  final String btnTxt;
  CustomButton({this.onPressed, this.transparent = false, this.margin, this.width, this.height,this.color,
    this.fontSize, this.radius = 5, this.icon,required this.btnTxt});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle _flatButtonStyle = TextButton.styleFrom(
      elevation: 0,
      backgroundColor: onPressed == null ? Theme.of(context).disabledColor : transparent!
          ? Colors.transparent :color != null?color: Theme.of(context).primaryColor,
      minimumSize: Size(width != null ? width! : Dimensions.WEB_MAX_WIDTH, height != null ? height! : 45),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius!),
      ),
    );

    return Center(child: SizedBox(width: width != null ? width : Dimensions.WEB_MAX_WIDTH, child: Padding(
      padding: margin == null ? EdgeInsets.all(0) : margin!,
      child: ElevatedButton(
        onPressed: onPressed,
        style: _flatButtonStyle,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          icon != null ? Padding(
            padding: EdgeInsets.only(right: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            child: Icon(icon, color: transparent! ? Theme.of(context).primaryColor : Theme.of(context).cardColor),
          ) : SizedBox(),
          Text(btnTxt, textAlign: TextAlign.center, style: ubuntuMedium.copyWith(
            color: transparent! ? Theme.of(context).primaryColor : Colors.white,
            fontSize: fontSize != null ? fontSize : Dimensions.fontSizeLarge,
          )),
        ]),
      ),
    )));
  }
}