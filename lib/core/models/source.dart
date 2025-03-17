class Source {
  final String? id;
  final String? name;

  Source({
    this.id,
    this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id']?? 'no-id',
      name: json['name']?? 'no-name',
    );
  }
}