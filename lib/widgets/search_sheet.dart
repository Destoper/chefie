import 'package:chefie/controllers/user_ingredient_controller.dart';
import 'package:chefie/theme/app_theme.dart';
import 'package:chefie/widgets/text.dart';
import 'package:chefie/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchSheet extends ConsumerStatefulWidget {
  final List<String> initiallySelectedIngredients;

  const SearchSheet({
    super.key,
    required this.initiallySelectedIngredients,
  });

  @override
  ConsumerState<SearchSheet> createState() =>
      _SearchSheetState();
}

class _SearchSheetState extends ConsumerState<SearchSheet> {
  late Set<String> _selectedIngredients;

  @override
  void initState() {
    super.initState();
    _selectedIngredients = widget.initiallySelectedIngredients.toSet();
  }

  void _toggleIngredient(String nameEn, bool selected) {
    setState(() {
      if (selected) {
        _selectedIngredients.add(nameEn);
      } else {
        _selectedIngredients.remove(nameEn);
      }
    });
  }

  void _selectAll(List<String> allNames) {
    setState(() {
      _selectedIngredients.addAll(allNames);
    });
  }

  void _deselectAll() {
    setState(() {
      _selectedIngredients.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final userIngredientsAsync = ref.watch(userIngredientControllerProvider);

    ref.listen(userIngredientControllerProvider, (prev, next) {
      if (next.hasValue && next.value != null) {
        final validNames = next.value!
            .map((i) => i.globalIngredient?.nameEn)
            .whereType<String>()
            .toSet();
            
        final newSelection = _selectedIngredients.intersection(validNames);
        
        if (newSelection.length != _selectedIngredients.length) {
          setState(() {
            _selectedIngredients = newSelection;
          });
        }
      }
    });

    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: BoxDecoration(
        color: AppColors.backgroundOf(context),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextLabel(
                  text: "Filtrar Ingredientes",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                TextButton(
                  onPressed: () {
                    if (_selectedIngredients.isNotEmpty) {
                      _deselectAll();
                    } else {
                      userIngredientsAsync.whenData((ingredients) {
                        final all = ingredients
                            .where((i) => i.globalIngredient?.nameEn != null)
                            .map((i) => i.globalIngredient!.nameEn!)
                            .toList();
                        _selectAll(all);
                      });
                    }
                  },
                  child: Text(
                    _selectedIngredients.isNotEmpty ? "Limpar" : "Todos",
                    style: TextStyle(color: AppColors.primary),
                  ),
                )
              ],
            ),
          ),

          const Divider(height: 1),

          Expanded(
            child: userIngredientsAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (_, __) => const Center(child: Text("Erro ao carregar ingredientes")),
              data: (ingredients) {
                final validIngredients = ingredients
                    .where((i) => i.globalIngredient?.nameEn != null)
                    .toList();

                if (validIngredients.isEmpty) {
                  return const Center(
                    child: Text("Você não possui ingredientes cadastrados."),
                  );
                }

                return ListView.separated(
                  padding: const EdgeInsets.all(20),
                  itemCount: validIngredients.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final item = validIngredients[index];
                    
                    final nameEn = item.globalIngredient!.nameEn!;
                    final displayName = item.globalIngredient?.namePt ?? nameEn; 
                    
                    final isSelected = _selectedIngredients.contains(nameEn);

                    return InkWell(
                      onTap: () => _toggleIngredient(nameEn, !isSelected),
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.primary.withValues(alpha: 0.1)
                              : AppColors.surfaceOf(context),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.borderOf(context),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.restaurant_menu, 
                              color: isSelected ? AppColors.primary : Colors.grey,
                              size: 20,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                displayName,
                                style: TextStyle(
                                  fontWeight: isSelected
                                      ? FontWeight.w600
                                      : FontWeight.normal,
                                  color: isSelected
                                      ? AppColors.primary
                                      : AppColors.textOf(context),
                                ),
                              ),
                            ),
                            if (isSelected)
                              Icon(Icons.check_circle,
                                  color: AppColors.primary, size: 20)
                            else
                              Icon(Icons.circle_outlined,
                                  color: Colors.grey[400], size: 20),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: ButtonRounded(
                  text: "Buscar Receitas (${_selectedIngredients.length})",
                  onPressed: () {
                    final currentIngredients = ref.read(userIngredientControllerProvider).valueOrNull ?? [];
                    final validNames = currentIngredients
                        .map((i) => i.globalIngredient?.nameEn)
                        .whereType<String>()
                        .toSet();

                    final sanitizedSelection = _selectedIngredients
                        .where((name) => validNames.contains(name))
                        .toList();

                    Navigator.pop(context, sanitizedSelection);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}