import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tau/models/mood_dto.dart';
import 'package:tau/utils/oauth.dart';

part 'mood_repo.g.dart';

@Riverpod(dependencies: [])
Future<bool> loginWithOAuth(LoginWithOAuthRef ref) async {
  return await Supabase.instance.client.auth.signInWithOAuth(
    googleOAuthProvider,
    redirectTo: 'taumh://login-callback',
    // redirectTo:
    // kIsWeb
    //     ? null
    //     :
    // 'https://vobmagvouahifxtwklqo.supabase.co/auth/v1/callback',
  );
}

@Riverpod(dependencies: [])
User user(UserRef ref) {
  final user = Supabase.instance.client.auth.currentUser;

  return user ??
      const User(
        id: '',
        appMetadata: {},
        userMetadata: {},
        aud: '',
        createdAt: '',
      );
}

@Riverpod(dependencies: [])
MoodRepository moodRepository(MoodRepositoryRef ref) => MoodRepository();

class MoodRepository {
  Future<List<MoodDto>> getAllMoods(String userId) async {
    final response = await Supabase.instance.client.rest
        .from('mood_logs')
        .select()
        .eq('user_id', userId)
        .order('date_time');

    if (response.error != null) {
      throw response.error!;
    }

    final moods = response.data as List<dynamic>;
    return moods.map((m) => MoodDto.fromMap(m)).toList();
  }

  Future<void> addMoodLog(String userId, MoodDto mood) async {
    final response = await Supabase.instance.client.rest
        .from('mood_logs')
        .insert(mood.toMap()..['user_id'] = userId)
        .select();

    if (response.error != null) {
      throw response.error!;
    }
  }

  Future<void> deleteMoodLog(String userId, String moodId) async {
    final response = await Supabase.instance.client.rest
        .from('mood_logs')
        .delete()
        .eq('user_id', userId)
        .eq('id', moodId)
        .select();

    if (response.error != null) {
      throw response.error!;
    }
  }
}
