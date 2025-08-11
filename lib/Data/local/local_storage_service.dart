import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';

class LocalStorageService {
  static const String boxName = 'favorites';
  final Dio _dio = Dio();

  Future<void> saveImage(String url) async {
    var box = await Hive.openBox(boxName);

    // Download image
    final directory = await getApplicationDocumentsDirectory();
    final path =
        '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';

    // Save image locally using Dio
    await _dio.download(url, path);

    // Save path to Hive
    box.add(path);
  }

  Future<List<String>> getFavoriteImages() async {
    var box = await Hive.openBox(boxName);
    return box.values.cast<String>().toList();
  }
}
