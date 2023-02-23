import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:demandium_serviceman/core/core_export.dart';

class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      duration: Duration(seconds: 3),
      interval: Duration(seconds: 5), //Default value: Duration(seconds: 0)
      color: Colors.white, //Default value
      colorOpacity: 0, //Default value
      enabled: true, //Default value
      direction: ShimmerDirection.fromLTRB(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(),
            Gaps.verticalGapOf(Dimensions.PADDING_SIZE_LARGE),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Theme.of(context).shadowColor
                  ),
                ),
                Gaps.verticalGapOf(Dimensions.PADDING_SIZE_DEFAULT),
                Container(
                  height: 20,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    color: Theme.of(context).shadowColor
                  ),
                ),
            Gaps.verticalGapOf(Dimensions.PADDING_SIZE_DEFAULT),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 20,
                      width: 10,
                        color: Theme.of(context).shadowColor
                    ),
                    Gaps.verticalGapOf(Dimensions.PADDING_SIZE_SMALL),
                    Container(
                      height: 15,
                      width:90,
                      color:Theme.of(context).shadowColor
                    ),
                    Gaps.verticalGapOf(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    Container(
                      height: 15,
                      width:50,
                      color:Theme.of(context).shadowColor
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 20,
                      width: 10,
                        color:Theme.of(context).shadowColor
                    ),
                    Gaps.verticalGapOf(10),
                    Container(
                      height: 15,
                      width:90,
                      color:Theme.of(context).shadowColor
                    ),
                    Gaps.verticalGapOf(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    Container(
                      height: 15,
                      width:50,
                      color:Theme.of(context).shadowColor,
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 20,
                      width: 10,
                      color: Theme.of(context).shadowColor,
                    ),
                    Gaps.verticalGapOf(Dimensions.PADDING_SIZE_SMALL),
                    Container(
                      height: 15,
                      width:90,
                      color:Theme.of(context).shadowColor,
                    ),
                    Gaps.verticalGapOf(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    Container(
                      height: 15,
                      width:50,
                      color:Theme.of(context).shadowColor,
                    ),
                  ],
                ),
              ],
            ),

            Gaps.verticalGapOf(Dimensions.PADDING_SIZE_LARGE),

            ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
              itemBuilder: (context,index){
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT,vertical: Dimensions.PADDING_SIZE_SMALL),
                child: Container(
                  height: 55,
                  child: Row(),
                  decoration: BoxDecoration(
                      color:Theme.of(context).shadowColor,
                      borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL)
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
