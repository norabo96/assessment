import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arabic number to English phrase converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ConverterPage(),
    );
  }
}

class ConverterPage extends StatefulWidget {
  const ConverterPage({Key? key}) : super(key: key);

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var parWidth = constraints.maxWidth;

        return Scaffold(
          body: Stack(
            children: [
              // background
              Opacity(
                opacity: 0.7,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/background_light.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              Center(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    width: parWidth * 0.90,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'How does it spelled correctly?',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 46.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Add a number and convert it to an English phrase.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 50.0),
                              child: Text(
                                '.' * 100,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: 14.0,
                                  letterSpacing: 1,
                                  color: Colors.black87,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ),

                          // text input field
                          Container(
                            padding: const EdgeInsets.only(top: 50.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(30.0),
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
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                          style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            letterSpacing: 1,
                                            fontSize: 16,
                                          ),
                                          onChanged: (val){},
                                          validator: (val) => val!.isEmpty ? 'Enter a number!' : null,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding: const EdgeInsets.only(left: 15.0),
                                            hintText: 'enter a number',
                                            hintStyle: GoogleFonts.poppins(
                                              color: Colors.grey[700],
                                              letterSpacing: 1.5,
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
                          ),

                          // button
                          Container(
                            width: parWidth * 0.40,
                            padding: const EdgeInsets.only(top: 50.0),
                            child: SizedBox(
                              height: 45.0,
                              child: Material(
                                borderRadius: BorderRadius.circular(30.0),
                                shadowColor: Colors.grey,
                                color: Colors.white,
                                elevation: 7.0,
                                child: TextButton(
                                  onPressed: (){},
                                  child: Center(
                                    child: Text(
                                      'CONVERT',
                                      style: GoogleFonts.poppins(
                                        fontSize: 18.0,
                                        color: Colors.grey[800],
                                        fontWeight: FontWeight.w300,
                                        letterSpacing: 2.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ]
          ),
        );
      },
    );
  }
}
