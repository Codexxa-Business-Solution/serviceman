import 'package:get/get.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:demandium_serviceman/core/core_export.dart';

class BookingHistoryShimmer extends StatelessWidget {
  const BookingHistoryShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      duration: Duration(seconds: 3),
      interval: Duration(seconds: 5), //Default value: Duration(seconds: 0)
      color: light.cardColor, //Default value
      colorOpacity: 0, //Default value
      enabled: true, //Default value
      direction: ShimmerDirection.fromLTRB(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Container(
            height: context.height,
            width: context.width,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 80,
                             decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),  color: Theme.of(context).shadowColor,
                            ),
                          ),
                          SizedBox(width: 10),

                          Expanded(
                              child: Container(
                                  width: 200,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:Theme.of(context).shadowColor,
                                  )))
                        ],
                      ),

                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                      Container(
                          height: 25,
                          width: context.width*.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Theme.of(context).shadowColor,
                          )
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          ]
        ),
      ),
    );
  }
}