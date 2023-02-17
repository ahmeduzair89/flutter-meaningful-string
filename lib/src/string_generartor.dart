library flutter_meaningful_string;

import 'dart:math';
import 'package:flutter_meaningful_string/data/wordsList.dart';

class FlutterMeaningfulString {
  static String generate({
    int numberOfWords = 2,
    String seperator = "-",
    int maxSingleWordLength = 8,
    int minSingleWordLength = 3,
  }) {
    assert(numberOfWords < 2, "numberOfWords must be greater than two");
    assert(
        maxSingleWordLength > 10, "maxSingleWordLength must be less than 10");
    assert(minSingleWordLength < 3, "minSingleWordLength must be less than 3");
    assert(minSingleWordLength > maxSingleWordLength,
        "minSingleWordLength must be less than maxSingleWordLength");
    final random = Random();
    String id = "";
    for (int i = 0; i < numberOfWords; i++) {
      i != 0 ? id = id + seperator : null;
      if (i % 2 == 1) {
        String noun = "";
        while (noun.isEmpty) {
          int nounlength =
              random.nextInt(maxSingleWordLength - minSingleWordLength + 1) +
                  minSingleWordLength;
          List<String> nouns = [];
          for (int j = 0; j < WordsList.nouns.length; j++) {
            if (WordsList.nouns[j].length <= nounlength) {
              nouns.add(WordsList.nouns[j]);
            }
          }
          noun = nouns[random.nextInt(nouns.length)];
          id = id + noun;
        }
      } else {
        String adjective = "";
        while (adjective.isEmpty) {
          int adjectivesLength =
              random.nextInt(maxSingleWordLength - minSingleWordLength + 1) +
                  minSingleWordLength;
          List<String> adjectives = [];
          for (int j = 0; j < WordsList.adjectives.length; j++) {
            if (WordsList.adjectives[j].length <= adjectivesLength) {
              adjectives.add(WordsList.adjectives[j]);
            }
          }
          adjective = adjectives[random.nextInt(adjectives.length)];
        }
        id = id + adjective;
      }
    }
    return id;
  }
}
