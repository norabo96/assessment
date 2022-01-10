import 'package:flutter/material.dart';
import 'package:github_issues/models/repo_issue.dart';
import 'package:url_launcher/url_launcher.dart';
import 'constants.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;

class RepoIssuePage extends StatefulWidget {
  final RepoIssue repoIssue;
  const RepoIssuePage({Key? key, required this.repoIssue}) : super(key: key);

  @override
  _RepoIssuePageState createState() => _RepoIssuePageState();
}

class _RepoIssuePageState extends State<RepoIssuePage> {
  late RepoIssue repoIssue;

  @override
  void initState(){
    super.initState();
    repoIssue = widget.repoIssue;
    htmlFormat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: RepoInfo(),
      ),
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

  Widget RepoInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Text(
            repoIssue.title!,
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
                '${repoIssue.number}',
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
                '${repoIssue.creationDate}',
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
              SizedBox(
                  height: 25.0,
                  child: Image.network(repoIssue.user!.authorAvatar!)
              ),
              const SizedBox(width: 5.0),
              Text(
                repoIssue.user!.authorLogin!,
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
                repoIssue.labels!.labels!.isNotEmpty ?
                Row(
                  children: [...
                  repoIssue.labels!.labels!.map((i) =>
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Html(
                      data: repoIssue.body,
                      onLinkTap: (String? url, RenderContext context, Map<String, String> attributes, dom.Element? element) async {
                        if (await canLaunch(url!)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      }
                    ),
                  ),
                ),
              )
          ),
        ),
      ],
    );
  }

  void htmlFormat(){
    setState(() {
      repoIssue.body = repoIssue.body!.replaceAll('<details>', '');
      repoIssue.body = repoIssue.body!.replaceAll('</details>', '');

      repoIssue.body = repoIssue.body!.replaceAll('<h1>', '<h3>');
      repoIssue.body = repoIssue.body!.replaceAll('</h1>', '</h3>');

      repoIssue.body = repoIssue.body!.replaceAll('<summary>', '');
      repoIssue.body = repoIssue.body!.replaceAll('</summary>', '');

      repoIssue.body = repoIssue.body!.replaceAll('<blockquote>', '');
      repoIssue.body = repoIssue.body!.replaceAll('</blockquote>', '');

      repoIssue.body = repoIssue.body!.replaceAll('\n', '<br>');

      repoIssue.body = repoIssue.body!.replaceAll(RegExp(r"(<br>){2,}"), '<br>');

      var markdown = RegExp(r"\[[\w\s]*\]\((http|ftp|https):\/\/([\w_-]+(?:(?:\.[\w_-]+)+))([\w.,@?^=%&:\/~+#-]*[\w@?^=%&\/~+#-])\)");

      repoIssue.body = repoIssue.body!.replaceAllMapped(markdown, (m) {
        var text = '';
        var url = '';
        text = m[0].toString().split('[')[1].split(']')[0];
        url = m[0].toString().split('(')[1].split(')')[0];

        return '<a href="' + url + '">' + text + '</a>';
      });

    }
    );
  }
}
