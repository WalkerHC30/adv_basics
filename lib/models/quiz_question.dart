class QuizQuestion {
  const QuizQuestion(this.text, this.answer);

  final String text;
  final List<String> answer;

  List<String> getShuffleAnswers() {
    //shuffle could not return a list, so must copy the list;
    final shuffleList = List.of(answer);
    shuffleList.shuffle();
    return shuffleList;
  }
}
