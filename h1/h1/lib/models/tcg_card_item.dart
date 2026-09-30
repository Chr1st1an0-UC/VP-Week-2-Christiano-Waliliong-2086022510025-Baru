enum TcgCategory { all, pokemon, }

class TcgCardItem {
  final String id;
  final String name;
  final String set;
  final double estimatedValue;
  final String imageUrl;
  final bool isFavorite;

  const TcgCardItem({
    required this.id,
    required this.name,
    required this.set,
    required this.estimatedValue,
    this.imageUrl = '',
    this.isFavorite = false,
  });

  TcgCardItem copyWith({bool? isFavorite}) {
    return TcgCardItem(
      id: id,
      name: name,
      set: set,
      estimatedValue: estimatedValue,
      imageUrl: imageUrl,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}