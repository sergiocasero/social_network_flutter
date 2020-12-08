import 'package:social_network_flutter/model/Media.dart';

class Year {
  final String label;
  final List<Month> child;

  Year(this.label, this.child);

  List<Media> getMedia() {
    final media = <Media>[];
    for (final month in child) {
      media.addAll(month.getMedia());
    }
    return media;
  }
}

class Month {
  final String label;
  final List<Day> child;

  Month(this.label, this.child);

  List<Media> getMedia() {
    final media = <Media>[];
    for (final day in child) {
      media.addAll(day.child);
    }
    return media;
  }
}

class Day {
  final String label;
  final List<Media> child;

  Day(this.label, this.child);
}
