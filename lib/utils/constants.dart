class Constants {
  static String get _apiKey => "97736120a22a45a49a08dbb770f029bd";

  static String get topHeadlinesURL {
    return "http://newsapi.org/v2/top-headlines?country=tr&apiKey=$_apiKey";
  }
}
