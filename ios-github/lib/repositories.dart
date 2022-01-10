import 'package:flutter/material.dart';
import 'package:github_issues/add_username.dart';
import 'package:github_issues/constants.dart';
import 'package:github_issues/models/repo.dart';
import 'package:github_issues/repo_issues.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<AllRepository> fetchRepositories(String currentUsername) async {
  final response = await http.get(Uri.parse('https://api.github.com/users/'+ currentUsername +'/repos'));

  if(response.statusCode == 200){
    return AllRepository.fromJson(json.decode(response.body));
  }
  else {
    throw Exception('Failed to fetch repository.');
  }
}

class RepositoryPage extends StatefulWidget {
  final String currentUsername;
  const RepositoryPage({Key? key, required this.currentUsername}) : super(key: key);

  @override
  State<RepositoryPage> createState() => _RepositoryPageState();
}

class _RepositoryPageState extends State<RepositoryPage> {
  late String currentUsername;
  late Future<AllRepository> futureRepository;

  @override
  void initState(){
    super.initState();
    currentUsername = widget.currentUsername;
    futureRepository = fetchRepositories(currentUsername);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: MyAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: FutureBuilder<AllRepository>(
            future: futureRepository,
            builder: (context, snapshot) {
              if(snapshot.hasData){
                var repositories = <GitRepository>[];
                getRepos(repositories, snapshot);

                return ListView.builder(
                  itemCount: repositories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RepositoryIssuesPage(gitRepository: repositories[index])));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                        child: RepoCard(repositories, index),
                      ),
                    );
                  },
                );
              }
              else if (snapshot.hasError) {
                popError(snapshot.error!);
                return Container();
              }
              else{
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
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
    );
  }

  Widget RepoCard(List<GitRepository> repositories, int index) {
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
                    repositories[index].name!,
                    softWrap: true,
                    style: mainFont(
                        fontSize: 20.0
                    ),
                  ),
                ),
                const SizedBox(height: 5.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: Text(
                    repositories[index].description!,
                    softWrap: true,
                    style: secondFont(
                        fontSize: 14.0
                    ),
                  ),
                ),
              ],
            ),
            Icon(
              (repositories[index].openIssuesCount! > 0) ? Icons.clear_rounded : Icons.check_rounded,
              color: (repositories[index].openIssuesCount! > 0) ? const Color(0xfffe6d73) : mainColor,
              size: 30.0,
            )
          ],
        ),
      ),
    );
  }

  List<GitRepository> getRepos(List<GitRepository> repositories, AsyncSnapshot snapshot) {
    for(int i = 0; i < snapshot.data!.repositories!.length; i++){
      repositories.add(
          GitRepository(
              name: snapshot.data!.repositories![i].name,
              htmlUrl: snapshot.data!.repositories![i].htmlUrl,
              stargazersCount: snapshot.data!.repositories![i].stargazersCount,
              description: snapshot.data!.repositories![i].description,
              openIssuesCount: snapshot.data!.repositories![i].openIssuesCount,
              owner: snapshot.data!.repositories![i].owner
          )
      );
    }
    return repositories;
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