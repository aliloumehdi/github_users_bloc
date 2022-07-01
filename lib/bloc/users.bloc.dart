import 'package:bloc/bloc.dart';
import 'package:github_users_bloc/model/users.model.dart';
import '../repository/users.repository.dart';
abstract class UsersEvent{}

class SearchUsersEvent extends UsersEvent{

  final int currentPage;
  final int totalePages;
  final int pageSize;
  final String key;


  SearchUsersEvent({required  this.key,required this.currentPage, required this.pageSize, required this.totalePages});


}

class NextPageEvent extends SearchUsersEvent {
  NextPageEvent({required String key, required int currentPage, required int pageSize,required int totalePages}) : super(key : key,currentPage:  currentPage, pageSize: pageSize,totalePages : totalePages);
}
abstract class UsersState{

  final List<User> users;
  final int currentPage;
  final int totalePages;
  final int pageSize;
  final String key;

  UsersState({required this.key,required this.users, required this.currentPage , required this.totalePages,required this.pageSize});

}
class SearchUsersSuccessState extends UsersState {
  SearchUsersSuccessState({required super.key, required super.users, required super.currentPage, required super.totalePages, required super.pageSize});





}
class SearchUsersIsLoadingState extends UsersState{
  SearchUsersIsLoadingState({required super.key, required super.users, required super.currentPage, required super.totalePages, required super.pageSize});



}
class SearchUsersErrorState extends UsersState{


  final String error;

  SearchUsersErrorState({required super.key, required super.users, required super.currentPage, required super.totalePages, required super.pageSize, required this.error});




}
class UsersInitialState extends UsersState{
  UsersInitialState() : super(key: "", users: [],currentPage: 0,totalePages:  0,pageSize: 20);



}

class UsersBloc extends Bloc<UsersEvent,UsersState >{

  UsersRepository usersRepository = UsersRepository();


  UsersBloc() : super(UsersInitialState()){


    on((SearchUsersEvent event, emit)async{
      emit(SearchUsersIsLoadingState(
          key : state.key,
          users : state.users,
          currentPage: state.currentPage,
          totalePages : state.totalePages ,
          pageSize : state.pageSize
      ));
      try{
        ListUsers listeUsers = await usersRepository.searchUsers(event.key, event.currentPage, event.pageSize);
        int totalPage = (listeUsers.totalCount / event.pageSize).floor();
        if(listeUsers.totalCount % event.pageSize !=0 )
          totalPage = totalPage+1;
        emit(SearchUsersSuccessState(
            key : event.key,
            users : listeUsers.items,
            currentPage: event.currentPage,
            totalePages : totalPage ,
            pageSize : event.pageSize
        ));
      } catch(ex) {
        emit(SearchUsersErrorState( key : event.key,
            users : state.users,
            currentPage: event.currentPage,
            totalePages : state.totalePages ,
            pageSize : event.pageSize,error : ex.toString()));
      }
    });

    on((NextPageEvent event, emit)async{

      try{
        ListUsers listeUsers = await usersRepository.searchUsers(event.key, event.currentPage, event.pageSize);
        int totalPage = (listeUsers.totalCount / event.pageSize).floor();
        if(listeUsers.totalCount % event.pageSize !=0 )
          totalPage = totalPage+1;

        List<User> currentList = [...state.users];

        state.users.addAll(listeUsers.items);
        emit(SearchUsersSuccessState(
            key : event.key,
            users : currentList,
            currentPage: event.currentPage,
            totalePages : totalPage ,
            pageSize : event.pageSize
        ));
      } catch(ex) {
        emit(SearchUsersErrorState( key : event.key,
            users : state.users,
            currentPage: event.currentPage,
            totalePages : state.totalePages ,
            pageSize : event.pageSize,error : ex.toString()));
      }
    });
  }
}
