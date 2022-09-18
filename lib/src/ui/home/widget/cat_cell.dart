import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testing_task/themes/colors.dart';
import 'package:testing_task/themes/style.dart';
import 'package:testing_task/themes/weights.dart';

class CatCell extends StatefulWidget {
  final String image;
  final String label;
  final int index;
  int? selectedIndex;
  CatCell({Key? key, required this.image, required this.label, required this.index,this.selectedIndex}) : super(key: key);

  @override
  _CatCellState createState() => _CatCellState();
}

class _CatCellState extends State<CatCell> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 60.sp,
          height: 60.sp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color:widget.selectedIndex!=null&&
            widget.selectedIndex==widget.index?
                AppColors.color24989C:AppColors.primary,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset(widget.image,),
          ),
        ),
        SizedBox(height: 10.h,),
        Text(
          widget.label,
          style: textStyle(
              14.sm, AppFontWeights.normal, AppColors.color141414),
        ),
      ],
    );
  }
}
