import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streams_tutorial/cubit/ai_cubit/ai_cubit.dart';
import 'package:streams_tutorial/data/models/question_model.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);

  TextEditingController question = TextEditingController();
  List<QuestionModel> chat = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chat"),),
      body: BlocBuilder<AiCubit,AiState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(12),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Column(
                  children:  [
                    SizedBox(
                      height: 600,
                      child: StreamBuilder(
                        stream: context.read<AiCubit>().chatStream.stream,
                        builder: (context, snapshot) {
                          if(snapshot.hasData){
                            chat.add(snapshot.data!);
                            return ListView.builder(
                              itemCount: chat.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                               return Row(
                                 children: [
                                   Container(
                                     width: MediaQuery.of(context).size.width-32,
                                     margin: const EdgeInsets.all(4),
                                     alignment: !chat[index].isAi?Alignment.centerRight:Alignment.centerLeft,
                                     child: Container(
                                       decoration:  BoxDecoration(
                                         color: Colors.blue,
                                         borderRadius: BorderRadius.only(topLeft: const  Radius.circular(8),topRight:const  Radius.circular(8),bottomRight: Radius.circular(chat[index].isAi?8:0),bottomLeft: Radius.circular(!chat[index].isAi?8:0))
                                       ),
                                       padding: const EdgeInsets.all(8),
                                       constraints: const BoxConstraints(
                                         minWidth: 80,
                                         maxWidth: 200
                                       ),
                                       child: Text(chat[index].answer),
                                     ),
                                   )
                                 ],
                               );
                              },);
                          }
                          return const Text("Nimadir");
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 290,
                            child: TextField(
                              controller: question,
                              decoration: const InputDecoration(
                                  hintText: "Your Question"
                              ),
                            ),
                          ),
                          IconButton(onPressed: () {
                            chat.add(QuestionModel(answer: question.text));
                            context.read<AiCubit>().addQuestionToStream(question.text);
                            question.clear();
                          }, icon: const Icon(Icons.send)),
                        ],
                      ),
                    )


                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
