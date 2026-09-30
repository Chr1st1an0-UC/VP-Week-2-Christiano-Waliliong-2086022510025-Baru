import 'package:flutter/material.dart';
import '../models/tcg_card_item.dart';
import '../widgets/vault_header_card.dart';
import '../widgets/vault_search_bar.dart';
import '../widgets/category_filter_chips.dart';
import '../widgets/card_grid_tile.dart';

class TcgVaultScreen extends StatefulWidget {
  const TcgVaultScreen({super.key});

  @override
  State<TcgVaultScreen> createState() => _TcgVaultScreenState();
}

class _TcgVaultScreenState extends State<TcgVaultScreen> {
  // HOISTED STATES
  String _searchQuery = '';
  TcgCategory _selectedCategory = TcgCategory.all;

  List<TcgCardItem> _cards = const [
    TcgCardItem(id: '1', name: 'Charizard Base Set', set: '1st Ed', estimatedValue: 4200.0, imageUrl: 'https://images.nightcafe.studio/ik-seo/jobs/7uVUoCAfyWdbToaeZu3v/7uVUoCAfyWdbToaeZu3v--1--b4wmb/charizard.jpg?tr=w-1600,c-at_max', isFavorite: true),
    TcgCardItem(id: '2', name: 'Black Lotus', set: 'Alpha', estimatedValue: 15000.0),
    TcgCardItem(id: '3', name: 'Blue-Eyes Dragon', set: 'LOB-001', estimatedValue: 1800.0),
    TcgCardItem(id: '4', name: 'Pikachu Illustrator', set: 'Promo', imageUrl: 'https://images.unsplash.com/photo-1613771404784-3a5686aa2be3?w=500', estimatedValue: 250000.0),
  ];

  // HANDLERS
  void _handleSearchChanged(String query) {
    setState(() => _searchQuery = query);
  }

  void _handleCategorySelected(TcgCategory category) {
    setState(() => _selectedCategory = category);
  }

  void _handleToggleFavorite(String id) {
    setState(() {
      _cards = _cards.map((card) {
        if (card.id == id) {
          return card.copyWith(isFavorite: !card.isFavorite);
        }
        return card;
      }).toList();
    });
  }

  // COMPUTED STATES
  double get _totalVaultValue =>
      _cards.fold(0, (sum, item) => sum + item.estimatedValue);

  List<TcgCardItem> get _filteredCards {
    return _cards.where((card) {
      return card.name.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('TCG Vault', style: TextStyle(color: Colors.black, fontSize: 18)),
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.grey[200], height: 1.0),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  VaultHeaderCard(
                    totalValue: _totalVaultValue,
                    totalCards: _cards.length,
                  ),
                  const SizedBox(height: 12),
                  VaultSearchBar(
                    searchQuery: _searchQuery,
                    onSearchChanged: _handleSearchChanged,
                  ),
                  const SizedBox(height: 12),
                  CategoryFilterChips(
                    selectedCategory: _selectedCategory,
                    onCategorySelected: _handleCategorySelected,
                  ),
                  const SizedBox(height: 16),
                ]),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final card = _filteredCards[index];
                    return CardGridTile(
                      card: card,
                      onFavoriteToggle: () => _handleToggleFavorite(card.id),
                    );
                  },
                  childCount: _filteredCards.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}