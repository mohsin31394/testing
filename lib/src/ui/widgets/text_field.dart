import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testing_task/themes/colors.dart';

class SimpleTextField extends StatefulWidget {
  FontWeight fontWeight;
  String? labelText, hintText;
  String? image;
  TextInputType? keyboardType;
  bool? isPasswordField;
  bool isMultiLineField;
  double padding;
  VoidCallback? onTap;
  bool dateField;
  TextEditingController? controller;
  String? yourInitialData;
  FocusNode? myFocusNode;
  bool isEmail, isFullname, isDropdown,isMobileNumber,isPrice,isAdTitle,isCity,isAdDetails;
  String? email, name;
  bool labelTextBehaveAuto;
  TextInputAction? textInputAction;

  SimpleTextField(
      {Key? key,
        this.isMobileNumber=false,
        this.isAdTitle=false,
        this.isAdDetails=false,
        this.isCity=false,
        this.isPrice=false,
        this.isMultiLineField=false,
      this.labelText = ' ',
      this.hintText = ' ',
      this.isDropdown = false,
      this.image,
      this.labelTextBehaveAuto = false,
      this.padding = 0,
      this.keyboardType,
      this.isPasswordField = false,
      this.onTap = null,
      this.isEmail = false,
      this.isFullname = false,
      this.dateField = false,
      this.yourInitialData,
      this.myFocusNode,
      this.textInputAction,
      this.fontWeight = FontWeight.normal,
      this.controller})
      : super(key: key);

  @override
  State<SimpleTextField> createState() => _SimpleTextFieldState();
}

class _SimpleTextFieldState extends State<SimpleTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: widget.padding),
      child: TextFormField(
        enabled: true,
        maxLines: widget.isMultiLineField?4:1,
        focusNode: widget.myFocusNode,
        controller: widget.controller,
        textInputAction: widget.textInputAction,
        readOnly: widget.dateField,
        cursorColor: AppColors.color141414,
        keyboardType: widget.keyboardType,
        obscureText: widget.isPasswordField!?obscureText:false,
        obscuringCharacter: '*',
        style: const TextStyle(
          color: AppColors.color141414,
        ),
        initialValue: widget.yourInitialData,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.colorFAF2F2,
          labelText: widget.labelText,
          labelStyle: TextStyle(
            color: AppColors.color9E9B9B,
          ),
          errorStyle: TextStyle(
            color: AppColors.colorED1C62
          ),
          hintText: widget.hintText,
          floatingLabelBehavior: widget.labelTextBehaveAuto
              ? FloatingLabelBehavior.auto
              : FloatingLabelBehavior.never,
          hintStyle: TextStyle(
            color: AppColors.color141414,
          ),
          contentPadding:widget.isMultiLineField? EdgeInsets.all(20):EdgeInsets.only(top: 0),
          suffixIcon:widget.isPasswordField!? InkWell(
            onTap: () {
              setState(() {
                  obscureText = !obscureText;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Icon(obscureText? Icons.visibility
                  : Icons.visibility_off,color: AppColors.color9E9B9B,),
            ),
          ):null,
          prefixIcon:widget.isMultiLineField?null: InkWell(
            onTap: widget.onTap,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: widget.image != null
                  ? Image.asset(widget.image!,scale: 3.5,)
                  : SizedBox(),
            ),
          ),
          border: myinputborder(),
          focusedErrorBorder: myinputborder(),
          errorBorder: myinputborder(),
          enabledBorder: myinputborder(),
          //enabled border
          focusedBorder: myfocusborder(), //focused border
        ),
        validator: (String? value) {
          if (widget.isPasswordField!) {
              return passwordFieldError(value);
          }else if (widget.isMobileNumber) {
            return mobileFieldError(value);
          }else if (widget.isFullname) {
            return nameFieldError(value);
          }else if (widget.isEmail) {
            return emailFieldError(value);
          }else if (widget.isCity) {
            return cityFieldError(value);
          }
          return null;
        },
      ),
    );
  }

  String? mobileFieldError(String? value){
    if(value!.isEmpty){
      return 'Enter Phone Number';
    }else if(value.length<11){
      return 'Enter valid Phone Number';
    }
    return null;
  }
  String? passwordFieldError(String? value){
    if(value!.isEmpty){
      return 'Enter Password';
    }
    return null;
  }
  String? nameFieldError(String? value){
    if(value!.isEmpty){
      return 'Enter Your Name';
    }
    return null;
  }
  String? cityFieldError(String? value){
    if(value!.isEmpty){
      return 'Enter City';
    }
    return null;
  }
  String? emailFieldError(String? value){
    if(value!.isEmpty){
      return 'Enter Your Email';
    }else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
      return 'Enter Valid Email';
    }
    return null;
  }






}

OutlineInputBorder myinputborder({isOffWhite = false}) {
  //return type is OutlineInputBorder
  return OutlineInputBorder(
      //Outline border type for TextFeild
      borderRadius: BorderRadius.all(Radius.circular(10.r)),
      borderSide: BorderSide(
        color: AppColors.colorFAF2F2,
        width: 3,
      ));
}

OutlineInputBorder myfocusborder({isOffWhite = false}) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.r)),
      borderSide: BorderSide(
        color: AppColors.colorFAF2F2,
        width: 3,
      ));
}
