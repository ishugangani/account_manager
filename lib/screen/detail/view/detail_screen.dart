import 'package:account_manager/utils/database/dbHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  TextEditingController txtAmount = TextEditingController();
  TextEditingController txtCategory = TextEditingController();
  TextEditingController txtNotes = TextEditingController();
  TextEditingController txtPayType = TextEditingController();
  TextEditingController txtDate = TextEditingController(
      text:
          "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}");
  TextEditingController txtTime = TextEditingController(
      text: "${DateTime.now().hour}:${DateTime.now().minute}");
  TextEditingController txtStatus = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Your Transaction",style: TextStyle(color: Colors.white),),
          backgroundColor: Color(0xff393E46),
        ),
        backgroundColor: Color(0xff393E46),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              txtfield(controller: txtAmount, label: "Amount"),
              txtfield(controller: txtCategory, label: "Category"),
              txtfield(controller: txtNotes, label: "Notes"),
              txtfield(controller: txtPayType, label: "Paytype", hintText: "cash/bank/online"),
              txtfield(controller: txtDate, label: "Date", hintText: "dd/mm/yy"),
              txtfield(controller: txtTime, label: "Time", hintText: "hh:mm"),
              txtfield(controller: txtStatus, label: "Status", hintText: "income(0)/expense(1)"),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  DBHelper.dbHelper.inserDB(amount: txtAmount, cate: txtCategory, notes: txtNotes, paytype: txtPayType, date: txtDate, time: txtTime, status: txtStatus);
                  Get.toNamed('/');
                },
                child: Text("Add"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff00ADB5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget txtfield({required controller, required label, hintText}) {
    return Padding(
      padding: const EdgeInsets.only(top: 2, bottom: 2),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xffEEEEEE), width: 1.5),
          ),
        ),
      ),
    );
  }
}
