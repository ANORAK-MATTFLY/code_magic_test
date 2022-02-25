class AuthorModel {
  String? link;
  String? bio;
  String? description;
  String? id;
  String? name;
  int? quoteCount;
  String? slug;
  String? dateAdded;
  String? dateModified;

  AuthorModel(
      {this.link,
      this.bio,
      this.description,
      this.id,
      this.name,
      this.quoteCount,
      this.slug,
      this.dateAdded,
      this.dateModified});

  factory AuthorModel.fromApiData(dynamic authorData) {
    return AuthorModel(
        link: authorData["link"],
        bio: authorData["bio"],
        description: authorData["description"],
        id: authorData["id"],
        name: authorData["name"],
        quoteCount: authorData["quotes"],
        slug: authorData["slug"],
        dateAdded: authorData["dateAdded"],
        dateModified: authorData["dateModified"]);
  }
}
