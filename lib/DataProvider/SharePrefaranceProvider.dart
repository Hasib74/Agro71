import 'package:agro71/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePrefaranceDataProvider {
  SharedPreferences sp;

  SharePrefaranceDataProvider() {
    config_sp();
  }

  void config_sp() async {
    sp = await SharedPreferences.getInstance();
  }

  storeAdmin(context, adminType, token) async {
    sp.setStringList(globalData.admin_info, [adminType, token]);
  }

  Future<List<String>> readAdmin() async {
    return sp.getStringList(globalData.admin_info);
  }
}
