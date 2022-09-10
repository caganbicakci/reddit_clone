part of 'post_bloc.dart';

abstract class PostState {}

class PostInitial extends PostState {}

class PostLoadingState extends PostState {}

class PostLoadedState extends PostState {
  List<Child>? posts;
  PostLoadedState({required this.posts});
}
