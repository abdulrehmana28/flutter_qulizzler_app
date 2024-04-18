import 'question.dart';

class QuizBank {
  String getQuestion(int questionNumber) {
    return _questionList.elementAt(questionNumber).questionText;
  }

  bool getAnswer(int questionNumber) {
    return _questionList.elementAt(questionNumber).answerOfQuestion;
  }

  List<Question> _questionList = [
    Question(
        questionText: 'Some cats are actually allergic to humans',
        answerOfQuestion: true),
    Question(
        questionText: 'You can lead a cow down stairs but not up stairs.',
        answerOfQuestion: false),
    Question(
        questionText:
            'Approximately one quarter of human bones are in the feet.',
        answerOfQuestion: true),
    Question(questionText: 'A slug\'s blood is green.', answerOfQuestion: true),
    Question(
        questionText: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',
        answerOfQuestion: true),
    Question(
        questionText: 'It is illegal to pee in the Ocean in Portugal.',
        answerOfQuestion: true),
    Question(
        questionText:
            'No piece of square dry paper can be folded in half more than 7 times.',
        answerOfQuestion: false),
    Question(
        questionText:
            'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        answerOfQuestion: true),
    Question(
        questionText:
            'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        answerOfQuestion: false),
    Question(
        questionText:
            'The total surface area of two human lungs is approximately 70 square metres.',
        answerOfQuestion: true),
    Question(
        questionText: 'Google was originally called \"Backrub\".',
        answerOfQuestion: true),
    Question(
        questionText:
            'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        answerOfQuestion: true),
    Question(
        questionText:
            'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        answerOfQuestion: true),
  ];
}
