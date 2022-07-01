import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users_bloc/bloc/users.bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class GitUsersPage extends StatelessWidget {
  const GitUsersPage({Key?key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return Scaffold(

      appBar: AppBar(
        title: BlocBuilder<UsersBloc, UsersState>(

          builder:  (context, state) {

            if(state is SearchUsersErrorState)
              return Row(
                mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                children: [
                  Text("users"),
                  Text("${state.currentPage}/${state.totalePages}")
                ],
              );
            else
              return const Text("Users page");
          },
        ),

      ),
      body: Column(
        children: [
          Padding(padding: const EdgeInsets.all(8.0),
              child: Row(
                  children: [
                    Expanded(child: TextFormField(
                      controller: textEditingController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  width: 2
                              )

                          )
                      ),
                    ))
                    ,
                    IconButton(onPressed: () {
                      context.read<UsersBloc>().add(
                          SearchUsersEvent(key: textEditingController.text, currentPage: 0, pageSize: 20,totalePages: 300));
                    }, icon: const Icon(Icons.search))

                  ]
              )
          ),
          BlocBuilder<UsersBloc, UsersState>(builder: (context, state) {
            if (state is SearchUsersIsLoadingState)
              return const Center(
                child: CircularProgressIndicator(),
              );
            else if (state is SearchUsersErrorState) {
              return Column(
                children: [
                  Text(
                    state.error, style: TextStyle(color:Theme.of(context).primaryColor),),
                  ElevatedButton(onPressed: () {}, child: const Text('Retry'))
                ],
              );
            } else if (state is SearchUsersSuccessState) {
              return Expanded(child:LazyLoadScrollView(
                  onEndOfPage: () => {


                    context.read<UsersBloc>().add(NextPageEvent(key: state.key, currentPage: state.currentPage+1, pageSize: state.pageSize ,totalePages: state.totalePages ))

                  },



                  child: ListView.separated(

                      itemBuilder: (context, index)=>ListTile(
                        title: Row(
                          children: [

                            CircleAvatar(
                              backgroundImage: NetworkImage(state.users[index].avatarUrl) ,
                              radius : 40,

                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(state.users[index].login )

                          ],
                        ),
                      ) ,
                      separatorBuilder: (contex,index) =>
                          Divider(
                            height: 2,
                          ),
                      itemCount: state.users.length)
              )
              );
            }else{
              return Container(
                color: Theme.of(context).primaryColor,
              );
            }
          })


        ],
      ),
    );
  }
}