import 'package:ebook_searching/presentation/themes/themes.dart';
import 'package:flutter/material.dart';

class LibraryCard extends StatelessWidget {
  final String libraryName;
  final String libraryCover;
  final bool isSelected;
  final VoidCallback onTap;

  const LibraryCard({
    super.key,
    required this.libraryName,
    required this.libraryCover,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: SizedBox(
            width: 180,
            height: 160,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(libraryCover),
                    fit: BoxFit.fill,
                    alignment: Alignment.center,
                  ),
                  border: Border.all(
                    color: isSelected ? AppColors.primary : Colors.transparent,
                    width: 3,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          libraryName,
            style: AppTextStyles.body2Semibold.copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}