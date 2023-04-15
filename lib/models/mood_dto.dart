class Mood {
  final String id;
  final int moodValue;
  final DateTime dateTime;

  Mood({required this.id, required this.moodValue, required this.dateTime});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'mood_value': moodValue,
      'date_time': dateTime.toIso8601String(),
    };
  }

  static Mood fromMap(Map<String, dynamic> map) {
    return Mood(
      id: map['id'],
      moodValue: map['mood_value'],
      dateTime: DateTime.parse(map['date_time']),
    );
  }
}
