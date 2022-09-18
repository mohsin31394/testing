import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testing_task/themes/colors.dart';
import 'package:testing_task/themes/style.dart';
import 'package:testing_task/themes/weights.dart';

typedef void VoidCallback();

class Button extends StatefulWidget {
  final String text;
  final VoidCallback callback;
  final bool loading;

  const Button(
      {required this.text, required this.callback, this.loading = false});

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.callback,
        child: Container(
          width: double.infinity,
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            gradient: LinearGradient(
              colors: [AppColors.colorED1C62, AppColors.primary],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Center(
              child: widget.loading
                  ? CircularProgressIndicator(
                      color: AppColors.white,
                    )
                  : Text(
                      widget.text,
                      style: textStyle(
                          18.sm, AppFontWeights.semiBold, Theme.of(context).backgroundColor),
                    )),
        ));
  }
}
