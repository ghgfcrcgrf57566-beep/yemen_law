import 'package:flutter/material.dart';
import 'package:yemen_law/config/app_theme.dart';

/// شاشة البحث الذكي - Smart Search Screen
/// يدعم البحث بالقانون والمادة والكلمات الدقيقة والعبارات المركبة
class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _searchController;
  List<SearchResult> _searchResults = [];
  bool _isSearching = false;
  String _selectedCategory = 'الكل';

  final List<String> _categories = ['الكل', 'القوانين', 'المواد', 'الأحكام'];

  final List<SearchResult> _mockResults = [
    SearchResult(
      lawName: 'قانون الأحوال الشخصية',
      articleNumber: '45',
      articleTitle: 'شروط الزواج',
      excerpt: 'يشترط لصحة الزواج الرضا والولي والشهود...',
      category: 'القوانين',
    ),
    SearchResult(
      lawName: 'قانون المعاملات المدنية',
      articleNumber: '120',
      articleTitle: 'عقد البيع',
      excerpt: 'عقد البيع هو اتفاق على نقل الملكية مقابل ثمن...',
      category: 'القوانين',
    ),
    SearchResult(
      lawName: 'قانون العمل',
      articleNumber: '8',
      articleTitle: 'حقوق العامل',
      excerpt: 'للعامل الحق في الأجر والعطل والتأمين الاجتماعي...',
      category: 'القوانين',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch(String query) {
    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
        _isSearching = false;
      });
      return;
    }

    setState(() => _isSearching = true);

    // محاكاة البحث - في التطبيق الفعلي ستكون هناك عملية بحث فعلية
    Future.delayed(const Duration(milliseconds: 500), () {
      final results = _mockResults
          .where((result) =>
              (result.lawName.contains(query) ||
                  result.articleTitle.contains(query) ||
                  result.excerpt.contains(query) ||
                  result.articleNumber.contains(query)) &&
              (_selectedCategory == 'الكل' || result.category == _selectedCategory))
          .toList();

      setState(() {
        _searchResults = results;
        _isSearching = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.matteBlack,
      appBar: AppBar(
        title: const Text('البحث الذكي'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // شريط البحث
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              textDirection: TextDirection.rtl,
              style: Theme.of(context).textTheme.bodyMedium,
              onChanged: _performSearch,
              decoration: InputDecoration(
                hintText: 'ابحث عن قانون أو مادة أو كلمة...',
                hintTextDirection: TextDirection.rtl,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          _performSearch('');
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColors.antiqueBronze,
                  ),
                ),
                filled: true,
                fillColor: AppColors.darkCharcoal,
              ),
            ),
          ),

          // فلاتر التصنيفات
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final category = _categories[index];
                final isSelected = category == _selectedCategory;

                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() => _selectedCategory = category);
                      _performSearch(_searchController.text);
                    },
                    backgroundColor: AppColors.darkCharcoal,
                    selectedColor: AppColors.antiqueBronze,
                    labelStyle: TextStyle(
                      color: isSelected
                          ? AppColors.whiteText
                          : AppColors.softGold,
                    ),
                    side: BorderSide(
                      color: isSelected
                          ? AppColors.antiqueBronze
                          : AppColors.borderGray,
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 16),

          // نتائج البحث
          Expanded(
            child: _buildSearchResults(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults() {
    if (_searchController.text.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search,
              size: 64,
              color: AppColors.antiqueBronze.withOpacity(0.3),
            ),
            const SizedBox(height: 16),
            Text(
              'ابدأ بالبحث عن قانون أو مادة',
              textDirection: TextDirection.rtl,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.borderGray,
                  ),
            ),
          ],
        ),
      );
    }

    if (_isSearching) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                AppColors.antiqueBronze,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'جاري البحث...',
              textDirection: TextDirection.rtl,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      );
    }

    if (_searchResults.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 64,
              color: AppColors.antiqueBronze.withOpacity(0.3),
            ),
            const SizedBox(height: 16),
            Text(
              'لم يتم العثور على نتائج',
              textDirection: TextDirection.rtl,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.borderGray,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'جرب كلمات مختلفة أو تحقق من الكتابة',
              textDirection: TextDirection.rtl,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.borderGray,
                  ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: _searchResults.length,
      itemBuilder: (context, index) {
        final result = _searchResults[index];
        return _buildSearchResultCard(result);
      },
    );
  }

  Widget _buildSearchResultCard(SearchResult result) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: () {
          // الانتقال لصفحة المادة
          Navigator.pushNamed(
            context,
            '/article',
            arguments: {
              'lawName': result.lawName,
              'articleNumber': result.articleNumber,
            },
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.antiqueBronze,
              width: 1,
            ),
          ),
          child: Material(
            color: AppColors.darkCharcoal,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // رقم المادة والقانون
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'المادة ${result.articleNumber}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: AppColors.softGold,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              result.lawName,
                              textDirection: TextDirection.rtl,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: AppColors.antiqueBronze,
                                  ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.antiqueBronze.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          result.category,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColors.antiqueBronze,
                                fontSize: 10,
                              ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // عنوان المادة
                  Text(
                    result.articleTitle,
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: AppColors.whiteText,
                          fontWeight: FontWeight.w600,
                        ),
                  ),

                  const SizedBox(height: 8),

                  // مقتطف من النص
                  Text(
                    result.excerpt,
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.lightGray,
                          height: 1.4,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 12),

                  // زر اقرأ المزيد
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'اقرأ المزيد',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.softGold,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// نموذج نتيجة البحث
class SearchResult {
  final String lawName;
  final String articleNumber;
  final String articleTitle;
  final String excerpt;
  final String category;

  SearchResult({
    required this.lawName,
    required this.articleNumber,
    required this.articleTitle,
    required this.excerpt,
    required this.category,
  });
}
