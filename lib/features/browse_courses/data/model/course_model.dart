

class CourseModel {
  final String id;
  final String title;
  final String category;
  final double price;
  final double rating;
  final int reviewCount;
  final int durationHrs;
  final String imageUrl;
  final bool isFree;

  const CourseModel({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.durationHrs,
    required this.imageUrl,
    this.isFree = false,
  });
}