
class PaginationData {
  final String? nextPage;
   int? page;
  PaginationData({ this.nextPage = '', this.page = 1});

  bool get isLastPage => nextPage == null;



  factory PaginationData.fromMap(Map<String, dynamic> map) {
    return PaginationData(
      nextPage: map['next_page_url'],
    );
  }
}
