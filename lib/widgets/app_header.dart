import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppHeader({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.showBack = false,
  });

  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool showBack;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null ? Text(title!) : null,
      leading: showBack
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).maybePop(),
            )
          : leading,
      actions: actions,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}

/// Centered title app bar with back button
class SliverAppBarHeader extends StatelessWidget {
  const SliverAppBarHeader({
    super.key,
    required this.title,
    this.onBack,
    this.actions,
  });

  final String title;
  final VoidCallback? onBack;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: AppColors.backgroundDark.withOpacity(0.8),
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: onBack ?? () => Navigator.of(context).maybePop(),
      ),
      title: Text(title),
      centerTitle: true,
      actions: actions ?? [],
    );
  }
}
