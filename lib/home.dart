import 'package:flutter/material.dart';

class TableScreen extends StatefulWidget {
  const TableScreen({Key? key}) : super(key: key);

  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  TextEditingController txtnumber = TextEditingController();
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 1,
            backgroundColor: Colors.teal,
            centerTitle: true,
            title: Text(
              "Table",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontSize: 18),
            ),
            leading: Center(
              child: Icon(
                Icons.calculate_sharp,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                setState(() {
                  value = 0;
                });
              },
              child: Icon(Icons.close),
              backgroundColor: Colors.teal),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: txtnumber,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.teal,

                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
                          hintText: "Enter Value For Multification Table",
                          suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  value = int.parse(txtnumber.text);
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Icon(
                                  Icons.done,
                                  color: Colors.teal,
                                  size: 30,
                                ),
                              ))),
                    ),
                    SizedBox(height: 20),
                    Visibility(
                      visible: value == 0 ? false : true,
                      child: SizedBox(
                          height: 575,
                          width: 300,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  height: 45,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    color: Colors.teal.shade50,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.teal.shade100),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "$value X",
                                        style: TextStyle(
                                            fontSize: 15,
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "${index + 1} =",
                                        style: TextStyle(
                                            fontSize: 15,
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "${value * (index + 1)}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ));
                            },
                            itemCount: 10,
                          )),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
