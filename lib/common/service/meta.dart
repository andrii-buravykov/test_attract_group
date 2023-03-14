class Meta {
  const Meta({
    this.currentPage = 1,
    this.lastPage = 10,// bad init
    // this.perPage = 0,
    // this.total = 0,
  });

  final int currentPage;
  final int lastPage;
  // final int perPage;
  // final int total;

  bool get endOfList => currentPage > lastPage;

  // factory Meta.fromJson(Map<String, dynamic> json) => Meta(
  //       currentPage: json["current_page"] ?? 1,
  //       lastPage: json["last_page"] ?? 1,
  //       perPage: json["per_page"] ?? 0,
  //       total: json["total"] ?? 0,
  //     );
}
