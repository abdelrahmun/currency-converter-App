import 'package:currency_converter/data/models/local/currency_local_model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarController {
  /// The Store of this app.
  final Isar isar;

  IsarController._create(this.isar) {
    // Add any additional setup code, e.g. build queries.
  }

  /// Create an instance of Isar to use throughout the app.
  static Future<IsarController> create() async {
    final dir = await getApplicationDocumentsDirectory();
    final isarInstance = await Isar.open(
      relaxedDurability: true,
      [CurrencyLocalModelSchema],
      directory: dir.path,
    );
    return IsarController._create(isarInstance);
  }
}
