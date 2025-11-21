import 'package:chefie/theme/app_theme.dart';
import 'package:chefie/views/receitas/receita_details.dart';
import 'package:chefie/widgets/image.dart';
import 'package:flutter/material.dart';
import 'package:chefie/models/receita.dart';

class ReceitaPreview extends StatefulWidget {
  const ReceitaPreview({
    super.key,
    required this.receita
  });

  final ReceitaModel receita;

  @override
  State<ReceitaPreview> createState() => _ReceitaPreviewState();
}

class _ReceitaPreviewState extends State<ReceitaPreview> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (context) => ReceitaDetailsPage(receita: widget.receita)
        ),
      ),
      child: Container(
        width: 250,
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChefieImage(
              image: widget.receita.image,
              color: widget.receita.color,
            ),
            SizedBox(height: 5),
            Text(
              widget.receita.name,
              style: TextStyle(
                color: AppColors.textOf(context),
                fontSize: 16,
                fontWeight: FontWeight.w500
              )
            ),
            Text(
              "${widget.receita.estimatedTimeMin} min",
              style: TextStyle(
                color: AppColors.textSecondaryLight, 
                fontSize: 13,
                fontWeight: FontWeight.w400
              )
            )
          ],
        ),
      ),
    );
  }
}
