import 'package:felicitup/core/utils/utils.dart';
import 'package:flutter/material.dart';

class AppInputField extends StatelessWidget {
  const AppInputField({
    super.key,
    required this.isEmail,
    required this.hintText,
    required this.controller,
    this.isObscure,
    this.onTap,
  });

  final bool isEmail;
  final String hintText;
  final TextEditingController controller;
  final bool? isObscure;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return isEmail
        ? Container(
            height: size.height(context, .07),
            alignment: Alignment.center,
            child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.emailAddress,
              style: AppStyles.bodyL,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 2,
                    color: AppColors.darkGrey,
                  ),
                  borderRadius: size.borderRadius(context, .1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 2,
                    color: AppColors.darkGrey,
                  ),
                  borderRadius: size.borderRadius(context, .1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 1,
                    color: AppColors.darkGrey,
                  ),
                  borderRadius: size.borderRadius(context, .1),
                ),
                disabledBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                hintText: hintText,
                hintStyle: AppStyles.bodyL.copyWith(
                  color: AppColors.darkGrey,
                ),
              ),
            ),
          )
        : Container(
            height: size.height(context, .07),
            alignment: Alignment.center,
            child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.text,
              obscuringCharacter: '*',
              obscureText: isObscure!,
              style: AppStyles.bodyL,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 2,
                    color: AppColors.darkGrey,
                  ),
                  borderRadius: size.borderRadius(context, .1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 2,
                    color: AppColors.darkGrey,
                  ),
                  borderRadius: size.borderRadius(context, .1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 1,
                    color: AppColors.darkGrey,
                  ),
                  borderRadius: size.borderRadius(context, .1),
                ),
                disabledBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                hintText: hintText,
                hintStyle: AppStyles.bodyL.copyWith(
                  color: AppColors.darkGrey,
                ),
                suffixIcon: IconButton(
                  onPressed: onTap,
                  icon: Icon(
                    isObscure!
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.darkGrey,
                    size: 20,
                  ),
                ),
              ),
            ),
          );
  }
}

class AppRegisterInputField extends StatelessWidget {
  const AppRegisterInputField({
    super.key,
    required this.isEmail,
    required this.hintText,
    required this.controller,
    this.isObscure,
    this.onTap,
  });

  final bool isEmail;
  final String hintText;
  final TextEditingController controller;
  final bool? isObscure;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return isEmail
        ? Container(
            height: size.height(context, .07),
            alignment: Alignment.center,
            child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.emailAddress,
              style: AppStyles.bodyL,
              decoration: InputDecoration(
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: AppColors.darkGrey,
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: AppColors.darkGrey,
                  ),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: AppColors.darkGrey,
                  ),
                ),
                disabledBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                hintText: hintText,
                hintStyle: AppStyles.bodyL.copyWith(
                  color: AppColors.darkGrey,
                ),
              ),
            ),
          )
        : Container(
            height: size.height(context, .07),
            alignment: Alignment.center,
            child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.text,
              obscuringCharacter: '*',
              obscureText: isObscure!,
              style: AppStyles.bodyL,
              decoration: InputDecoration(
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: AppColors.darkGrey,
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: AppColors.darkGrey,
                  ),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: AppColors.darkGrey,
                  ),
                ),
                disabledBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                hintText: hintText,
                hintStyle: AppStyles.bodyL.copyWith(
                  color: AppColors.darkGrey,
                ),
                suffixIcon: IconButton(
                  onPressed: onTap,
                  icon: Icon(
                    isObscure!
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.darkGrey,
                    size: 20,
                  ),
                ),
              ),
            ),
          );
  }
}
