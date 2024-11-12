import 'package:ebook_searching/presentation/styles/assets_link.dart';
import 'package:ebook_searching/presentation/themes/themes.dart';
import 'package:flutter/material.dart';

class LibraryCard extends StatelessWidget {
  final String libraryName;
  final String libraryCover;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const LibraryCard({
    super.key,
    required this.libraryName,
    required this.libraryCover,
    required this.isSelected,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          onLongPress: onLongPress,
          child: SizedBox(
            width: 180,
            height: 160,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.themeSecondary,
                  width: 3,
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: _buildImage(libraryCover),
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

  Widget _buildImage(String imageUrl) {
    if (imageUrl.startsWith('http')) {
      return Image.network(
        imageUrl,
        fit: BoxFit.fitWidth,
        errorBuilder: (context, error, stackTrace) {
          return _buildDefaultImage();
        },
      );
    } else {
      return _buildAssetOrDefaultImage(imageUrl);
    }
  }

  Widget _buildAssetOrDefaultImage(String imageUrl) {
    if (imageUrl.startsWith('assets/')) {
      return Image.asset(
        imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return _buildDefaultImage();
        },
      );
    } else {
      return _buildDefaultImage();
    }
  }

  Widget _buildDefaultImage() {
    return Image.asset(
      defaultBookCover,
      fit: BoxFit.cover,
    );
  }
}