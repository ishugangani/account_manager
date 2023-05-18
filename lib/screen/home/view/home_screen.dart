import 'package:account_manager/screen/detail/controller/detail_controller.dart';
import 'package:account_manager/utils/database/dbHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DetailController DC = DetailController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Your Transaction",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xff393E46),
        ),
        backgroundColor: Color(0xff393E46),
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xff222831),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "No.of Transactions",
                        style: TextStyle(
                          fontSize: 25,
                          color: Color(0xff00ADB5),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "${DC.dataList.length}",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xffEEEEEE),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListView.builder(
                itemCount: DC.dataList.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Color(0xff222831),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: DC.dataList[index]['Status']==0?Colors.green:Colors.red,
                        width: 1.5,
                      ),
                    ),
                    child: ListTile(
                      title: Text("${DC.dataList[index]['Category']}"),
                      subtitle: Text("${DC.dataList[index]['Amount']}"),
                      leading: Text("${DC.dataList[index]['id']}"),
                      trailing: Row(
                        children: [
                          IconButton(
                            onPressed: () {

                            },
                            icon: Icon(Icons.edit,color: Color(0xff00ADB5),),
                          ),
                          IconButton(
                            onPressed: () {
                              DBHelper.dbHelper.deleteDB(DC.dataList[index]['id']);
                            },
                            icon: Icon(Icons.delete,color: Color(0xff00ADB5),),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
