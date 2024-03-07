import 'package:felicitup/domain/repositories/repositories.dart';
import 'package:felicitup/infraestructure/repositories/repositories_impl.dart';
import 'package:felicitup/infraestructure/resources/resources_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = Provider<UserRepository>((ref) => UserRepositoryImpl(UserResourceFirebase(ref)));
