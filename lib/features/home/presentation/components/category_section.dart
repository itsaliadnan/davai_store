import 'package:davai_store/core/data/mock/category_mock_data.dart';
import 'package:davai_store/features/home/presentation/components/category_widget.dart';
import 'package:flutter/material.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({super.key});

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,

        itemBuilder: (context, index) {
          final category = categories[index];

          return CategoryItem(
            title: category.title,

            isSelected: selectedIndex == index,

            onTap: () {
              setState(() {
                selectedIndex = index;
              });

              // لاحقاً: filter products
            },
          );
        },
      ),
    );
  }
}
