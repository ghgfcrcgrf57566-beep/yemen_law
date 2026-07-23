import 'package:flutter/material.dart';
import 'package:yemen_law/config/app_theme.dart';
import 'package:yemen_law/widgets/menu_card.dart';

/// الواجهة الرئيسية - Home Screen
/// تعرض القائمة الرئيسية بالأقسام المختلفة
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showExitDialog = false;
  String _selectedThemeMode = 'auto'; // 'light', 'dark', 'auto'

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _showExitConfirmationDialog();
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.matteBlack,
        appBar: AppBar(
          title: const Text('موسوعة اليمن القانونية'),
          centerTitle: true,
          elevation: 0,
          actions: [
            // أيقونة الملاحظات والاقتراحات
            IconButton(
              icon: const Icon(Icons.note_add_outlined),
              tooltip: 'ملاحظات واقتراحات',
              onPressed: () {
                Navigator.pushNamed(context, '/feedback');
              },
            ),
            // أيقونة الإعدادات
            IconButton(
              icon: const Icon(Icons.settings_outlined),
              tooltip: 'الإعدادات',
              onPressed: () {
                _showSettingsSheet();
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // شريط البحث الذكي
                _buildSearchBar(),
                const SizedBox(height: 24),

                // القسم الأول: القوانين اليمنية
                MenuCard(
                  title: 'القوانين اليمنية',
                  icon: '⚖️',
                  description: 'تصفح جميع القوانين اليمنية حسب المجال',
                  onTap: () {
                    Navigator.pushNamed(context, '/laws');
                  },
                ),
                const SizedBox(height: 16),

                // القسم الثاني: المراجع القانونية
                MenuCard(
                  title: 'المراجع القانونية',
                  icon: '📚',
                  description: 'كتب وشروحات وأبحاث قانونية متخصصة',
                  onTap: () {
                    Navigator.pushNamed(context, '/references');
                  },
                ),
                const SizedBox(height: 16),

                // القسم الثالث: أحكام المحكمة العليا
                MenuCard(
                  title: 'أحكام المحكمة العليا',
                  icon: '🏛️',
                  description: 'أحكام مدنية وتجارية وجزائية',
                  onTap: () {
                    Navigator.pushNamed(context, '/judgments');
                  },
                ),
                const SizedBox(height: 16),

                // القسم الرابع: المذكرات والنماذج
                MenuCard(
                  title: 'المذكرات والنماذج القانونية',
                  icon: '📋',
                  description: 'صحائف دعاوى وعقود ونماذج جاهزة',
                  onTap: () {
                    Navigator.pushNamed(context, '/templates');
                  },
                ),
                const SizedBox(height: 16),

                // القسم الخامس: المفضلة
                MenuCard(
                  title: 'المفضلة',
                  icon: '⭐',
                  description: 'وصول سريع للمحفوظات',
                  onTap: () {
                    Navigator.pushNamed(context, '/favorites');
                  },
                ),
                const SizedBox(height: 16),

                // القسم السادس: التواصل والاستشارات
                MenuCard(
                  title: 'التواصل والاستشارات',
                  icon: '📞',
                  description: 'تواصل مع أسامة خالد المقبلي',
                  onTap: () {
                    Navigator.pushNamed(context, '/contact');
                  },
                ),

                const SizedBox(height: 32),

                // معلومات التطبيق والحقوق
                _buildAppInfo(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// شريط البحث الذكي
  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.antiqueBronze,
          width: 1.5,
        ),
      ),
      child: TextField(
        textDirection: TextDirection.rtl,
        style: Theme.of(context).textTheme.bodyMedium,
        decoration: InputDecoration(
          hintText: 'ابحث عن قانون أو مادة...',
          hintTextDirection: TextDirection.rtl,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          prefixIcon: const Icon(Icons.search),
          suffixIcon: const Icon(Icons.clear),
        ),
        onTap: () {
          Navigator.pushNamed(context, '/search');
        },
      ),
    );
  }

  /// معلومات التطبيق
  Widget _buildAppInfo() {
    return Column(
      children: [
        Divider(color: AppColors.borderGray, height: 32),
        Text(
          'أسامة خالد المقبلي',
          textDirection: TextDirection.rtl,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.softGold,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          'محاماة • استشارات قانونية • تحرير عقود',
          textDirection: TextDirection.rtl,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            // التواصل عبر الهاتف
            // launchUrl(Uri(scheme: 'tel', path: '777001515'));
          },
          child: Text(
            '☎️ 777001515',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.softGold,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'هذا البرنامج هو عبارة عن مجهود شخصي وهو إهداء إلى روح من هداني إلى طلب العلم\nوالدي رحمة الله عليه',
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.borderGray,
                height: 1.6,
              ),
        ),
        const SizedBox(height: 16),
        Text(
          '© جميع الحقوق محفوظة 2024\nموسوعة اليمن القانونية',
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.borderGray,
                fontSize: 10,
              ),
        ),
      ],
    );
  }

  /// نافذة تأكيد الخروج
  void _showExitConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.darkCharcoal,
        title: Text(
          'تأكيد الخروج',
          textDirection: TextDirection.rtl,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        content: Text(
          'هل تريد حقاً الخروج من التطبيق؟',
          textDirection: TextDirection.rtl,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'إلغاء',
              style: TextStyle(color: AppColors.softGold),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              SystemNavigator.pop();
            },
            child: Text(
              'نعم، خروج',
              style: TextStyle(color: AppColors.errorRed),
            ),
          ),
        ],
      ),
    );
  }

  /// نافذة الإعدادات
  void _showSettingsSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.darkCharcoal,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        side: BorderSide(color: AppColors.antiqueBronze, width: 1),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'الإعدادات',
              textDirection: TextDirection.rtl,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),

            // وضع الظلام
            ListTile(
              title: Text(
                'وضع الظلام',
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              trailing: PopupMenuButton<String>(
                onSelected: (value) {
                  setState(() => _selectedThemeMode = value);
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'auto',
                    child: Text('تلقائي'),
                  ),
                  const PopupMenuItem(
                    value: 'dark',
                    child: Text('الوضع الليلي'),
                  ),
                  const PopupMenuItem(
                    value: 'light',
                    child: Text('الوضع النهاري'),
                  ),
                ],
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.antiqueBronze),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    _getThemeModeName(),
                    style: const TextStyle(color: AppColors.softGold),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // عن التطبيق
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: Text(
                'عن التطبيق',
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              onTap: () {
                Navigator.pop(context);
                _showAboutDialog();
              },
            ),
          ],
        ),
      ),
    );
  }

  /// نافذة عن التطبيق
  void _showAboutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.darkCharcoal,
        title: Text(
          'عن موسوعة اليمن القانونية',
          textDirection: TextDirection.rtl,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        content: SingleChildScrollView(
          child: Text(
            'تطبيق متخصص لتوفير جميع القوانين اليمنية وأحكام المحكمة العليا والمراجع القانونية في مكان واحد.\n\nالإصدار: 1.0.0\n\nمطور بعناية من قبل: أسامة خالد المقبلي',
            textDirection: TextDirection.rtl,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'حسناً',
              style: TextStyle(color: AppColors.softGold),
            ),
          ),
        ],
      ),
    );
  }

  String _getThemeModeName() {
    switch (_selectedThemeMode) {
      case 'dark':
        return 'الوضع الليلي';
      case 'light':
        return 'الوضع النهاري';
      default:
        return 'تلقائي';
    }
  }
}
