

import 'package:flutter/material.dart';

import 'constant.dart';

class CustomTextFromField extends StatelessWidget {

  CustomTextFromField({
    Key? key,
    this.hintText,
    this.suffixIcon,
    this.isobSecure,
    this.controller,
    this.inputType,
    this.suffixIconColor,
    this.enable,
    this.initialValue,
    this.labelText,
    this.maxLength,
    this.onTap,
    this.width ,
    this.height,
    this.margin,
    this.onChange,
    this.padding=const EdgeInsets.only(right: 10),
    this.maxLine,
    this.backColor
  }) : super(key: key);

  final String? hintText;
  final String? labelText;
  final String? initialValue;
  final suffixIcon;
  final suffixIconColor;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onChange;
  final bool? isobSecure;
  final bool? enable;
  final int? maxLength;
  final double? width;
  final double? height;
  final Color? backColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  TextEditingController? controller=TextEditingController();
  final TextInputType? inputType;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: backColor,
      ),
      child: TextFormField(
        onTap: onTap,
        onChanged: onChange,
        initialValue: initialValue,
        keyboardType: inputType,
        enabled: enable,
        controller: controller,
        maxLength: maxLength,
        maxLines: maxLine,
        decoration: InputDecoration(
          suffixIconColor: suffixIconColor,
          suffixIcon: suffixIcon,
          hintText: hintText,
          labelText: labelText,
          hintStyle:const TextStyle(fontSize: 15,color: Constant.white,fontWeight: FontWeight.w900),
          border: InputBorder.none,
        ),
        obscureText: isobSecure!,
        style:const TextStyle(color: Constant.white,fontSize: 16),
      ),
    );
  }
}
