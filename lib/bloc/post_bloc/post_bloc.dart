import 'package:bloc/bloc.dart';
import 'package:reddit_clone/repository/post_repository.dart';

import '../../models/post_model.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  late PostRepository postRepository;

  PostBloc({required this.postRepository}) : super(PostInitial()) {
    List<Child>? postList;
    on<PostLoadEvent>((event, emit) async {
      emit(PostLoadingState());
      await postRepository.getPosts().then((value) {
        postList = value;
      });
      emit(PostLoadedState(posts: postList));
    });
  }
}
