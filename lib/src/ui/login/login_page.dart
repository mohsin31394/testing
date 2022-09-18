import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testing_task/src/ui/widgets/button.dart';
import 'package:testing_task/src/ui/widgets/text_field.dart';
import 'package:testing_task/themes/colors.dart';
import 'package:testing_task/themes/style.dart';
import 'package:testing_task/themes/weights.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  var _mobileNumberCtr = TextEditingController();
  final _mobileFocus = FocusNode();
  var _passwordCtr = TextEditingController();
  final _passwordFocus = FocusNode();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool loader = false;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: loader,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                    'Login',
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
                      child: Column(
                        children: [
                          SizedBox(
                            height: 33.h,
                          ),

                          SizedBox(
                            height: 79.h,
                          ),
                          SimpleTextField(
                            controller: _mobileNumberCtr,
                            hintText:
                                'Mobile Number',
                            labelText:
                                'Mobile Number',
                            image: 'assets/user.png',
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.phone,
                            isMobileNumber: true,
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          SimpleTextField(
                            controller: _passwordCtr,
                            hintText: 'Password',
                            labelText: 'Password',
                            image: 'assets/lock.png',
                            isPasswordField: true,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.visiblePassword,
                          ),
                          SizedBox(
                            height: 28.h,
                          ),
                          Button(
                              loading: loader,
                              text: 'Login',
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
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {

                                },
                                child: Text(
                                  'Forgot Password?',
                                  style: textStyle(18.sm, AppFontWeights.normal,
                                      AppColors.color24989C),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 89.h,
                          ),

                        ],
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
