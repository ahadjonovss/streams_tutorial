import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:streams_tutorial/data/models/question_model.dart';
import 'package:streams_tutorial/data/repositories/storage_repository.dart';
import 'package:streams_tutorial/utils/get_it.dart';

part 'ai_state.dart';

class AiCubit extends Cubit<AiState> {
  AiCubit() : super(AiInitial());

  StreamController chatStream = StreamController();

  addAnswerToStream(){}

  Future<String?> findAnswer(String question) async {
    bool isFound = false;
    for(int i =0;isFound==true;i++){
      QuestionModel? result =  await getModel(i);
      if(result!=null && result.question==question){
        isFound = true;
        return result.answer;
      }else if(result==null){
        return "Sorry but I don't know";
      }
    }
    return null;
  }

  Future<QuestionModel?> getModel(int key) async {
    String? result =  await getIt<StorageRepository>().getQuestion(key);
    if(result!=null){
      return QuestionModel(answer: result.split("|")[1], question: result.split("|")[0]);
    }
    else{
      return null;
    }
  }
}
