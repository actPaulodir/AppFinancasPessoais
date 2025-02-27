import '../database.dart';

class PostsTable extends SupabaseTable<PostsRow> {
  @override
  String get tableName => 'posts';

  @override
  PostsRow createRow(Map<String, dynamic> data) => PostsRow(data);
}

class PostsRow extends SupabaseDataRow {
  PostsRow(super.data);

  @override
  SupabaseTable get table => PostsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  dynamic get featuredImages => getField<dynamic>('featured_images');
  set featuredImages(dynamic value) =>
      setField<dynamic>('featured_images', value);

  String get slug => getField<String>('slug')!;
  set slug(String value) => setField<String>('slug', value);

  String get uniqueId => getField<String>('unique_id')!;
  set uniqueId(String value) => setField<String>('unique_id', value);

  String? get excerpt => getField<String>('excerpt');
  set excerpt(String? value) => setField<String>('excerpt', value);

  String? get content => getField<String>('content');
  set content(String? value) => setField<String>('content', value);

  String? get author => getField<String>('author');
  set author(String? value) => setField<String>('author', value);

  String? get authorProfile => getField<String>('author_profile');
  set authorProfile(String? value) => setField<String>('author_profile', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  DateTime? get deletedAt => getField<DateTime>('deleted_at');
  set deletedAt(DateTime? value) => setField<DateTime>('deleted_at', value);

  DateTime? get publishDate => getField<DateTime>('publish_date');
  set publishDate(DateTime? value) => setField<DateTime>('publish_date', value);
}
