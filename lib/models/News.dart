class News {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  News({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      author: json["author"] != null ? json["author"] : "",
      title: json["title"] != null ? json["title"] : "",
      description: json["description"] != null ? json["description"] : "",
      url: json["url"] != null ? json["url"] : "",
      urlToImage: json["urlToImage"] != null ? json["urlToImage"] : "",
      publishedAt: json["publishedAt"] != null ? json["publishedAt"] : "",
      content: json["content"] != null ? json["content"] : "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "author": this.author,
      "title": this.title,
      "description": this.description,
      "url": this.url,
      "urlToImage": this.urlToImage,
      "publishedAt": this.publishedAt,
      "content": this.content,
    };
  }
}
