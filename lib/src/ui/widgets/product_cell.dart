import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testing_task/src/models/item_model.dart';
import 'package:testing_task/themes/colors.dart';
import 'package:testing_task/themes/style.dart';
import 'package:testing_task/themes/weights.dart';

class ProductCell extends StatefulWidget {

  final snapshot;
  const ProductCell({Key? key, required this.snapshot}) : super(key: key);

  @override
  _ProductCellState createState() => _ProductCellState();
}

class _ProductCellState extends State<ProductCell> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Theme.of(context).hintColor,),
        color:Theme.of(context).backgroundColor,
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(10.sp),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 80.w,
                    height: 98.h,
                    decoration: BoxDecoration(
                      color: AppColors.color24989C.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: Theme.of(context).hintColor,)

                    ),
                    child: Image.network(widget.snapshot.image_link,),
                  ),
                  SizedBox(width: 15.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 12.h,),
                      SizedBox(
                        width: 200.w,
                        child: Text(
                          widget.snapshot.name,
                          style: textStyle(
                              16.sm, AppFontWeights.bold, Theme.of(context).hintColor),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      SizedBox(height: 5.h,),
                      Row(
                        children: [
                          Text(
                            'Type : ',
                            style: textStyle(
                                14.sm, AppFontWeights.normal, AppColors.color24989C),
                          ),
                          SizedBox(width: 16.w,),
                          Text(
                            widget.snapshot.animal_type,
                            style: textStyle(
                                14.sm, AppFontWeights.normal, AppColors.color24989C),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h,),
                      Row(
                        children: [
                          Text(
                            'Active Time : ',
                            style: textStyle(
                                14.sm, AppFontWeights.normal, AppColors.color24989C),
                          ),
                          SizedBox(width: 16.w,),
                          Text(
                            widget.snapshot.active_time,
                            style: textStyle(
                                14.sm, AppFontWeights.normal, AppColors.color24989C),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),

                    ],
                  ),
                ],
              ),
              SizedBox(height: 6.h,),
              Row(
                children: [
                  Image.asset('assets/location2.png',width: 10.5,),
                  SizedBox(width: 8.w,),
                  SizedBox(
                    width: 260.w,
                    child: Text(
                      widget.snapshot.geo_range,
                      style: textStyle(
                          14.sm, AppFontWeights.normal, AppColors.color9E9B9B),
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.h,),
              Row(
                children: [
                  Text(
                    'Habitat : ',
                    style: textStyle(
                        14.sm, AppFontWeights.normal, AppColors.color24989C),
                  ),
                  SizedBox(width: 16.w,),
                  SizedBox(
                    width: 240.w,
                    child: Text(
                      widget.snapshot.habitat,
                      style: textStyle(
                          14.sm, AppFontWeights.normal, AppColors.color24989C),
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
}
