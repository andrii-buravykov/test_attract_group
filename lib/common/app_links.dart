class AppLinks {
  static final _singleton = AppLinks._init();
  static final shared = _singleton;

  AppLinks._init();

  String get placeHolderLink => "https://jsonplaceholder.typicode.com/posts/";
}
