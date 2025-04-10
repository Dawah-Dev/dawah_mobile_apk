import 'package:dawah_mobile_application/feature/common/data/model/video_info_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;
  final String videoTable = 'videoInfoTable';

  Future<Database> getDB() async {
    if (_database != null) return _database!;
    final path = join(await getDatabasesPath(), 'my_database.db');
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE $videoTable (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          vid TEXT,
          title TEXT,
          description TEXT,
          author TEXT,
          uploading TEXT,
          vlenth TEXT,
          thum TEXT,
          clogo TEXT
        )
      ''');
      },
    );
    return _database!;
  }

  Future<void> insertVideo(VideoInfoModel vmodel) async {
    final db = await getDB();
    await db.rawInsert(
      'INSERT INTO $videoTable (vid, title, description, author, uploading, vlenth, thum, clogo) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
      [
        vmodel.vid,
        vmodel.title,
        vmodel.description,
        vmodel.author,
        vmodel.uploading,
        vmodel.vlenth,
        vmodel.thum,
        vmodel.clogo,
      ],
    );
  }

  Future<List<Map<String, dynamic>>> getInterleavedVideos() async {
    final db = await getDB();
    return await db.rawQuery(
        '''
    WITH recent AS (
      SELECT *, ROW_NUMBER() OVER (ORDER BY uploading DESC) as rn
      FROM $videoTable
    ),
    random AS (
      SELECT *, ROW_NUMBER() OVER (ORDER BY RANDOM()) as rn
      FROM $videoTable
    )
    SELECT * FROM (
      SELECT rn as group_id, 1 as order_in_group, * FROM recent
      UNION ALL
      SELECT rn as group_id, 2 as order_in_group, * FROM random
    )
    ORDER BY group_id, order_in_group;
    '''
    );
  }

  Future<List<Map<String, dynamic>>> getRecommendVideos() async {
    final db = await getDB();
    return await db.rawQuery('SELECT * FROM $videoTable ORDER BY RANDOM() LIMIT 10');
  }

  Future<List<Map<String, dynamic>>> getserialvideo() async {
    final db = await getDB();
    return await db.rawQuery('SELECT * FROM $videoTable ORDER BY uploading DESC');
  }
}
