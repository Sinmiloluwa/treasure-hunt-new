import 'package:treasure_hunt/services/api_service.dart';
import 'dart:convert';

class HuntService {
  Future getHunts(String filter) async {
    final response = await ApiService.get('/hunts?$filter=true');
    if (response.statusCode == 200) {
      final huntData = json.decode(response.body);
      final hunts = huntData['data'];
      return hunts;
    } else {
      throw Exception('Failed to fetch hunts: \\n${response.body}');
    }
  }
}