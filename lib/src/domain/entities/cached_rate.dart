class CachedRate {
  final double rate;       // rate of 1 unit of 'from' currency
  final DateTime fetchedAt;

  CachedRate({required this.rate, required this.fetchedAt});
}

// In-memory cache
final Map<String, CachedRate> _cache = {};
