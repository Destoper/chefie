class Unidade{
  final String name;

  Unidade({
    required this.name
  });

  static List<Unidade> getUnidades(){
    return [
      Unidade(name: 'un'),
      Unidade(name: 'g'),
      Unidade(name: 'Kg'),
      Unidade(name: 'L'),
      Unidade(name: 'ml'),
      Unidade(name: 'xícara'),
      Unidade(name: 'colher'),
    ];
  } 
}