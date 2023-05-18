import 'package:account_manager/utils/database/dbHelper.dart';
import 'package:get/get.dart';

class DetailController extends GetxController
{
  RxList<Map> dataList = <Map>[].obs;

  void getData()
  {
    dataList.value = DBHelper.dbHelper.readDB() as List<Map>;
  }

  void deleteData()
  {
  }

  void updateData()
  {
  }
}