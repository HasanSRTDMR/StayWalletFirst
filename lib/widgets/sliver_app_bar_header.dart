import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

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
