part of '../home_page.dart';

class _PromotionSection extends StatelessWidget {
  const _PromotionSection();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height =
        (mediaQuery.size.height -
            mediaQuery.padding.top -
            mediaQuery.padding.bottom) *
        .9;
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: height),
      child: const PromotionStatefulCarousel(),
    );
  }
}
