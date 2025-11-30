import 'package:carousel_slider/carousel_slider.dart';
import 'package:electrum/core/ext/color.dart';
import 'package:electrum/core/types/image_flutter.dart';
import 'package:electrum/core/ui/styles/style.dart';
import 'package:electrum/features/promotion/domain/entities/promotion.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PromotionCarousel extends StatelessWidget {
  final List<Promotion> promotions;
  final double? height;
  final VoidCallback? Function(Promotion)? onPromotionTap;

  const PromotionCarousel({
    super.key,
    required this.promotions,
    this.height,
    this.onPromotionTap,
  });

  @override
  Widget build(BuildContext context) {
    if (promotions.isEmpty) {
      return const SizedBox.shrink();
    }

    return CarouselSlider.builder(
      itemCount: promotions.length,
      itemBuilder: (context, index, realIndex) {
        final promotion = promotions[index];
        return PromotionCarouselItem(
          promotion: promotion,
          onTap: onPromotionTap != null
              ? () => onPromotionTap!(promotion)
              : null,
        );
      },
      options: CarouselOptions(
        height: height,
        viewportFraction: 1.0,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: false,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class PromotionCarouselItem extends StatelessWidget {
  final Promotion promotion;
  final VoidCallback? onTap;

  const PromotionCarouselItem({super.key, required this.promotion, this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: colors.onBackground.applyOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image(
              image: promotion.image.provider,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: colors.surfaceVariant,
                  child: Icon(
                    Icons.image_not_supported,
                    color: colors.onSurfaceMuted,
                    size: 48,
                  ),
                );
              },
            ),
            // Gradient overlay from bottom to top
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      colors.onBackground.applyOpacity(0.85),
                      colors.onBackground.applyOpacity(0.6),
                      colors.onBackground.applyOpacity(0.3),
                      Colors.transparent,
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      promotion.title,
                      style: textStyles.h3.bold.applyColor(colors.surface),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      promotion.description,
                      style: textStyles.p.applyColor(colors.surface),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 14,
                          color: colors.surface,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Valid until ${DateFormat('MMM dd, yyyy').format(promotion.validUntil)}',
                          style: textStyles.p.regular
                              .applyColor(colors.surface)
                              .copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
