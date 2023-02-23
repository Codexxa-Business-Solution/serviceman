import 'package:get/get.dart';
import 'package:demandium_serviceman/core/core_export.dart';

class NoInternetScreen extends StatelessWidget {
  final Widget? child;
  NoInternetScreen({this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.025),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Images.noInternet, width: 150, height: 150),
            Text('oops'.tr, style: ubuntuBold.copyWith(
              fontSize: 30,
              color: Theme.of(context).textTheme.bodyText1!.color,
            )),
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            Text(
              'no_internet_connection'.tr,
              textAlign: TextAlign.center,
              style: ubuntuRegular,
            ),
            SizedBox(height: 40),
            Container(
              height: 45,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: CustomButton(
                onPressed: () async {
                  if(await Connectivity().checkConnectivity() != ConnectivityResult.none) {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => child!));
                  }
                },
                btnTxt: 'retry'.tr,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
