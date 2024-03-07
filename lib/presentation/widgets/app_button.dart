import 'package:felicitup/core/utils/utils.dart';
import 'package:flutter/material.dart';

class AppRegularButton extends StatelessWidget {
  const AppRegularButton({
    super.key,
    required this.onTap,
    required this.label,
    required this.isActive,
    this.icon,
  });

  final VoidCallback onTap;
  final String label;
  final bool isActive;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isActive ? onTap : null,
      child: Container(
        height: size.height(context, .06),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary : AppColors.primary.withOpacity(.6),
          borderRadius: size.borderRadius(context, .02),
        ),
        child: icon == null
            ? Text(
                label,
                style: AppStyles.bodyL.copyWith(
                  color: isActive ? Colors.white : Colors.white.withOpacity(.3),
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
                      color: isActive ? Colors.white : Colors.white.withOpacity(.3),
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
          color: isActive ? AppColors.primary : AppColors.primary.withOpacity(.6),
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
