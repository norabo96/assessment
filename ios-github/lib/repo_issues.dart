import 'package:flutter/material.dart';
import 'package:github_issues/constants.dart';
import 'package:github_issues/repo_single_issue.dart';

class RepositoryIssuesPage extends StatefulWidget {
  const RepositoryIssuesPage({Key? key}) : super(key: key);

  @override
  _RepositoryIssuesPageState createState() => _RepositoryIssuesPageState();
}

class _RepositoryIssuesPageState extends State<RepositoryIssuesPage> {
  bool showOpenIssues = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'example',
              style: mainFont(
                fontSize: 24.0
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              'example',
              style: secondFont(
                fontSize: 14.0
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RepoIssuePage()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: Card(
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
                                  'example',
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
                                      'example',
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
                                      'example',
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
                                      'example',
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
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
