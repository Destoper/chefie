import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chefie/models/recipe_details.dart';
import 'package:chefie/theme/app_theme.dart';
import 'package:chefie/widgets/text.dart';
import 'package:chefie/controllers/favorite_recipe_controller.dart';

class ReceitaDetailsPage extends ConsumerWidget {
  final RecipeDetails receita;
  final Set<String> usedIngredients;
  final bool enableCheckboxes; 

  const ReceitaDetailsPage({
    super.key,
    required this.receita,
    this.usedIngredients = const {},
    this.enableCheckboxes = true, 
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavoriteAsync = ref.watch(isFavoriteProvider(receita.id));

    return Scaffold(
      backgroundColor: AppColors.backgroundOf(context),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          isFavoriteAsync.when(
            data: (isFavorite) => IconButton(
              onPressed: () async {
                final wasAdded = await ref
                    .read(favoriteControllerProvider.notifier)
                    .toggle(receita);

                if (context.mounted) {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(wasAdded
                          ? 'Receita adicionada aos favoritos!'
                          : 'Receita removida dos favoritos.'),
                      duration: const Duration(seconds: 2),
                      backgroundColor: wasAdded ? Colors.green : Colors.red,
                    ),
                  );
                }
              },
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : null,
              ),
            ),
            loading: () => const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
            error: (_, __) => const Icon(Icons.error_outline),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        shrinkWrap: false,
        children: [
          Container(
            width: double.infinity,
            height: 250,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(25.0)),
              color: AppColors.primary.withValues(alpha: 0.1),
            ),
            child: receita.image != null && receita.image!.isNotEmpty
                ? Image.network(
                    'https://images.weserv.nl/?url=${Uri.encodeComponent(receita.image!)}',
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Center(
                      child: Icon(Icons.restaurant,
                          size: 64, color: AppColors.textOf(context).withValues(alpha: 0.2)),
                    ),
                  )
                : Center(
                    child: Icon(Icons.restaurant,
                        size: 64, color: AppColors.textOf(context).withValues(alpha: 0.2)),
                  ),
          ),
          const SizedBox(height: 20),
          
          Text(
            receita.title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textOf(context),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ReceitaInfoItem(
                text: "${receita.readyInMinutes} min",
                icon: Icons.access_time,
              ),
              ReceitaInfoItem(
                text: "${receita.servings} pessoas",
                icon: Icons.people_alt_outlined,
              ),
              ReceitaInfoItem(
                text: "${receita.extendedIngredients.length} itens",
                icon: Icons.kitchen_outlined,
              ),
            ],
          ),
          Divider(color: AppColors.borderOf(context), height: 32),
        
          TextLabel(
              text: "Ingredientes", fontSize: 20, fontWeight: FontWeight.w600),
          const SizedBox(height: 12),
          Column(
            children: [
              for (var ingredient in receita.extendedIngredients)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: IngredienteItem(
                    ingredient: ingredient.original,
                    isOwned: _checkIfOwned(ingredient.name),
                    enableCheckbox: enableCheckboxes, 
                  ),
                ),
            ],
          ),
          
          Divider(color: AppColors.borderOf(context), height: 32),
          
          TextLabel(
              text: "Modo de Preparo",
              fontSize: 20,
              fontWeight: FontWeight.w600),
          const SizedBox(height: 12),
          if (receita.instructions != null && receita.instructions!.isNotEmpty)
            _buildInstructions(receita.instructions!, context)
          else
            Text(
              'Instruções não disponíveis',
              style: TextStyle(
                color: AppColors.textOf(context).withValues(alpha: 0.6),
                fontStyle: FontStyle.italic,
              ),
            ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  bool _checkIfOwned(String ingredientName) {
    if (usedIngredients.isEmpty) return false;
    final lowerName = ingredientName.toLowerCase();
    return usedIngredients.any((owned) => 
      lowerName.contains(owned) || owned.contains(lowerName)
    );
  }

  Widget _buildInstructions(String instructions, BuildContext context) {
    final cleanInstructions = instructions
        .replaceAll(RegExp(r'<[^>]*>'), '\n')
        .replaceAll(RegExp(r'\n\s*\n'), '\n\n')
        .trim();

    return Text(
      cleanInstructions,
      style: TextStyle(
        fontSize: 16,
        height: 1.5,
        fontWeight: FontWeight.w400,
        color: AppColors.textOf(context),
      ),
    );
  }
}

class ReceitaInfoItem extends StatelessWidget {
  const ReceitaInfoItem({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(icon, color: AppColors.primary, size: 24),
        ),
        const SizedBox(height: 8),
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: AppColors.textSecondaryOf(context),
          ),
        ),
      ],
    );
  }
}

class IngredienteItem extends StatefulWidget {
  const IngredienteItem({
    super.key,
    required this.ingredient,
    this.isOwned = false,
    this.enableCheckbox = true,
  });

  final String ingredient;
  final bool isOwned;
  final bool enableCheckbox;

  @override
  State<IngredienteItem> createState() => _IngredienteItemState();
}

class _IngredienteItemState extends State<IngredienteItem> {
  late bool _checked;

  @override
  void initState() {
    super.initState();
    _checked = widget.isOwned;
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enableCheckbox) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.surfaceOf(context),
          border: Border.all(color: AppColors.borderOf(context)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: widget.isOwned ? AppColors.primary : AppColors.textSecondaryOf(context).withValues(alpha: 0.3),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                widget.ingredient,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: widget.isOwned ? FontWeight.w600 : FontWeight.w400,
                  color: AppColors.textOf(context),
                ),
              ),
            ),
            if (widget.isOwned)
              Icon(Icons.check, size: 16, color: AppColors.primary),
          ],
        ),
      );
    }

    return InkWell(
      onTap: () {
        setState(() => _checked = !_checked);
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: _checked 
              ? AppColors.primary.withValues(alpha: 0.05)
              : AppColors.surfaceOf(context),
          border: Border.all(
            color: _checked 
                ? AppColors.primary.withValues(alpha: 0.3)
                : AppColors.borderOf(context),
          ),
        ),
        child: Row(
          children: [
            Checkbox(
              value: _checked,
              activeColor: AppColors.primary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              onChanged: (newValue) {
                setState(() => _checked = newValue ?? false);
              },
            ),
            Expanded(
              child: Text(
                widget.ingredient,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: _checked ? FontWeight.w500 : FontWeight.w400,
                  color: _checked ? AppColors.primary : AppColors.textOf(context),
                  decoration: _checked ? TextDecoration.lineThrough : null,
                  decorationColor: AppColors.primary.withValues(alpha: 0.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}