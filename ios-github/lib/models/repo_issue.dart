import 'dart:ui';

class RepoIssue{
  String? title; // title
  int? number; // number
  DateTime? creationDate; // created_at  // "2011-04-22T13:33:48Z"
  bool? state; // state
  String? body; // body

  User? user; // user
  Labels? labels; // labels

  RepoIssue({
    this.title,
    this.number,
    this.creationDate,
    this.state,
    this.body,

    this.user,
    this.labels
  });

  factory RepoIssue.fromJson(Map<String, dynamic> json){
    return RepoIssue(
      title: json['title'],
      number: json['number'],
      creationDate: DateTime.parse(json['created_at'].toString()),
      state: json['state'] == 'open' ? true : false,
      body: json['body'],

      user: json['user'] != null ? User.fromJson(json['user']) : null,
      labels: json['labels'] != null ? Labels.fromJson(json['labels']) : null,
    );
  }
}

class User {
  String? authorLogin; // user -> login
  String? authorAvatar; // user -> avatar_url

  User({
    this.authorLogin,
    this.authorAvatar,
  });

  factory User.fromJson(Map<String, dynamic> json){
    return User(
        authorLogin: json['login'],
        authorAvatar: json['avatar_url']
    );
  }
}

class Label {
  String? name; // name
  Color? color; // color

  Label({
    this.name,
    this.color
  });

  factory Label.fromJson(Map<String, dynamic> json){
    return Label(
        name: json['name'],
        color: Color(int.parse(json['color'], radix: 16) + 0xFF000000)
    );
  }
}

class Labels {
  List<Label>? labels;

  Labels({this.labels});

  factory Labels.fromJson(List<dynamic> json){
    List<Label> labels = json.map((labels) => Label.fromJson(labels)).toList();
    return Labels(labels: labels);
  }
}

class RepoIssues {
  List<RepoIssue> repoIssues;

  RepoIssues({ required this.repoIssues });

  factory RepoIssues.fromJson(List<dynamic> json){
    List<RepoIssue> repositories = json.map((repo) => RepoIssue.fromJson(repo)).toList();
    return RepoIssues(repoIssues: repositories);
  }
}
