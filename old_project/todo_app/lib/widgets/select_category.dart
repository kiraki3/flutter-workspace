import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/providers/providers.dart';
import 'package:todo_app/utils/utils.dart';
import 'package:todo_app/widgets/widgets.dart';

class SelectCategory extends ConsumerWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<TaskCategories> categories = TaskCategories.values.toList();
    final selectedCategory = ref.watch(categoryProvider);

    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Text("Category", style: context.textTheme.titleLarge),
          const Gap(10),
          Expanded(
              child: ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    final category = categories[index];
                    return InkWell(
                      onTap: () => _selectCategory(context, ref, category),
                      borderRadius: BorderRadius.circular(30),
                      child: CircleContainer(
                        color: category.color.withOpacity(0.3),
                        child: Icon(
                          category.icon,
                          color: category == selectedCategory
                              ? category.color.withOpacity(1.0)
                              : category.color.withOpacity(0.3),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (ctx, index) => const Gap(8),
                  itemCount: categories.length))
        ],
      ),
    );
  }
}

void _selectCategory(
    BuildContext context, WidgetRef ref, TaskCategories category) {
  ref.read(categoryProvider.notifier).state = category;
}
