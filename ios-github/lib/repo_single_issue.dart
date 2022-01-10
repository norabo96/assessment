import 'package:flutter/material.dart';
import 'constants.dart';

class RepoIssuePage extends StatefulWidget {
  const RepoIssuePage({Key? key}) : super(key: key);

  @override
  _RepoIssuePageState createState() => _RepoIssuePageState();
}

class _RepoIssuePageState extends State<RepoIssuePage> {
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Text(
                'example',
                softWrap: true,
                style: mainFont(
                    fontSize: 24.0
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
                  const SizedBox(width: 5.0),
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
            ),
            const SizedBox(height: 5.0),
            Expanded(
              child: Container(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    shadowColor: Colors.grey,
                    color: Colors.white,
                    elevation: 7.0,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Text(
                            'example'
                        ),
                      ),
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
