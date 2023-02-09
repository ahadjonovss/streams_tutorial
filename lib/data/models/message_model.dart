class MessageModel{
  String question;
  String answer;
  bool isAi;
  MessageModel({required this.answer, this.question = "",this.isAi=false});
}