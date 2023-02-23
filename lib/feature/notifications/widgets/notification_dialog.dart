import 'package:flutter/material.dart';
import 'package:demandium_serviceman/utils/dimensions.dart';
import 'package:demandium_serviceman/utils/images.dart';
import 'package:demandium_serviceman/utils/styles.dart';

class NotificationDialog extends StatelessWidget{
  final String imageUrl;
  final String? title;
  final String? subTitle;
  const NotificationDialog({Key? key, required this.imageUrl,this.title,this.subTitle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      backgroundColor: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
      titlePadding: EdgeInsets.all(0),
      contentPadding: EdgeInsets.all(0),
      title:  Align(alignment: Alignment.topRight,
        child: IconButton(icon: Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT),
              child: Column(
                children: [
                  title!=null?Text(title!,style: ubuntuMedium.copyWith(color: Theme.of(context).
                  textTheme.bodyText1!.color!.withOpacity(0.7) ,
                      fontSize: Dimensions.fontSizeDefault
                  )): SizedBox.shrink(),

                  SizedBox(height: title!=null? Dimensions.PADDING_SIZE_DEFAULT:0,),

                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Theme.of(context).primaryColor.withOpacity(0.20)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FadeInImage.assetNetwork(
                        placeholder: Images.placeholder, image: imageUrl, fit: BoxFit.contain,
                        imageErrorBuilder: (c, o, s) => Image.asset(
                          Images.placeholder, height: MediaQuery.of(context).size.width - 130,
                          width: MediaQuery.of(context).size.width, fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: subTitle!=null? Dimensions.PADDING_SIZE_DEFAULT:0,),
                  subTitle!=null?Text(subTitle!,style: ubuntuRegular.copyWith(color: Theme.of(context).
                  textTheme.bodyText1!.color!.withOpacity(0.5) ,
                    fontSize: Dimensions.fontSizeDefault,
                  ),textAlign: TextAlign.justify,):SizedBox.shrink(),

                  SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}