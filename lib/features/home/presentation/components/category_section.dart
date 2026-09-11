// import 'package:davai_store/core/data/mock/category_mock_data.dart';
// import 'package:davai_store/features/home/presentation/components/category_widget.dart';
// import 'package:flutter/material.dart';

// class CategorySection extends StatefulWidget {
//   const CategorySection({super.key});

//   @override
//   State<CategorySection> createState() => _CategorySectionState();
// }

// class _CategorySectionState extends State<CategorySection> {
//   int selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 40, // 🔥 أهم تغيير
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         padding: const EdgeInsets.symmetric(horizontal: 4),
//         physics: const BouncingScrollPhysics(),

//         itemCount: categories.length,

//         separatorBuilder: (_, _) => const SizedBox(width: 8),

//         itemBuilder: (context, index) {
//           final category = categories[index];

//           return AnimatedScale(
//             duration: const Duration(milliseconds: 200),
//             scale: selectedIndex == index ? 1.0 : 0.95,

//             child: CategoryItem(
//               title: category.title,
//               isSelected: selectedIndex == index,
//               onTap: () {
//                 setState(() {
//                   selectedIndex = index;
//                 });
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
