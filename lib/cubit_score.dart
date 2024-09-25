import 'package:flutter_bloc/flutter_bloc.dart';
part 'rating_state.dart';
class Ratingcubit extends Cubit<RatingState> {
  Ratingcubit() : super(RatingState(blocscore: 0, cubitscore: 0));

  void upvoteBloc(){
    emit(state.copyWith(blocscore: state.blocscore+1));
    //emit(RatingState(blocscore: state.blocscore +1, cubitscore: state.cubitscore));
  }
  void upvoteCubit(){
    //emit(RatingState(blocscore: state.blocscore , cubitscore: state.cubitscore +1));
    emit(state.copyWith(cubitscore: state.cubitscore+1));
  }
}