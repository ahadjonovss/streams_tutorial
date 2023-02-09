import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:streams_tutorial/data/repositories/storage_repository.dart';
import 'package:streams_tutorial/utils/get_it.dart';

part 'ai_state.dart';

class AiCubit extends Cubit<AiState> {
  AiCubit() : super(AiInitial());

  StreamController chatStream = StreamController();

  addAnswerToStream(){}

  findAnswer(String question){
    bool isFound = false;
    for(int i =0;isFound==true;i++){
      getIt<StorageRepository>();
    }
  }
}
