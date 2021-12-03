class Source {
  Source({this.id, this.name});

  /// Create source from json
  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(id: json['id'], name: json['name']);
  }

  final String? id;
  final String? name;
}
