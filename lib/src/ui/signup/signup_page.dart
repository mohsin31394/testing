import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testing_task/src/ui/widgets/button.dart';
import 'package:testing_task/src/ui/widgets/text_field.dart';
import 'package:testing_task/themes/colors.dart';
import 'package:testing_task/themes/style.dart';
import 'package:testing_task/themes/weights.dart';


import '../../../main.dart';
import '../bottom_nav_bar/bottom_nav_bar_page.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  var _passwordCtr = TextEditingController();
  var _mobileCtr = TextEditingController();
  var _nameCtr = TextEditingController();
  var _emailCtr = TextEditingController();
  var _cityCtr = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool loader = false;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: loader,
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: AppColors.primary,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 51.h, bottom: 22.h),
                  child: Text(
                    'Sign Up',
                    style: textStyle(
                        20.sm, AppFontWeights.bold, AppColors.color141414),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          topRight: Radius.circular(20.r)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 33.h,
                            ),

                            SizedBox(
                              height: 31.h,
                            ),
                            SimpleTextField(
                              hintText:
                                  'Mobile Number',
                              labelText:
                                  'Mobile Number',
                              image: 'assets/mobile.png',
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.phone,
                              isMobileNumber: true,
                              controller: _mobileCtr,
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            SimpleTextField(
                              hintText: 'Full Name',
                              labelText: 'Full Name',
                              image: 'assets/user.png',
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              isFullname: true,
                              controller: _nameCtr,
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            SimpleTextField(
                              hintText: 'Email',
                              labelText: 'Email',
                              image: 'assets/email.png',
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              isEmail: true,
                              controller: _emailCtr,
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            SimpleTextField(
                              hintText: 'Password',
                              labelText: 'Password',
                              image: 'assets/lock.png',
                              isPasswordField: true,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.visiblePassword,
                              controller: _passwordCtr,
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            SimpleTextField(
                              hintText: 'City',
                              labelText: 'City',
                              image: 'assets/user.png',
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.text,
                              isCity: true,
                              controller: _cityCtr,
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Button(
                                loading: loader,
                                text: 'Sign Up',
                                callback: () async {
                                  if (_formKey.currentState!.validate()) {
                                    FocusManager.instance.primaryFocus?.unfocus();
                                    setState(() {
                                      loader = true;
                                    });
                                    await Future.delayed(Duration(milliseconds: 2000));
                                    setState(() {
                                      loader = false;
                                    });


                                  }
                                }),
                            SizedBox(
                              height: 45.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
