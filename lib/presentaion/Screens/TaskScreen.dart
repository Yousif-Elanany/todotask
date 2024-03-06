// ignore_for_file: non_constant_identifier_names, avoid_print, unused_local_variable, prefer_typing_uninitialized_variables

import 'dart:collection';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:todotask/data/Model/TaskModel.dart';
import 'package:todotask/features/CustomButton.dart';
import 'package:todotask/features/CustomTextField.dart';
import 'package:todotask/presentaion/widgets/ListView-Item.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  void initState() {
    get_all_Data();
    super.initState();
  }

  TextEditingController Titlecontroller = TextEditingController();
  TextEditingController DateController = TextEditingController();
  CollectionReference task = FirebaseFirestore.instance.collection('Tasks');
  List list_Not = [];
  List list_Done = [];
  List allData = [];
  get_all_Data() async {
    setState(() {
      list_Not = [];
      list_Done = [];
    });
    QuerySnapshot data = await FirebaseFirestore.instance.collection('Tasks').get();
    allData = data.docs.map((doc) => doc.data()).toList();
    print(allData);
// ========================================================================
    for (var ii = 0; ii < allData.length; ii++) {
      if (allData[ii]['status'] == true) {
        list_Done.add(allData[ii]);
      } else {
        list_Not.add(allData[ii]);
      }
    }


    print(list_Not);

    print('//////////////////////////////////');

    print(list_Done);
  }

  add_one_Data({id, date, bool status = false, content}) async {
    await get_all_Data();
    await FirebaseFirestore.instance.collection('Tasks').doc('$id').set({
      'id': '$id',
      'date': '$date',
      'status': status,
      'content': '$content',
    });
    print('//////////////////////////////////  add');
  }

  update_one_Data({id, date, bool status = false, content}) async {
     await get_all_Data();
    await FirebaseFirestore.instance.collection('Tasks').doc('$id').set({
      'id': '$id',
      'date': '$date',
      'status': status,
      'content': '$content',
    });
    print('//////////////////////////////////  update');
  }

  bool show = false;

  bool show1 = false;
  bool show2 = false;




  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: task.get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SafeArea(
              child: Scaffold(
                body: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("Good Morning", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
                          // =========================================================================================================
                          // ElevatedButton(
                          //   child: const Text('data 111111111'),
                          //   onPressed: () async {
                          //     //
                          //     setState(() {
                          //       list_Not = [];
                          //       list_Done = [];
                          //     });

                          //     QuerySnapshot data = await FirebaseFirestore.instance.collection('Tasks').get();

                          //     QuerySnapshot snap = await FirebaseFirestore.instance.collection('Tasks').get();

                          //     // for (var i in snap.docs) {
                          //     //   list_document.add(i);
                          //     // }
                          //     List allData = data.docs.map((doc) => doc.data()).toList();

                          //     // print(allData);

                          //     // if () {
                          //     //   list_document.add('');
                          //     // }

                          //     for (var ii = 0; ii < allData.length; ii++) {
                          //       if (allData[ii]['status'] == true) {
                          //         list_Done.add(allData[ii]);
                          //       } else {
                          //         list_Not.add(allData[ii]);
                          //       }
                          //     }

                          //     print(list_Not);

                          //     print('//////////////////////////////////');

                          //     print(list_Done);
                          //   },
                          // ),

                          // ElevatedButton(
                          //   child: const Text('UPDate  777777'),
                          //   onPressed: () async {
                          //     //
                          //     setState(() {
                          //       list_Not = [];
                          //       list_Done = [];
                          //     });

                          //     QuerySnapshot data = await FirebaseFirestore.instance.collection('Tasks').get();
                          //     allData = data.docs.map((doc) => doc.data()).toList();
                          //     print(allData);

                          //     // if () {
                          //     //   list_document.add('');
                          //     // }

                          //     // print(list_document);

                          //     // print('//////////////////////////////////');

                          //     // print(list_document_Done);

                          //     await FirebaseFirestore.instance.collection('Tasks').doc('1').set({
                          //       'id': '1',
                          //       'date': '2020',
                          //       'status': true,
                          //       'content': '1',
                          //     });
                          //     print('//////////////////////////////////');
                          //     print(list_Done);
                          //   },
                          // ),

                          // CustomButon(
                          //   text: 'Save Task',
                          //   onTap: () async {
                          //     QuerySnapshot snap = await FirebaseFirestore.instance.collection('Tasks').get();
                          //     for (var i in snap.docs) {
                          //       list_Not.add(i.id.toString());
                          //     }
                          //     print(list_Not);

                          //     await FirebaseFirestore.instance.collection('Tasks').doc('4').set(
                          //       {
                          //         'id': '5',
                          //         'date': '2020',
                          //         'status': false,
                          //         'content': '1',
                          //       },
                          //     ).then((value) {
                          //       DateController.clear();
                          //       Titlecontroller.clear();

                          //       // Navigator.pop(context);
                          //     });
                          //   },
                          //   Height: 50,
                          // ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                            child: Row(
                              children: [
                                FilterChip(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  label: const Text(
                                    "All",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  onSelected: (bool value) {
                                    setState(() {
                                      show = true;
                                      show1=false;
                                      show2 = false;

                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                FilterChip(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  label: const Text(
                                    "Done",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  onSelected: (bool value) {
                                   setState(() {
                                      show = false;
                                      show1=true;
                                      show2 = false;

                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                FilterChip(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  label: const Text(
                                    "Not Done",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  onSelected: (bool value) {
                                        setState(() {
                                      show = false;
                                      show1=false;
                                      show2 = true;

                                    });

                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          
                      
                          show == true
                              ? SizedBox(
                                  height: MediaQuery.of(context).size.height / 2,
                                  child: Expanded(
                                    child: ListView.builder(
                                      itemCount: allData.length,
                                      itemBuilder: (context, index) {
                                        return ListviewItem(
                                          allData[index]['content'],
                                          allData[index]['date'],
                                        );
                                      },
                                    ),
                                  ),
                                )
                              : Container(),
                              show1 == true
                              ? SizedBox(
                                  height: MediaQuery.of(context).size.height / 2,
                                  child: Expanded(
                                    child: ListView.builder(
                                      itemCount: list_Done.length,
                                      itemBuilder: (context, index) {
                                        return ListviewItem(
                                           list_Done[index]['content'],
                                          list_Done[index]['date'],
                                        );
                                      },
                                    ),
                                  ),
                                )
                              : Container(),
                              show2 == true
                              ? SizedBox(
                                  height: MediaQuery.of(context).size.height / 2,
                                  child: Expanded(
                                    child: ListView.builder(
                                      itemCount: list_Not.length,
                                      itemBuilder: (context, index) {
                                        return ListviewItem(
                                         list_Not[index]['content'],
                                         list_Not[index]['date'],
                                        );
                                      },
                                    ),
                                  ),
                                )
                              : Container(),
                              
                          const SizedBox(
                            height: 20,
                          ),
// List list_Not = [];
 // List list_Done = [];
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.green[400],
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              child: SizedBox(
                                height: 50,
                                child: TextButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                        isScrollControlled: true,
                                        context: context,
                                        builder: ((context) {
                                          return Padding(
                                            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                            child: SingleChildScrollView(
                                              child: SizedBox(
                                                height: MediaQuery.of(context).size.height * 0.45,
                                                width: double.infinity,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(12.0),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Align(
                                                        alignment: Alignment.topRight,
                                                        child: IconButton(
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                          },
                                                          icon: const Icon(
                                                            Icons.close_rounded,
                                                            color: Colors.red,
                                                            size: 18,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      const Align(
                                                        alignment: Alignment.topLeft,
                                                        child: Text(
                                                          "Create New Task",
                                                          style: TextStyle(
                                                            fontSize: 25,
                                                            fontWeight: FontWeight.w600,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 8,
                                                      ),
                                                      SizedBox(
                                                        height: 50,
                                                        child: customSearchTextField(
                                                          labelText: "Task Title",
                                                          tybe: TextInputType.text,
                                                          hintText: "Task Title",
                                                          mycontroller: Titlecontroller,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 12,
                                                      ),
                                                      SizedBox(
                                                        height: 50,
                                                        child: customSearchTextField(
                                                          labelText: "Task Date",
                                                          tybe: TextInputType.text,
                                                          hintText: "Task Date",
                                                          onTap: () {
                                                            showDatePicker(
                                                                    context: context,
                                                                    firstDate: DateTime.now(),
                                                                    initialDate: DateTime.now(),
                                                                    lastDate: DateTime.parse('2024-05-03'))
                                                                .then((value) {
                                                              DateController.text = DateFormat.yMEd().format(value!);
                                                            });
                                                          },
                                                          mycontroller: DateController,
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      CustomButon(
                                                        text: 'Save Task',
                                                        onTap: ()async {
                                                        setState(()async {
                                                             await  add_one_Data(id:allData.length+1,status: false,content: Titlecontroller.text ,date: DateController.text
                                                         ).then((value) {
                                                            DateController.clear();
                                                            Titlecontroller.clear();

                                                            Navigator.pop(context);
                                                          });
                                                          
                                                        });

                                                 
                                                        },
                                                        Height: 50
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }));
                                  },
                                  child: const Text(
                                    "Create Task",
                                    style: TextStyle(color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Circleprogress();
          }
        });
  }
}

class Circleprogress extends StatelessWidget {
  const Circleprogress({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          strokeWidth: 3,
          color: Color.fromARGB(255, 124, 235, 129),
        ),
      ),
    );
  }
}
