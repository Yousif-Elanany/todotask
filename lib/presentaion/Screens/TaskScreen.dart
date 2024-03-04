import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:todotask/Data/Models/TaskModel.dart';
import 'package:todotask/features/CustomButton.dart';
import 'package:todotask/features/CustomTextField.dart';
import 'package:todotask/presentaion/widgets/ListView-Item.dart';

class TaskScreen extends StatefulWidget {
  TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  TextEditingController Titlecontroller = TextEditingController();
  TextEditingController DateController = TextEditingController();
  CollectionReference task = FirebaseFirestore.instance.collection('Tasks');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: task.get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<taskitem> taskslist = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              taskslist.add(
                taskitem.fromjson(
                  snapshot.data!.docs[i],
                ),
              );
            }
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
                          const Text(
                            "Good Morning",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                            child: Row(
                              children: [
                                FilterChip(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  label: const Text(
                                    "All",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  onSelected: (bool value) {},
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                FilterChip(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  label: const Text(
                                    "Done",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  onSelected: (bool value) {},
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                FilterChip(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  label: const Text(
                                    "Not Done",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  onSelected: (bool value) {},
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.65,
                            child: Expanded(
                              child: ListView.builder(
                                itemCount: taskslist.length,
                                itemBuilder: (context, index) {
                                  return ListviewItem(
                                    TaskItem: taskslist[index],
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
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
                              child: Container(
                                height: 50,
                                child: TextButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                        isScrollControlled: true,
                                        context: context,
                                        builder: ((context) {
                                          return Padding(
                                            padding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom),
                                            child: SingleChildScrollView(
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.45,
                                                width: double.infinity,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            Alignment.topRight,
                                                        child: IconButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
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
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Text(
                                                          "Create New Task",
                                                          style: TextStyle(
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 8,
                                                      ),
                                                      SizedBox(
                                                        height: 50,
                                                        child:
                                                            customSearchTextField(
                                                          labelText:
                                                              "Task Title",
                                                          tybe: TextInputType
                                                              .text,
                                                          hintText:
                                                              "Task Title",
                                                          mycontroller:
                                                              Titlecontroller,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 12,
                                                      ),
                                                      SizedBox(
                                                        height: 50,
                                                        child:
                                                            customSearchTextField(
                                                          labelText:
                                                              "Task Date",
                                                          tybe: TextInputType
                                                              .text,
                                                          hintText: "Task Date",
                                                          onTap: () {
                                                            showDatePicker(
                                                                    context:
                                                                        context,
                                                                    firstDate:
                                                                        DateTime
                                                                            .now(),
                                                                    initialDate:
                                                                        DateTime
                                                                            .now(),
                                                                    lastDate: DateTime
                                                                        .parse(
                                                                            '2024-05-03'))
                                                                .then((value) {
                                                              DateController
                                                                      .text =
                                                                  DateFormat
                                                                          .yMEd()
                                                                      .format(
                                                                          value!);
                                                            });
                                                          },
                                                          mycontroller:
                                                              DateController,
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      CustomButon(
                                                        text: 'Save Task',
                                                        onTap: () {
                                                          task.add({
                                                            'Task-Date':
                                                                DateController
                                                                    .text,
                                                            'Task-Status':
                                                                false,
                                                            'Task-content':
                                                                Titlecontroller
                                                                    .text
                                                          }).then((value) {
                                                            DateController
                                                                .clear();
                                                            Titlecontroller
                                                                .clear();

                                                            Navigator.pop(
                                                                context);
                                                          });
                                                        },
                                                        Height: 50,
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
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
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
