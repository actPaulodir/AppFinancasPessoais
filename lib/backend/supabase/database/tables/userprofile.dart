import '../database.dart';

class UserprofileTable extends SupabaseTable<UserprofileRow> {
  @override
  String get tableName => 'userprofile';

  @override
  UserprofileRow createRow(Map<String, dynamic> data) => UserprofileRow(data);
}

class UserprofileRow extends SupabaseDataRow {
  UserprofileRow(super.data);

  @override
  SupabaseTable get table => UserprofileTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get bio => getField<String>('bio');
  set bio(String? value) => setField<String>('bio', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
