import 'package:flutter/material.dart';
import 'package:github_issues/add_username.dart';
import 'package:github_issues/constants.dart';
import 'package:github_issues/models/repo.dart';
import 'package:github_issues/models/repo_issue.dart';
import 'package:github_issues/repo_single_issue.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<RepoIssues> fetchRepoIssues(String currentUsername, String repo) async {
  final response = await http.get(Uri.parse('https://api.github.com/repos/'+ currentUsername + '/' + repo + '/issues'));

  if(response.statusCode == 200){
    return RepoIssues.fromJson(json.decode(response.body));
  }
  else {
    throw Exception('Failed to fetch repository. Status code is ${response.statusCode}.');
  }
}

class RepositoryIssuesPage extends StatefulWidget {
  final GitRepository gitRepository;
  const RepositoryIssuesPage({Key? key, required this.gitRepository}) : super(key: key);

  @override
  _RepositoryIssuesPageState createState() => _RepositoryIssuesPageState();
}

class _RepositoryIssuesPageState extends State<RepositoryIssuesPage> {
  late GitRepository repo;
  late Future<RepoIssues> futureRepoIssues;
  bool showOpenIssues = true;

  @override
  void initState(){
    super.initState();
    repo = widget.gitRepository;
    futureRepoIssues = fetchRepoIssues(repo.owner!.login!, repo.name!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder<RepoIssues>(
          future: futureRepoIssues,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              var repoIssues = <RepoIssue>[];
              getRepoIssues(repoIssues, snapshot);

              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RepoInfo(),
                  const SizedBox(height: 20.0),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: repoIssues.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Visibility(
                          visible: repoIssues[index].state == showOpenIssues ? true : false,
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => RepoIssuePage(repoIssue: repoIssues[index])));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                              child: RepoCard(repoIssues, index)
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              );
            }
            else if (snapshot.hasError) {
              popError(snapshot.error!);
              return Container();
            }
            else{
              return const Center(child: CircularProgressIndicator());
            }
          }
        )
      )
    );
  }

  PreferredSizeWidget MyAppBar() {
    return AppBar(
      backgroundColor: const Color(0xffd0d8ab),
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.warning_amber_rounded,
            color: mainColor,
          ),
          const SizedBox(width: 5.0),
          Text(
            'GitHub issues',
            style: secondFont(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: (){ setState(() {showOpenIssues = !showOpenIssues;}); },
          icon: showOpenIssues ? const Icon(Icons.lock_open_rounded) : const Icon(Icons.lock_outline_rounded),
        )
      ],
    );
  }

  Widget RepoInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          repo.name!,
          style: mainFont(
              fontSize: 24.0
          ),
        ),
        const SizedBox(height: 5.0),
        Text(
          repo.description!,
          style: secondFont(
              fontSize: 14.0
          ),
        ),
      ],
    );
  }

  Widget RepoCard(List<RepoIssue> repoIssues, int index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    repoIssues[index].title!,
                    softWrap: true,
                    style: mainFont(
                        fontSize: 16.0
                    ),
                  ),
                ),
                const SizedBox(height: 5.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: Row(
                    children: [
                      Text(
                        'number: ',
                        softWrap: true,
                        style: secondFont(
                            fontSize: 14.0,
                            color: mainColor
                        ),
                      ),
                      Text(
                        '${repoIssues[index].number}',
                        softWrap: true,
                        style: secondFont(
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: Row(
                    children: [
                      Text(
                        'creation date: ',
                        softWrap: true,
                        style: secondFont(
                            fontSize: 14.0,
                            color: mainColor
                        ),
                      ),
                      Text(
                        '${repoIssues[index].creationDate}',
                        softWrap: true,
                        style: secondFont(
                            fontSize: 14.0
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: Row(
                    children: [
                      Text(
                        'user: ',
                        softWrap: true,
                        style: secondFont(
                            fontSize: 14.0,
                            color: mainColor
                        ),
                      ),
                      Text(
                        repoIssues[index].user!.authorLogin!,
                        softWrap: true,
                        style: secondFont(
                            fontSize: 14.0
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5.0),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: Row(
                      children: [
                        Text(
                          'labels: ',
                          softWrap: true,
                          style: secondFont(
                              fontSize: 14.0,
                              color: mainColor
                          ),
                        ),
                        repoIssues[index].labels!.labels!.isNotEmpty ?
                        Row(
                          children: [...
                          repoIssues[index].labels!.labels!.map((i) =>
                              Text(
                                i.name!,
                                style: mainFont(
                                    fontSize: 14.0,
                                    color: i.color
                                ),
                              )
                          ).toList()
                          ],
                        ) :
                        Text(
                          'no labels',
                          style: mainFont(
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    )
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<RepoIssue> getRepoIssues(List<RepoIssue> repoIssues, AsyncSnapshot snapshot) {
    for(int i = 0; i < snapshot.data!.repoIssues.length; i++){
      repoIssues.add(
        RepoIssue(
          title: snapshot.data!.repoIssues[i].title,
          number: snapshot.data!.repoIssues[i].number,
          creationDate: snapshot.data!.repoIssues[i].creationDate,
          state: snapshot.data!.repoIssues[i].state,
          body: snapshot.data!.repoIssues[i].body,
          user: snapshot.data!.repoIssues[i].user,
          labels: snapshot.data!.repoIssues[i].labels
        )
      );
    }
    return repoIssues;
  }

  void popError(Object e) async{
    await Future.delayed(const Duration(microseconds: 1));
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          content: Container(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              e.toString(),
              textAlign: TextAlign.justify,
              style: mainFont(
                fontSize: 18,
                color: Colors.grey[850],
              ),
            ),
          ),
          actions: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: Text(
                      'OK',
                      style: mainFont(
                        color: mainColor,
                        fontSize: 18.0,
                      ),
                    ),
                    onPressed: () async {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const AddUsernamePage()));
                    },
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
