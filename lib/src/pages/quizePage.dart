import 'package:dating_app/src/Data/questionList.dart';
import 'package:dating_app/src/pages/resultPage.dart';
import 'package:dating_app/src/widget/ktext.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class QuizePage extends StatefulWidget {
  const QuizePage({Key? key}) : super(key: key);

  @override
  _QuizzScreenState createState() => _QuizzScreenState();
}

class _QuizzScreenState extends State<QuizePage> {
  // ignore: non_constant_identifier_names
  int question_pos = 0;
  int score = 0;
  bool btnPressed = false;
  PageController? _controller;
  String btnText = "Next Question";
  bool answered = false;
  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: PageView.builder(
          controller: _controller!,
          onPageChanged: (page) {
            if (page == questions.length - 1) {
              setState(() {
                btnText = "See Results";
              });
            }
            setState(() {
              answered = false;
            });
          },
          physics: new NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                KText(
                  text: 'Quize',
                  color: Colors.black,
                  fontSize: 22,
                  fontFamily: 'Raleway Bold',
                ),
                Divider(
                  color: Colors.grey,
                ),
                KText(
                  text: "${index + 1} out of 10",
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'Raleway Bold',
                ),
                SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 200.0,
                  child: Text(
                    "${questions[index].question}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.0,
                    ),
                  ),
                ),
                for (int i = 0; i < questions[index].answers!.length; i++)
                  Container(
                    width: double.infinity,
                    height: 50.0,
                    margin:
                        EdgeInsets.only(bottom: 20.0, left: 12.0, right: 12.0),
                    child: MaterialButton(
                      shape: Border.all(
                        color: btnPressed
                            ? questions[index].answers!.values.toList()[i]
                                ? HexColor('#FF18CF')
                                : Colors.grey
                            : Colors.grey,
                      ),
                      onPressed: !answered
                          ? () {
                              if (questions[index]
                                  .answers!
                                  .values
                                  .toList()[i]) {
                                score++;
                                print("yes");
                              } else {
                                print("no");
                              }
                              setState(() {
                                btnPressed = true;
                                answered = true;
                              });
                            }
                          : null,
                      child: Text(questions[index].answers!.keys.toList()[i],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                          )),
                    ),
                  ),
                SizedBox(
                  height: 40.0,
                ),
                RawMaterialButton(
                  onPressed: () {
                    if (_controller!.page?.toInt() == questions.length - 1) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultPage(score)));
                    } else {
                      _controller!.nextPage(
                          duration: Duration(milliseconds: 250),
                          curve: Curves.easeInExpo);

                      setState(() {
                        btnPressed = false;
                      });
                    }
                  },
                  shape: StadiumBorder(),
                  fillColor: Colors.blue,
                  padding: EdgeInsets.all(18.0),
                  elevation: 0.0,
                  child: Text(
                    btnText,
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            );
          },
          itemCount: questions.length,
        ),
      ),
    );
  }
}
