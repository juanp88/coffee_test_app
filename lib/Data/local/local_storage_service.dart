import 'package:hive/hive.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class LocalStorageService {
  static const String boxName = 'favorites';

  Future<void> saveImage(String url) async {
    var box = await Hive.openBox(boxName);

    // Download image
    final directory = await getApplicationDocumentsDirectory();
    final path =
        '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';

    // Save image locally
    final file = File(path);
    await file.writeAsBytes(await _downloadFile(url));

    // Save path to Hive
    box.add(path);
  }

  Future<List<String>> getFavoriteImages() async {
    var box = await Hive.openBox(boxName);
    return box.values.cast<String>().toList();
  }

  Future<List<int>> _downloadFile(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to download image');
    }
  }
}
