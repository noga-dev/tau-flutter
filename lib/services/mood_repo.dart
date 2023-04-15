import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tau/models/mood_dto.dart';
import 'package:tau/utils/oauth.dart';

part 'mood_repo.g.dart';

@Riverpod(dependencies: [])
SupabaseClient supabaseClient(SupabaseClientRef ref) {
  final supabaseClient = Supabase.instance.client;
  return supabaseClient;
}

@Riverpod(dependencies: [supabaseClient])
Future<bool> loginWithOAuth(LoginWithOAuthRef ref) async {
  ref.watch(supabaseClientProvider).auth.signInWithOAuth(
        googleOAuthProvider,
      );
  return true;
}

@Riverpod(dependencies: [supabaseClient])
User user(UserRef ref) {
  final user = ref.watch(supabaseClientProvider).auth.currentUser;

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
  Future<List<Mood>> getAllMoods(String userId) async {
    final response = await Supabase.instance.client.rest
        .from('mood_logs')
        .select()
        .eq('user_id', userId)
        .order('date_time');

    if (response.error != null) {
      throw response.error!;
    }

    final moods = response.data as List<dynamic>;
    return moods.map((m) => Mood.fromMap(m)).toList();
  }

  Future<void> addMoodLog(String userId, Mood mood) async {
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
