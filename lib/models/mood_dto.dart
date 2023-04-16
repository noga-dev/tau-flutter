class MoodDto {
  final String id;
  final int moodValue;
  final DateTime dateTime;

  MoodDto({required this.id, required this.moodValue, required this.dateTime});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'mood_value': moodValue,
      'date_time': dateTime.toIso8601String(),
    };
  }

  static MoodDto fromMap(Map<String, dynamic> map) {
    return MoodDto(
      id: map['id'],
      moodValue: map['mood_value'],
      dateTime: DateTime.parse(map['date_time']),
    );
  }
}
