import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:streams_tutorial/data/repositories/storage_repository.dart';
import 'package:streams_tutorial/utils/get_it.dart';

part 'question_setter_state.dart';

class QuestionSetterCubit extends Cubit<QuestionSetterState> {
  QuestionSetterCubit() : super(QuestionSetterState(status: QuestionStatus.PURE));


  addQuestion(String question, String answer) async {
    emit(state.copyWith(status: QuestionStatus.ONPROGRESS));
    int? key = await getIt<StorageRepository>().getLastKey();
    getIt<StorageRepository>().saveQuestion("$question|$answer", key==null?0:++key);
    await Future.delayed( const Duration(seconds: 2));
    emit(state.copyWith(status: QuestionStatus.DONE));
  }
}
