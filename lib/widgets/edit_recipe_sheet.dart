import 'package:chefie/controllers/favorite_recipe_controller.dart';
import 'package:chefie/models/favorite_recipe.dart';
import 'package:chefie/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class EditRecipeSheet extends ConsumerStatefulWidget {
  final FavoriteRecipe recipe;

  const EditRecipeSheet({super.key, required this.recipe});

  @override
  ConsumerState<EditRecipeSheet> createState() => _EditRecipeSheetState();
}

class _EditRecipeSheetState extends ConsumerState<EditRecipeSheet> {
  late TextEditingController _notesController;
  int? _rating;
  DateTime? _lastCooked;

  @override
  void initState() {
    super.initState();
    _notesController = TextEditingController(text: widget.recipe.notes);
    _rating = widget.recipe.rating;
    _lastCooked = widget.recipe.lastCookedAt;
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Minhas Anotações",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textOf(context),
            ),
          ),
          const SizedBox(height: 20),
          
          Text("Avaliação", style: TextStyle(color: AppColors.textSecondaryOf(context), fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(5, (index) {
              return IconButton(
                onPressed: () => setState(() => _rating = index + 1),
                icon: Icon(
                  index < (_rating ?? 0) ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 32,
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              );
            }),
          ),
          const SizedBox(height: 20),

          Text("Último Preparo", style: TextStyle(color: AppColors.textSecondaryOf(context), fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: _lastCooked ?? DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime.now(),
              );
              if (picked != null) setState(() => _lastCooked = picked);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.borderOf(context)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(Icons.calendar_today, size: 18, color: AppColors.primary),
                  const SizedBox(width: 10),
                  Text(
                    _lastCooked != null
                        ? DateFormat('dd ' 'MMMM' ' yyyy', 'pt_BR').format(_lastCooked!)
                        : "Marcar data de hoje",
                    style: TextStyle(color: AppColors.textOf(context)),
                  ),
                  if (_lastCooked == null) ...[
                    const Spacer(),
                    TextButton(
                      onPressed: () => setState(() => _lastCooked = DateTime.now()),
                      child: const Text("Hoje"),
                    )
                  ]
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          Text("Notas Pessoais", style: TextStyle(color: AppColors.textSecondaryOf(context), fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          TextField(
            controller: _notesController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: "Dicas, substituições ou observações...",
              hintStyle: TextStyle(color: AppColors.textSecondaryOf(context).withValues(alpha: 0.5)),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: AppColors.backgroundOf(context),
            ),
          ),
          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () async {
                await ref.read(favoriteControllerProvider.notifier).updateFavorite(
                  id: widget.recipe.id,
                  notes: _notesController.text,
                  rating: _rating,
                  lastCookedAt: _lastCooked,
                );
                if (context.mounted) Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text("Salvar Alterações", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}