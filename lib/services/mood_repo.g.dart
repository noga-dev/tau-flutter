// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$supabaseClientHash() => r'fc4a92addb9adb689fea195046ff28135a66aaf3';

/// See also [supabaseClient].
@ProviderFor(supabaseClient)
final supabaseClientProvider = AutoDisposeProvider<SupabaseClient>.internal(
  supabaseClient,
  name: r'supabaseClientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$supabaseClientHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>[],
);

typedef SupabaseClientRef = AutoDisposeProviderRef<SupabaseClient>;
String _$loginWithOAuthHash() => r'ab715ad581a82464bcc308a38643fa4d335aaec6';

/// See also [loginWithOAuth].
@ProviderFor(loginWithOAuth)
final loginWithOAuthProvider = AutoDisposeFutureProvider<bool>.internal(
  loginWithOAuth,
  name: r'loginWithOAuthProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loginWithOAuthHash,
  dependencies: <ProviderOrFamily>[supabaseClientProvider],
  allTransitiveDependencies: <ProviderOrFamily>[supabaseClientProvider],
);

typedef LoginWithOAuthRef = AutoDisposeFutureProviderRef<bool>;
String _$userHash() => r'5bfdc350c024ab796de80ca0b11e9916ad82bbda';

/// See also [user].
@ProviderFor(user)
final userProvider = AutoDisposeProvider<User>.internal(
  user,
  name: r'userProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userHash,
  dependencies: <ProviderOrFamily>[supabaseClientProvider],
  allTransitiveDependencies: <ProviderOrFamily>[supabaseClientProvider],
);

typedef UserRef = AutoDisposeProviderRef<User>;
String _$moodRepositoryHash() => r'612070066b96d5938fecd2b44d9b240fa05a679c';

/// See also [moodRepository].
@ProviderFor(moodRepository)
final moodRepositoryProvider = AutoDisposeProvider<MoodRepository>.internal(
  moodRepository,
  name: r'moodRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$moodRepositoryHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>[],
);

typedef MoodRepositoryRef = AutoDisposeProviderRef<MoodRepository>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
