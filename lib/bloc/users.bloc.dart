import 'package:bloc/bloc.dart';
import 'package:github_users_bloc/model/users.model.dart';
import '../repository/users.repository.dart';
abstract class UsersEvent{}

class SearchUsersEvent extends UsersEvent{

  final int currentPage;
  final int totalePages;
  final int pageSize;
  final String currentKeyword;
  SearchUsersEvent({required this.currentKeyword,required this.currentPage, required this.pageSize, required this.totalePages});


}

class NextPage extends SearchUsersEvent {
  NextPage({required super.currentKeyword, required super.currentPage, required super.pageSize, required super.totalePages});
  // NextPage({required super.key, required super.currentPage, required super.pageSize});
}
abstract class UsersState{

  final List<User> list;
  final int currentPage;
  final int totalePages;
  final int pageSize;
  final String currentKeyword;

  UsersState({required this.currentKeyword,required this.list, required this.currentPage , required this.totalePages,required this.pageSize});

}
 class SearchUsersSuccessState extends UsersState {
  SearchUsersSuccessState({required super.currentKeyword, required super.list, required super.currentPage, required super.totalePages, required super.pageSize});




}
 class SearchUsersIsLoadingState extends UsersState{
  SearchUsersIsLoadingState({required super.currentKeyword, required super.list, required super.currentPage, required super.totalePages, required super.pageSize});

 }
 class SearchUsersErrorState extends UsersState{


   final String errorMessage;

  SearchUsersErrorState({required super.currentKeyword, required super.list, required super.currentPage, required super.totalePages, required super.pageSize,required this.errorMessage});



 }
 class UsersInitialState extends UsersState{
  UsersInitialState():super(currentPage: 0,list: [],totalePages: 0,pageSize: 20,currentKeyword: "");

}

class UsersBloc extends Bloc<UsersEvent,UsersState >{

  UsersRepository usersRepository = UsersRepository();


UsersBloc() : super(UsersInitialState()){

  
  on((SearchUsersEvent event, emit)async{
    // emit(SearchUsersIsLoadingState(

    // ));
   try{
     ListUsers listeUsers = await usersRepository.searchUsers(event.currentKeyword, event.currentPage, event.pageSize);
     int totalPage = (listeUsers.totalCount / event.pageSize).floor();
     List<User> currentList=[...state.list];
     state.list.addAll(currentList);
     if(listeUsers.totalCount % event.pageSize !=0 )
       totalPage = totalPage+1;
     emit(SearchUsersSuccessState(currentKeyword : event.currentKeyword,list : currentList, currentPage: event.currentPage,totalePages : totalPage ,pageSize : event.pageSize));
   } catch(ex) {
     emit(SearchUsersErrorState(
        currentKeyword: state.currentKeyword,
        pageSize: state.pageSize,
        totalePages: state.totalePages,
        currentPage: state.currentPage,
        list: state.list,
         errorMessage : ex.toString()));
   }
  });

 }
}







