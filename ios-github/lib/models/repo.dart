class GitRepository{
  String? name; // name
  String? htmlUrl; // html_url
  int? stargazersCount; // stargazers_count
  String? description; // description
  int? openIssuesCount; // open_issues_count
  Owner? owner; // owner

  GitRepository({
    this.name,
    this.htmlUrl,
    this.stargazersCount,
    this.description,
    this.openIssuesCount,
    this.owner
  });

  factory GitRepository.fromJson(Map<String, dynamic> json) {
    return GitRepository(
      name: json['name'],
      htmlUrl: json['html_url'],
      stargazersCount: json['stargazers_count'],
      description: json['description'],
      openIssuesCount: json['open_issues_count'],
      owner: json['owner'] != null ? Owner.fromJson(json['owner']) : null,
    );
  }
}

class Owner {
  String? login; // login

  Owner({
    this.login,
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(login: json['login']);
  }
}

class AllRepository {
  List<GitRepository>? repositories;

  AllRepository({this.repositories });

  factory AllRepository.fromJson(List<dynamic> json){
    List<GitRepository> repositories = json.map((repo) => GitRepository.fromJson(repo)).toList();
    return AllRepository(repositories: repositories);
  }
}
