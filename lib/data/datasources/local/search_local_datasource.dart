import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/core/error/exceptions.dart';

class SearchLocalDataSource {
  final SharedPreferences sharedPreferences;

  SearchLocalDataSource({this.sharedPreferences});

  Future<List<String>> fetchSearchHistory() async {
    List<String> histories = sharedPreferences.getStringList('SearchHistory');
    if (histories != null) {
      return histories;
    } else {
      throw CacheNotExistException();
    }
  }

  Future<List<String>> addSearchHistory(String searchKeyWords) async {
    //1.查询key对应的内容是否存在
    //2.不存在就创建且插入一条搜索记录，否则获取之前的搜索记录，并将新的搜索记录添加进去
    //3.保存
    List<String> histories = [];
    if (!sharedPreferences.containsKey('SearchHistory')) {
      histories.add(searchKeyWords);
    } else {
      histories = sharedPreferences.getStringList('SearchHistory');
      histories.insert(0, searchKeyWords);
    }
    bool isSuccess = await sharedPreferences.setStringList('SearchHistory', histories);
    if (isSuccess) {
      return histories;
    } else {
      //异常
      throw CacheSaveException();
    }
  }

  Future<bool> removeAllHistory() async {
    return await sharedPreferences.remove('SearchHistory');
  }
}
