import 'package:felicitup/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppRegularButton extends StatelessWidget {
  const AppRegularButton({
    super.key,
    required this.onTap,
    required this.label,
    required this.isActive,
    this.icon,
    required this.isLoading,
  });

  final VoidCallback onTap;
  final String label;
  final bool isActive;
  final bool isLoading;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isActive ? onTap : null,
      child: Container(
        height: size.height(context, .05),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isActive ? AppColors.orange : AppColors.red.withOpacity(.6),
          borderRadius: size.borderRadius(context, .1),
        ),
        child: isLoading
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : icon == null
                ? Text(
                    label,
                    style: AppStyles.bodyL.copyWith(
                      color: isActive
                          ? Colors.white
                          : Colors.white.withOpacity(.3),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        icon,
                        color: Colors.white,
                      ),
                      SizedBox(width: size.width(context, .03)),
                      Text(
                        label,
                        style: AppStyles.bodyL.copyWith(
                          color: isActive
                              ? Colors.white
                              : Colors.white.withOpacity(.3),
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}

class AppSmallButton extends StatelessWidget {
  const AppSmallButton({
    super.key,
    required this.onTap,
    required this.label,
    required this.isActive,
  });

  final VoidCallback onTap;
  final String label;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isActive ? onTap : null,
      child: Container(
        height: size.height(context, .05),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isActive ? AppColors.orange : AppColors.red.withOpacity(.6),
          borderRadius: size.borderRadius(context, .1),
        ),
        child: Text(
          label,
          style: AppStyles.bodyL.copyWith(
            color: isActive ? Colors.white : Colors.white.withOpacity(.3),
          ),
        ),
      ),
    );
  }
}

class AppSocialRegularButton extends StatelessWidget {
  const AppSocialRegularButton({
    super.key,
    required this.onTap,
    required this.label,
    required this.isActive,
    this.icon,
    required this.isLoading,
  });

  final VoidCallback onTap;
  final String label;
  final bool isActive;
  final bool isLoading;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isActive ? onTap : null,
      child: Container(
        height: size.height(context, .05),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isActive ? Colors.white : AppColors.red.withOpacity(.6),
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: size.borderRadius(context, .1),
        ),
        child: isLoading
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : icon == null
                ? Text(
                    label,
                    style: AppStyles.bodyS.copyWith(
                      color: isActive
                          ? Colors.black
                          : Colors.white.withOpacity(.3),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        icon!,
                      ),
                      SizedBox(width: size.width(context, .03)),
                      Text(
                        label,
                        style: AppStyles.bodyS.copyWith(
                          color: isActive
                              ? Colors.black
                              : Colors.white.withOpacity(.3),
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}
