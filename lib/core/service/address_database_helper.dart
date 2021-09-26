import 'package:eshopapp/Constants/constance.dart';
import 'package:eshopapp/model/cart_product_model.dart';
import 'package:eshopapp/model/order_model.dart';
import 'package:eshopapp/model/product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class addressDatabaseHelper {
  addressDatabaseHelper._();
  static final addressDatabaseHelper db = addressDatabaseHelper._();
  static Database? _database;
  Future <Database?> get database async {
    if (_database != null)
      return _database;
    _database = await initDb();
    return _database;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'MyAddresses.dp');
    return await openDatabase(
        path, version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE $tableAddress (
      $columnStreet1 TEXT NOT NULL,
      $columnStreet2 TEXT NOT NULL,
      $columnState TEXT NOT NULL,
      $columnCountry TEXT NOT NULL,
      $columnCity TEXT NOT NULL,
      $columnPhoneNumber TEXT NOT NULL
      )
      ''');
    });
  }

  insert(AddressInfo model) async {
    var dbClient = await database;
    await dbClient!.insert(tableAddress, model.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future <List<AddressInfo>> getAllProdcut() async {
    var dbClient = await database;
    List<Map>maps = await dbClient!.query(tableAddress);
    List<AddressInfo>list = maps.isNotEmpty ? maps.map((prodcuts) =>
        AddressInfo.fromMap(prodcuts)).toList() : [];
    return list;
  }
  Future<dynamic>deleteproduct(String street1)async{
    var dbClient=await database;
    return await dbClient!.delete(tableAddress,where: '$columnStreet1 = ?',whereArgs: [street1]);
  }
}