import 'package:hackernews/src/src.dart';
import 'package:http/http.dart' as http;

class NewsService {
  static Future<bool> getLatestNews({required int pageNo}) async {
    String url =
        "https://hn.algolia.com/api/v1/search_by_date?tags=story&page=$pageNo";

    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        for (var dt in data["hits"]) {
          var news = HackerNews.fromJson(dt);

          // save it inside local database
          LocalDatabase.insertNews(news);
        }
        LocalDatabase.insertSaveTime(pageNo);
        return true;
      } else {
        print("Error in fetching api ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
