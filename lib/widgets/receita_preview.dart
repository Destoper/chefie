import 'package:flutter/material.dart';
import 'package:chefie/models/receita.dart';

class ReceitaPreview extends StatelessWidget {
  const ReceitaPreview({
    super.key,
    required this.receita
  });

  final ReceitaModel receita;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: receita.color,
            ),
            child: Image(
              image: receita.image.image,
              fit: BoxFit.cover
            )
          ),
          Text(
            receita.name,
            style: TextStyle(
              color: Colors.black, 
              fontSize: 16,
              fontWeight: FontWeight.w700
            )
          ),
          Text(
            "${receita.estimatedTimeMin} min",
            style: TextStyle(
              color: Colors.grey.shade600, 
              fontSize: 13,
              fontWeight: FontWeight.w400
            ))
        ],
      ),
    );
  }
}