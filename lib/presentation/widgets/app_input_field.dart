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
        ? TextFormField(
            controller: controller,
            keyboardType: TextInputType.emailAddress,
            style: AppStyles.bodyL,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.grey,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 2,
                  color: AppColors.darkGrey,
                ),
                borderRadius: size.borderRadius(context, .02),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 2,
                  color: AppColors.darkGrey,
                ),
                borderRadius: size.borderRadius(context, .02),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                  color: AppColors.darkGrey,
                ),
                borderRadius: size.borderRadius(context, .02),
              ),
              disabledBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              hintText: hintText,
              hintStyle: AppStyles.bodyL.copyWith(
                color: AppColors.lightGrey,
              ),
            ),
          )
        : TextFormField(
            controller: controller,
            keyboardType: TextInputType.text,
            obscuringCharacter: '*',
            obscureText: isObscure!,
            style: AppStyles.bodyL,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.grey,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 2,
                  color: AppColors.darkGrey,
                ),
                borderRadius: size.borderRadius(context, .02),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 2,
                  color: AppColors.darkGrey,
                ),
                borderRadius: size.borderRadius(context, .02),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                  color: AppColors.darkGrey,
                ),
                borderRadius: size.borderRadius(context, .02),
              ),
              disabledBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              hintText: hintText,
              hintStyle: AppStyles.bodyL.copyWith(
                color: AppColors.lightGrey,
              ),
              suffixIcon: IconButton(
                onPressed: onTap,
                icon: Icon(
                  isObscure! ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                  color: AppColors.lightGrey,
                  size: 20,
                ),
              ),
            ),
          );
  }
}
