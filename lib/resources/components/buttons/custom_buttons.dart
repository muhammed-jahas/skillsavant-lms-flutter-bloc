import 'package:flutter/material.dart';
import 'package:skillsavant/resources/colors/app_colors.dart';

class LoadingButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? buttonFunction;
  final bool isLoading;
  const LoadingButton({
    super.key, 
    required this.buttonText,
    this.buttonFunction,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
      ),
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: buttonFunction,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(AppColors.secondaryColor),
          shape: MaterialStateProperty.all(
            const BeveledRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: isLoading
                  ? Transform.scale(
                      scale: .7,
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      buttonText,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
