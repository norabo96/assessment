import 'package:flutter/material.dart';
import 'package:github_issues/constants.dart';
import 'package:github_issues/repo_issues.dart';

class RepositoryPage extends StatefulWidget {
  final String currentUsername;
  const RepositoryPage({Key? key, required this.currentUsername}) : super(key: key);

  @override
  State<RepositoryPage> createState() => _RepositoryPageState();
}

class _RepositoryPageState extends State<RepositoryPage> {
  late String currentUsername;

  @override
  void initState(){
    super.initState();
    currentUsername = widget.currentUsername;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: lightMainColor,
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => RepositoryIssuesPage()));
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
                                fontSize: 20.0
                            ),
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.65,
                          child: Text(
                            'example',
                            softWrap: true,
                            style: secondFont(
                                fontSize: 14.0
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.check_rounded,
                      color: mainColor,
                      size: 30.0,
                    )
                  ],
                ),
              ),
            ),
          )
        ),
      )
    );
  }
}