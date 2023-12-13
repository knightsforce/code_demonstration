class CompanyEntity {
  final int id;
  final String name;
  final String description;
  final String? logoUri;

  CompanyEntity({
    required this.id,
    required this.name,
    required this.description,
    this.logoUri,
  });
}
