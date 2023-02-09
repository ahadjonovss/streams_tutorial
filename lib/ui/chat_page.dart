import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streams_tutorial/cubit/ai_cubit/ai_cubit.dart';
import 'package:streams_tutorial/data/models/message_model.dart';

import 'widgets/message_widget.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);

  TextEditingController question = TextEditingController();
  List<MessageModel> chat = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chat"),),
      body: BlocProvider(
        create: (context) => AiCubit(),
        child: BlocBuilder<AiCubit,AiState>(
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
                                 return MessageWidget(message: chat[index],);
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
                              chat.add(MessageModel(answer: question.text));
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
      ),
    );
  }
}
