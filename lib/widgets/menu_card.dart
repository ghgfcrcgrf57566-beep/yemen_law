import 'package:flutter/material.dart';
import 'package:yemen_law/config/app_theme.dart';

/// مكون بطاقة القائمة - Menu Card Widget
/// يستخدم في القائمة الرئيسية لعرض الأقسام المختلفة
class MenuCard extends StatefulWidget {
  final String title;
  final String icon;
  final String description;
  final VoidCallback onTap;
  final bool isComingSoon;

  const MenuCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.description,
    required this.onTap,
    this.isComingSoon = false,
  }) : super(key: key);

  @override
  State<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _hoverController;
  late Animation<double> _hoverAnimation;

  @override
  void initState() {
    super.initState();
    _hoverController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _hoverAnimation =
        Tween<double>(begin: 1.0, end: 1.05).animate(_hoverController);
  }

  @override
  void dispose() {
    _hoverController.dispose();
    super.dispose();
  }

  void _onHover(bool isHovering) {
    if (isHovering) {
      _hoverController.forward();
    } else {
      _hoverController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _hoverAnimation,
      child: MouseRegion(
        onEnter: (_) => _onHover(true),
        onExit: (_) => _onHover(false),
        child: GestureDetector(
          onTap: widget.isComingSoon ? null : widget.onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.antiqueBronze,
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.antiqueBronze.withOpacity(0.2),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Material(
              color: AppColors.darkCharcoal,
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // صف العنوان والأيقونة
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // الأيقونة
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.antiqueBronze,
                              width: 1.5,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              widget.icon,
                              style: const TextStyle(fontSize: 28),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        // العنوان
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.title,
                                textDirection: TextDirection.rtl,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      color: AppColors.softGold,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              if (widget.isComingSoon)
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.warningOrange
                                          .withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      'قريباً',
                                      textDirection: TextDirection.rtl,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            color: AppColors.warningOrange,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        // أيقونة الأسهم
                        if (!widget.isComingSoon)
                          Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.antiqueBronze,
                            size: 18,
                          ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // الوصف
                    Text(
                      widget.description,
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.lightGray,
                            height: 1.5,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
