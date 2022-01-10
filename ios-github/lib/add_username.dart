import 'package:flutter/material.dart';
import 'package:github_issues/constants.dart';
import 'package:github_issues/repositories.dart';
import 'package:google_fonts/google_fonts.dart';

class AddUsernamePage extends StatefulWidget {
  const AddUsernamePage({Key? key}) : super(key: key);

  @override
  _AddUsernamePageState createState() => _AddUsernamePageState();
}

class _AddUsernamePageState extends State<AddUsernamePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  String currentUsername = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        padding: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0, bottom: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Title(),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MainText(),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Column(
                      children: [
                        TextField(),
                        NavigatorButton()
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 1.0)
          ],
        ),
      ),
    );
  }

  Widget Title() {
    return Row(
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
    );
  }

  Widget MainText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Easy way to get issues from your repositories',
          style: secondFont(
            fontSize: 42,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          'You just have to add your GitHub username',
          style: mainFont(
            fontSize: 16,
            color: const Color(0xF6414833),
          ),
        ),
      ],
    );
  }

  Widget TextField() {
    return Container(
      padding: const EdgeInsets.only(top: 50.0),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        shadowColor: Colors.grey,
        color: Colors.white,
        elevation: 7.0,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              InkWell(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10.0, 8.0, 25.0, 8.0),
                  child: TextFormField(
                    controller: _controller,
                    keyboardType: TextInputType.text,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      letterSpacing: 1,
                      fontSize: 16,
                    ),
                    onChanged: (val){
                      if(val.isNotEmpty){
                        setState(() { currentUsername = val; });
                      }
                    },
                    validator: (val) => val!.isEmpty ? 'Enter your username!' : null,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 15.0),
                      hintText: 'enter your username',
                      hintStyle: mainFont(
                        color: Colors.grey[700],
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget NavigatorButton() {
    return Container(
      padding: const EdgeInsets.only(top: 20.0),
      child: SizedBox(
        height: 45.0,
        child: Material(
          borderRadius: BorderRadius.circular(10.0),
          shadowColor: const Color(0xFF333D29),
          color: mainColor,
          elevation: 7.0,
          child: TextButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()){
                Navigator.push(context, MaterialPageRoute(builder: (context) => RepositoryPage(currentUsername: currentUsername)));
              }
            },
            child: Center(
              child: Text(
                'GET MY REPOSITORIES',
                style: mainFont(
                  fontSize: 18.0,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
