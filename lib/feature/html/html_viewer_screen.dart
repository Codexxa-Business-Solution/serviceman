import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:demandium_serviceman/core/core_export.dart';
import 'package:demandium_serviceman/feature/html/controller/webview_controller.dart';
import 'package:demandium_serviceman/utils/html_type.dart';

class HtmlViewerScreen extends StatefulWidget {
  final HtmlType? htmlType;
  HtmlViewerScreen({@required this.htmlType});

  @override
  State<HtmlViewerScreen> createState() => _HtmlViewerScreenState();
}

class _HtmlViewerScreenState extends State<HtmlViewerScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: CustomAppBar(
        title:  widget.htmlType == HtmlType.TERMS_AND_CONDITION ? 'terms_conditions'.tr
            : widget.htmlType == HtmlType.ABOUT_US ? 'about_us'.tr
            : widget.htmlType == HtmlType.PRIVACY_POLICY ? 'privacy_policy'.tr
            : widget.htmlType == HtmlType.REFUND_POLICY ? 'refund_policy'.tr
            : widget.htmlType == HtmlType.CANCELLATION_POLICY ? 'cancellation_policy'.tr
            : 'no_data_found'.tr,
      ),

      body: GetBuilder<HtmlViewController>(
        initState: (state){
          Get.find<HtmlViewController>().getPagesContent();
        },
        builder: (htmlViewController){
          String? _data;
          if(htmlViewController.pagesContent != null){
            _data = widget.htmlType == HtmlType.TERMS_AND_CONDITION ? htmlViewController.pagesContent!.termsAndConditions!.liveValues!
                : widget.htmlType == HtmlType.ABOUT_US ? htmlViewController.pagesContent!.aboutUs!.liveValues!
                : widget.htmlType == HtmlType.PRIVACY_POLICY ? htmlViewController.pagesContent!.privacyPolicy!.liveValues!
                : widget.htmlType == HtmlType.REFUND_POLICY ? htmlViewController.pagesContent!.refundPolicy!.liveValues!
                : widget.htmlType == HtmlType.CANCELLATION_POLICY ? htmlViewController.pagesContent!.cancellationPolicy!.liveValues!
                : null;

            if(_data != null) {
              _data = _data.replaceAll('href=', 'target="_blank" href=');
              return Center(
                child: Container(
                  width: Dimensions.WEB_MAX_WIDTH,
                  height: MediaQuery.of(context).size.height,
                  color: GetPlatform.isWeb ? Colors.white : Theme.of(context).cardColor.withOpacity(Get.isDarkMode?0.5:1),
                  child:SingleChildScrollView(
                    padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                    physics: BouncingScrollPhysics(),
                    child: Html(data:_data),
                  ),
                ),
              );
            }else{
              return SizedBox();
            }
          }else{
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
}