import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:wordle_clone/app/wordle/wordle.dart';
import 'package:wordle_clone/app/wordle/model/word_model.dart';
import 'package:wordle_clone/app/wordle/widgets/board_tile.dart';
import 'package:wordle_clone/app/wordle/model/letter_model.dart';

class Board extends StatelessWidget {
  const Board({Key? key, required this.board, required this.flipCardKeys})
    : super(key: key);

  final List<Word> board;
  final List<List<GlobalKey<FlipCardState>>> flipCardKeys;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          board
              .asMap()
              .map(
                (i, word) => MapEntry(
                  i,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        word.letters
                            .asMap()
                            .map(
                              (j, letter) => MapEntry(
                                j,
                                FlipCard(
                                  key: flipCardKeys[i][j],
                                  flipOnTouch: false,
                                  direction: FlipDirection.VERTICAL,
                                  front: BoardTile(
                                    letter: Letter(
                                      val: letter.val,
                                      status: LetterStatus.initial,
                                    ),
                                  ),
                                  back: BoardTile(letter: letter),
                                ),
                              ),
                            )
                            .values
                            .toList(),
                  ),
                ),
              )
              .values
              .toList(),
    );
  }
}
