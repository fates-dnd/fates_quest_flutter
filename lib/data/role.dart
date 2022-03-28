import 'package:hive/hive.dart';

part 'role.g.dart';

@HiveType(typeId: 2)
enum Role {
  @HiveField(0)
  fighter,

  @HiveField(1)
  invoker,

  @HiveField(2)
  ranger,

  @HiveField(3)
  naturalist,

  @HiveField(4)
  doctor,

  @HiveField(5)
  spy,

  @HiveField(6)
  magician,

  @HiveField(7)
  wizard,
}
