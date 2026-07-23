import 'package:flutter/material.dart';
import 'package:yemen_law/config/app_theme.dart';

/// شاشة الترحيب - Splash Screen
/// يعرض شعار التطبيق ومؤشر التحميل
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _navigateToHome();
  }

  void _setupAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic),
    );

    _animationController.forward();
  }

  void _navigateToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacementNamed('/home');
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.matteBlack,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // شعار ميزان العدالة - Scale Animation
              ScaleTransition(
                scale: _scaleAnimation,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.softGold,
                        width: 2,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        '⚖️',
                        style: TextStyle(fontSize: 80),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // العنوان الرئيسي - Main Title
              FadeTransition(
                opacity: _fadeAnimation,
                child: Column(
                  children: [
                    Text(
                      'موسوعة اليمن القانونية',
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context).textTheme.displayMedium?.copyWith(
                            color: AppColors.softGold,
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Yemen Legal Encyclopedia',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.antiqueBronze,
                            fontSize: 14,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 60),

              // مؤشر التحميل - Loading Progress Indicator
              FadeTransition(
                opacity: _fadeAnimation,
                child: Column(
                  children: [
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.antiqueBronze,
                        ),
                        strokeWidth: 3,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'جاري التحميل...',
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.softGold,
                          ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 80),

              // بيانات المحامي في الأسفل - Lawyer Info
              FadeTransition(
                opacity: _fadeAnimation,
                child: Column(
                  children: [
                    Text(
                      'أسامة خالد المقبلي',
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.antiqueBronze,
                            fontWeight: FontWeight.w600,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'محاماة • استشارات قانونية • تحرير عقود',
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.borderGray,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '☎️ 777001515',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.softGold,
                            fontWeight: FontWeight.w500,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // حقوق الطبع - Copyright
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  '© جميع الحقوق محفوظة 2024',
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.borderGray,
                        fontSize: 11,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
