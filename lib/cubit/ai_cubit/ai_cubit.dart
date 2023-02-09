import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:streams_tutorial/data/models/question_model.dart';
import 'package:streams_tutorial/data/repositories/storage_repository.dart';
import 'package:streams_tutorial/utils/get_it.dart';

part 'ai_state.dart';

class AiCubit extends Cubit<AiState> {
  AiCubit() : super(AiState(answer: "Hello! How Can I Help You?"));

  StreamController<QuestionModel> chatStream = StreamController();

  addAnswerToStream(QuestionModel answer){
    print(answer.answer);
    chatStream.sink.add(answer);
  }


  addQuestionToStream(String question){
    addAnswerToStream(QuestionModel(answer: question));
    findAnswer(question);
  }

  Future<String?> findAnswer(String question) async {
    bool isFound = false;
    for(int i =0;isFound!=true;i++){
      QuestionModel? result =  await getModel(i);
      if(result!=null && result.question==question){
        isFound = true;
        addAnswerToStream(result);
      }else if(result==null){
        addAnswerToStream(QuestionModel(answer: "Sorry but I don't know",isAi: true));
        isFound = true;
      }
    }
    return null;
  }

  Future<QuestionModel?> getModel(int key) async {
    String? result =  await getIt<StorageRepository>().getQuestion(key);
    if(result!=null){
      return QuestionModel(answer: result.split("|")[1], question: result.split("|")[0],isAi: true);
    }
    else{
      return null;
    }
  }
}
