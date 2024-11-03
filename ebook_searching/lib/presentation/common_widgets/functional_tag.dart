import 'package:ebook_searching/presentation/themes/themes.dart';
import 'package:flutter/material.dart';

class FunctionalTag extends StatelessWidget {
  final IconData leadingIcon;
  final String label;
  final void Function()? onTap;

  const FunctionalTag({
    super.key,
    required this.leadingIcon,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          children: [
            Icon(leadingIcon, size: 24,),
            const SizedBox(height: 10,),
          ],
        ),
        const SizedBox(width: 15),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 15,),
            SizedBox(
              width: MediaQuery.of(context).size.width - 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(label, style: AppTextStyles.body2Medium,),
                  const Icon(Icons.arrow_forward_ios, size: 16,),
                ],
              ),
            ),
            const SizedBox(height: 15,),
            SizedBox(
              height: 10,
              width: MediaQuery.of(context).size.width - 100,
              child: Divider(color: AppColors.textSecondary.withOpacity(0.3), thickness: 1,)
            ),
          ],
        )
      ],
    );
  }
}