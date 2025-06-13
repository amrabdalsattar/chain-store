import 'package:flutter/material.dart';

class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final List<String> images;
  final List<String> sizes;
  final List<Color> colors;
  final double rating;
  final int reviewCount;
  final String brand;

  const ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.images,
    required this.sizes,
    required this.colors,
    required this.rating,
    required this.reviewCount,
    this.brand = 'Cotton Club',
  });

  // Sample product for demo purposes
  static ProductModel sampleProduct() {
    return ProductModel(
      id: '1',
      name: 'Cotton Club T-shirt',
      description:
          'Crafted from 100% premium cotton, the Cotton Club T-shirt offers an ultra-soft feel and breathable comfort for all-day wear. Its classic cut and lightweight fabric make it a versatile staple for any wardrobe.',
      price: 500,
      images: [
        'assets/images/product_placeholder.png',
        'assets/images/product_placeholder.png',
        'assets/images/product_placeholder.png',
      ],
      sizes: ['S', 'M', 'L', 'XL'],
      colors: [
        Color(0xFF000000),
        Color(0xFF232323),
        Color(0xFFB0B0A8),
        Color(0xFFD9D9D9),
        Color(0xFF7B5E3B),
        Color(0xFFB07B3B),
        Color(0xFF8B5E3C),
      ],
      rating: 4.8,
      reviewCount: 1000,
      brand: 'Cotton Club',
    );
  }
}
