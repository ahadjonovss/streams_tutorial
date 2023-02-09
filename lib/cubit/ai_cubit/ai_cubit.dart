import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:streams_tutorial/data/models/message_model.dart';
import 'package:streams_tutorial/data/repositories/storage_repository.dart';
import 'package:streams_tutorial/utils/get_it.dart';

part 'ai_state.dart';

class AiCubit extends Cubit<AiState> {
  AiCubit() : super(AiState(answer: "Hello! How Can I Help You?"));

  StreamController<MessageModel> chatStream = StreamController();

  addAnswerToStream(MessageModel answer){
    chatStream.sink.add(answer);
  }


  addQuestionToStream(String question){
    addAnswerToStream(MessageModel(answer: question));
    findAnswer(question);
  }

  Future<String?> findAnswer(String question) async {
    bool isFound = false;
    for(int i =0;isFound!=true;i++){
      MessageModel? result =  await getModel(i);
      if(result!=null && result.question==question){
        isFound = true;
        addAnswerToStream(result);
      }else if(result==null){
        addAnswerToStream(MessageModel(answer: "Sorry but I don't know. If you want to get answer to this question, you can add the answer through another page ;)",isAi: true));
        isFound = true;
      }
    }
    return null;
  }

  Future<MessageModel?> getModel(int key) async {
    String? result =  await getIt<StorageRepository>().getQuestion(key);
    if(result!=null){
      return MessageModel(answer: result.split("|")[1], question: result.split("|")[0],isAi: true);
    }
    else{
      return null;
    }
  }
}
