import 'questions.dart';

class QuizBrain{

  int _count = 0;

  final List<Questions> _questionBank = [
    Questions(q: 'You can lead a cow down stairs but not up stairs.',a: false),
    Questions(q: 'Approximately one quarter of human bones are in the feet.',a: true),
    Questions(q: 'A slug\'s blood is green.',a: true)
  ];

  void nextQuestion(){
    if(_count<_questionBank.length-1){
      _count++;
    }
  }

  String getQuestionText(){
    return _questionBank[_count].questionText;
  }

  bool getQuestionAnswer(){
    return _questionBank[_count].questionAnswer;
  }

  bool isFinished(){
    if(_count>=_questionBank.length-1){
      return true;
    }
    else {
      return false;
    }
  }

  void reset(){
    _count=0;
  }
}