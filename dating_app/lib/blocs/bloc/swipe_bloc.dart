import 'package:bloc/bloc.dart';
import 'package:dating_app/models/user_model.dart';
import 'package:equatable/equatable.dart';

part 'swipe_event.dart';
part 'swipe_state.dart';

class SwipeBloc extends Bloc<SwipeEvent, SwipeState> {
  SwipeBloc() : super(SwipeLoading()) {
    on<SwipeEvent>((event, emit) {
      if (event is LoadUsersEvent) {
        emit(_mapLoadUserToState(event));
      }
      if (event is SwipeLeftEvent) {
        emit(_mapSwipeLeftToState(event, state));
      }
      if (event is SwipeRightEvent) {
        emit(_mapSwipeRightToState(event, state));
      }
    });
  }

  SwipeState _mapLoadUserToState(LoadUsersEvent event) {
    return SwipeLoaded(users: event.users);
  }

  SwipeState _mapSwipeLeftToState(SwipeLeftEvent event, SwipeState state) {
    if (state is SwipeLoaded) {
      try {
        List<User> users = List.from(state.users)..remove(event.user);
        return SwipeLoaded(users: users);
      } catch (_) {}
    }
    return SwipeError();
  }

  SwipeState _mapSwipeRightToState(SwipeRightEvent event, SwipeState state) {
    if (state is SwipeLoaded) {
      try {
        List<User> users = List.from(state.users)..remove(event.user);
        return SwipeLoaded(users: users);
      } catch (_) {}
    }
    return SwipeError();
  }
}
