import 'package:get/get.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:demandium_serviceman/core/core_export.dart';

class DashboardTopCardShimmer extends StatelessWidget {
  const DashboardTopCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      duration: Duration(seconds: 3),
      interval: Duration(seconds: 5), //Default value: Duration(seconds: 0)
      colorOpacity: 0, //Default value
      enabled: true, //Default value
      direction: ShimmerDirection.fromLTRB(),
      child: Container(
        height: context.height,
        width: context.width,
        //color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Top cards
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT, vertical: Dimensions.PADDING_SIZE_DEFAULT),
                child: Row(
                  children: [
                    Expanded(child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).shadowColor,
                      ),
                    ),),
                    SizedBox(width: 10,),
                    Expanded(child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).shadowColor,
                      ),
                    ),),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 80,
                width: context.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).shadowColor,
                ),

              ),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 80,
                width: context.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).shadowColor,
                ),

              ),
              SizedBox(height: 20),


              //Stats Section
              Container(
                height: 35,
                width: double.infinity,
                color:Theme.of(context).shadowColor,
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 30,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        color:Theme.of(context).shadowColor,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 30,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).shadowColor
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 30,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).shadowColor,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                child: Container(
                  height: 180,
                  width: double.infinity,
                  color:Theme.of(context).shadowColor,
                ),
              ),
              SizedBox(height:10),

              Container(
                height: 35,
                width: double.infinity,
                  color: Theme.of(context).shadowColor,
              ),

              SizedBox(height:10),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color:Theme.of(context).shadowColor,
                      borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                ),
              ),
              SizedBox(height:10),


            ],
          ),
        ),
      ),
    );
  }
}