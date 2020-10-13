import 'package:flutter/material.dart';
import 'package:joyus_app/questionnair/enums/questionnaire_type.dart';
import 'package:joyus_app/questionnair/models/questionnaire.dart';
import 'package:joyus_app/questionnair/screens/questionnaire_screen.dart';
import 'package:joyus_app/questionnair/services/questionnaire_service.dart';
import 'package:joyus_app/questionnair/widgets/button.dart';

class HomeScreen_Q extends StatefulWidget {
  const HomeScreen_Q({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen_Q> {
  List<Questionnaire> questionnaires;
  Future<bool> loadAllQuestionnairesFuture;

  @override
  void initState() {
    super.initState();

    loadAllQuestionnairesFuture = loadAllQuestionnaires();
  }

  Future<bool> loadAllQuestionnaires() async {
    final questionnaireService = QuestionnaireService();
    questionnaires = [];
    for (QuestionnaireType questionnaireType in QuestionnaireType.values) {
      final questionnaire = await questionnaireService.getQuestionnaire(questionnaireType);

      // if something went wrong, stop loading questionnaires
      if (questionnaire == null) {
        return false;
      }

      questionnaires.add(questionnaire);
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'แบบทดสอบโรคซึมเศร้า',
        ),
      ),
      body: FutureBuilder(
        future: loadAllQuestionnairesFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData && snapshot.data == true) {
            return Center(
              child: Column(
                children: <Widget>[
                  for (Questionnaire questionnaire in questionnaires)
                    Button.accent(
                      buttonLabel: questionnaire.name,
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => QuestionnaireScreen(
                            questionnaire: questionnaire,
                          ),
                        ),
                      ),
                    )
                ],
              ),
            );
          } else if (snapshot.hasError ||
              (snapshot.connectionState == ConnectionState.done && snapshot.data == false)) {
            return AlertDialog(
              title: Text('Ooops something went wrong!'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Try Again'),
                  onPressed: () => setState(() {
                    loadAllQuestionnairesFuture = loadAllQuestionnaires();
                  }),
                )
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
