import 'package:bloc/bloc.dart';
import 'package:reddit_clone/repository/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  late PostRepository postRepository;

  PostBloc({required this.postRepository}) : super(PostInitial()) {
    on<PostEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
