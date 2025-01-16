import 'package:flutter/material.dart';
import '../../data/modles/category_model.dart';
import 'category_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CategorisGrid extends StatelessWidget {
  final void Function(CategoryModel) onCategorySelected;

  const CategorisGrid({super.key, required this.onCategorySelected});
  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    
    List<CategoryModel> categories = [
      CategoryModel(
        color: const Color(0xFFC91C22),
        name:appLocalizations.sport,
        imageName: "ball",
        id: "sports",
      ),
      CategoryModel(
        color: const Color(0xFF003E90),
        name: appLocalizations.politics,
        imageName: "Politics",
        id: 'politics',
      ),
      CategoryModel(
        color: const Color(0xFFED1E79),
        name: appLocalizations.health,
        imageName: "health",
        id: 'health',
      ),
      CategoryModel(
        color: const Color(0xFFCF7E48),
        name: appLocalizations.business,
        imageName: "bussines",
        id: 'business',
      ),
      CategoryModel(
        color: const Color(0xFF4882CF),
        name: appLocalizations.environment,
        imageName: "environment",
        id: 'entertainment',
      ),
      CategoryModel(
        color: const Color(0xFFF2D352),
        name: appLocalizations.science,
        imageName: "science",
        id: 'science',
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: Text(
              appLocalizations.pickyourcategoryofinterest,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
              ),
              itemBuilder: (_, index) {
                final category = categories[index];
                return GestureDetector(
                  onTap: () => onCategorySelected(category),
                  child: CategoryItem(index: index, category: category),
                );
              },
              itemCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
