import 'package:felicitup/domain/repositories/repositories.dart';
import 'package:felicitup/infraestructure/repositories/database_repository_impl.dart';
import 'package:felicitup/infraestructure/resources/resources_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final databaseProvider = Provider<DatabaseRepository>((ref) => DatabaseRepositoryImpl(DatabaseResourceFirebase(ref)));
