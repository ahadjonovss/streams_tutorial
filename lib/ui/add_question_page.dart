import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streams_tutorial/cubit/question_setter/question_setter_cubit.dart';
import 'package:streams_tutorial/utils/mytoast.dart';

class AddQuestionPage extends StatelessWidget {
  AddQuestionPage({Key? key}) : super(key: key);

  TextEditingController answer = TextEditingController();
  TextEditingController question = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add question Page"),),
      body: BlocProvider(
        create: (context) => QuestionSetterCubit(),
        child: BlocConsumer<QuestionSetterCubit,QuestionSetterState>(
          listener: (context, state) {
            if(state.status == QuestionStatus.ONPROGRESS){
              showDialog(context: context,
                barrierDismissible:false,builder: (context) => const AlertDialog(content: CircularProgressIndicator()),);
            }
            if(state.status == QuestionStatus.DONE){
              Navigator.pop(context);
              answer.clear();
              question.clear();
              // showMyToast(context);
            }

          },
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.all(12),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Column(
                  children:  [
                    TextField(
                      controller: question,
                      decoration: const InputDecoration(
                          hintText: "Your Question"
                      ),
                    ),
                    TextField(
                      controller: answer,
                      decoration:  const InputDecoration(
                          hintText: "Your answer"
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(onPressed: () {
                      context.read<QuestionSetterCubit>().addQuestion(question.text, answer.text);

                    }, child: const Text("Save"))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
