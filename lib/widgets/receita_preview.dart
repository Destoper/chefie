import 'dart:math';

import 'package:chefie/models/recipe_details.dart'; 
import 'package:chefie/theme/app_theme.dart';
import 'package:chefie/views/receitas/receita_details.dart';
import 'package:chefie/widgets/image.dart';
import 'package:flutter/material.dart';
import 'package:chefie/modelviews/receita.dart';

class ReceitaPreview extends StatefulWidget {
  const ReceitaPreview({
    super.key,
    required this.receita,
    this.previewHeight,
    this.nameMaxLines = 2,
    this.previewWidth = double.infinity,
    this.showInfoIcons = false,
    this.showFavoriteButton = false,
    this.showMatchPercentage = false,
    this.showMissingIngredientCount = false,
  });

  final ReceitaModel receita;
  final int nameMaxLines;
  final double previewWidth;
  final double? previewHeight;
  final bool showInfoIcons;
  final bool showFavoriteButton;
  final bool showMatchPercentage;
  final bool showMissingIngredientCount;

  @override
  State<ReceitaPreview> createState() => _ReceitaPreviewState();
}

class _ReceitaPreviewState extends State<ReceitaPreview> {
  @override
  Widget build(BuildContext context) {
    int qtyAvailableAvailable = Random().nextInt(widget.receita.ingredients.length + 1);
    bool readyToPrepare = (qtyAvailableAvailable == widget.receita.ingredients.length);
    
    return GestureDetector(
      onTap: () {
        final extendedIngredients = widget.receita.ingredients.map((ing) {
          return ExtendedIngredient(
            id: Random().nextInt(10000),
            name: ing.nome,
            original: "${ing.quantidade}${ing.unidade.name} de ${ing.nome}",
          );
        }).toList();

        final detailsAdapter = RecipeDetails(
          id: 0,
          title: widget.receita.name,
          image: null,
          readyInMinutes: widget.receita.estimatedTimeMin,
          servings: widget.receita.portionSizePeople,
          instructions: widget.receita.instructions,
          extendedIngredients: extendedIngredients,
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReceitaDetailsPage(receita: detailsAdapter, enableCheckboxes: true),
          ),
        );
      },
      child: Container(
        height: widget.previewHeight,
        width: widget.previewWidth,
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ChefieImage(
                image: widget.receita.image,
                color: widget.receita.color,
                height: double.infinity,
              ),
            ),
            SizedBox(height: 5),
            Text(
              widget.receita.name,
              maxLines: widget.nameMaxLines,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.textOf(context),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 2,
                  children: [
                    if (widget.showInfoIcons)
                      Icon(Icons.timer_outlined, color: AppColors.textSecondaryLight, size: 15,),
                    Text(
                      "${widget.receita.estimatedTimeMin} min",
                      style: TextStyle(
                        color: AppColors.textSecondaryLight,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                if(widget.showMissingIngredientCount)
                  Text(
                    readyToPrepare? 
                      "Pronto p/ preparo!"
                      : "$qtyAvailableAvailable/${widget.receita.ingredients.length} ingredientes",
                    style: TextStyle(
                      color: readyToPrepare? Colors.green : AppColors.destructive,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  )
            ],)
          ],
        ),
      ),
    );
  }
}