import 'package:eshopapp/Constants/constance.dart';
import 'package:eshopapp/model/cart_product_model.dart';
import 'package:eshopapp/model/product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDataBaseHelper{
  CartDataBaseHelper._();
    static final CartDataBaseHelper db=CartDataBaseHelper._();
  static Database? _database;
  Future <Database?> get database async{
    if(_database != null)
      return _database;
    _database =await initDb();
    return _database;
  }

  initDb() async{
    String path=join(await getDatabasesPath(),'CartProduct.dp');
    return await openDatabase(path,version: 2,onCreate: (Database db,int version)async{
      await db.execute('''
      CREATE TABLE $tableCartProduct (
      $columnName TEXT NOT NULL,
      $columnPrice TEXT NOT NULL,
      $columnImage TEXT NOT NULL,
      $columnQuantity INTEGER NOT NULL,
      $columnId TEXT NOT NULL,
      $columnSize TEXT NOT NULL,
      $columnColor TEXT NOT NULL
      )
      ''');
    });
  }


  insert(CartProductModel model)async{
    var dbClient=await database;
    await dbClient!.insert(tableCartProduct, model.toJson(),conflictAlgorithm: ConflictAlgorithm.replace);
  }
  Future <List<CartProductModel>> getAllProdcut() async{
    var dbClient=await database;
    List<Map>maps=await dbClient!.query(tableCartProduct);
    List<CartProductModel>list=maps.isNotEmpty?maps.map((prodcuts) => CartProductModel.fromJson(prodcuts)).toList():[];
    return list;
  }
  updateProduct(CartProductModel model)async{
  var dbClient=await database;
return await dbClient!.update(tableCartProduct, model.toJson(),where: '$columnId = ?',whereArgs: [model.id]);
}
  deleteProduct()async{
    var dbClient=await database;
    return await dbClient!.delete(tableCartProduct);
  }
}