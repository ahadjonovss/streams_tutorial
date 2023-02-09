part of 'question_setter_cubit.dart';

@immutable
class QuestionSetterState extends Equatable{

  QuestionStatus status;

  QuestionSetterState({required this.status});

  copyWith({QuestionStatus? status}){
    return QuestionSetterState(status: status??this.status);
  }
  @override
  // TODO: implement props
  List<Object?> get props => [
    status
  ];
}

enum QuestionStatus{
  ONPROGRESS,
  DONE,
  ERROR,
  PURE
}

