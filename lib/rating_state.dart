part of 'cubit_score.dart';

class RatingState{
   final int blocscore;
   final int cubitscore;

  RatingState({required this.blocscore, required this.cubitscore});
   RatingState copyWith({int? blocscore,int? cubitscore}){
    return RatingState(blocscore: blocscore ?? this.blocscore, cubitscore: cubitscore ?? this.cubitscore );
  }
}