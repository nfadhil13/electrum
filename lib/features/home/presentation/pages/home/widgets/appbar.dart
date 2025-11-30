part of '../home_page.dart';

class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;

    return BlocProvider(
      create: (context) => getIt<LogoutCubit>(),
      child: AppBar(
        backgroundColor: colors.surface,
        elevation: 5,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const AppIcon(size: 40),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Electrum Bikes',
                  style: textStyles.h4.bold.applyColor(colors.onSurface),
                ),
                Text(
                  'Electric Mobility',
                  style: textStyles.p.regular
                      .applyColor(colors.onSurfaceMuted)
                      .copyWith(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        actions: [
          BlocListener<LogoutCubit, LogoutState>(
            listener: (context, state) {
              if (state is LogoutSuccess) {
                context.go(AppRoutes.login);
              }
            },
            child: BlocBuilder<LogoutCubit, LogoutState>(
              builder: (context, state) {
                return TextButton.icon(
                  onPressed: state.isLoading
                      ? null
                      : () => context.read<LogoutCubit>().logout(),
                  icon: Icon(Icons.logout, size: 16, color: colors.onSurface),
                  label: Text(
                    'Logout',
                    style: textStyles.p
                        .applyColor(colors.onSurface)
                        .copyWith(fontSize: 14),
                  ),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
