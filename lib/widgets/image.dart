
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:chefie/theme/app_theme.dart';

class ChefieImage extends StatefulWidget {
  const ChefieImage({
    super.key,
    required this.image,
    this.color,
    this.height = 150,
    this.width = double.infinity,
  });

  final Image image;
  final Color? color;
  final double height;
  final double width;

  @override
  State<ChefieImage> createState() => _ChefieImageState();
}

class _ChefieImageState extends State<ChefieImage> {
  bool _imageLoaded = false; 

  @override
  void initState() {
    super.initState();

    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: widget.color ?? AppColors.borderOf(context),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Lottie loading animation
          if (!_imageLoaded)
            Center(
              child: Lottie.asset(
                'assets/lottie/loading.json',
                width: 120,
                height: 120,
                fit: BoxFit.contain,
              ),
            ),
          // Actual image
          Image(
            image: widget.image.image,
            fit: BoxFit.cover,
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              if (wasSynchronouslyLoaded) {
                _imageLoaded = true;
                return child;
              }
              if (frame != null) {
                // Image has loaded
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted) {
                    setState(() {
                      _imageLoaded = true;
                    });
                  }
                });
                return child;
              }
              // Still loading
              return const SizedBox.shrink();
            },
            errorBuilder: (context, error, stackTrace) {
              return Center(
                child: Icon(
                  Icons.error_outline,
                  color: AppColors.destructive,
                  size: 40,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}