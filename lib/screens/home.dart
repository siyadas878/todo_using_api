import 'package:flutter/material.dart';
import 'package:todo_api/domain/fetch_data/fetch_data.dart';
import 'package:todo_api/infrastructure/api_calls/delete.dart';
import 'package:todo_api/infrastructure/api_calls/fetch_data.dart';
import 'package:todo_api/infrastructure/api_calls/logout.dart';
import 'package:todo_api/infrastructure/api_calls/post_data.dart';

class Home extends StatelessWidget {
  final String token;
  final String email;
  final int? taskid;
  Home({Key? key, required this.token, required this.email, this.taskid})
      : super(key: key);

  final TextEditingController taskcontroller = TextEditingController();
  final TextEditingController detailcontroller = TextEditingController();
  final TextEditingController datecontroller = TextEditingController();
  final TextEditingController timecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('To-Do'), actions: [
        IconButton(
            onPressed: () {
              logout(context, token);
            },
            icon: const Icon(Icons.logout))
      ]),
      body: SafeArea(
        child: FutureBuilder<List<FetchData>>(
          future: fetchData(token),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data == null) {
              return const Center(child: Text('No data available.'));
            }

            final List<FetchData> data = snapshot.data!;

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final fetchItem = data[index];
                return ListTile(
                  leading:
                      CircleAvatar(child: Text(fetchItem.taskId.toString())),
                  title: Text(fetchItem.task!),
                  subtitle: Text(fetchItem.taskDetails!),
                  trailing: IconButton(
                      onPressed: () {
                        deletetask(context, email, fetchItem.taskId as int,
                            token);                             
                      },
                      icon: const Icon(Icons.delete)),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return SizedBox(
                height: 500,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            controller: taskcontroller,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              labelText: 'task',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          TextField(
                            controller: detailcontroller,
                            decoration: const InputDecoration(
                              labelText: 'detail',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          TextField(
                            controller: datecontroller,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              labelText: 'date',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          TextField(
                            controller: timecontroller,
                            decoration: const InputDecoration(
                              labelText: 'time',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              addPost(
                                  context,
                                  email,
                                  taskcontroller.text,
                                  detailcontroller.text,
                                  datecontroller.text,
                                  timecontroller.text,
                                  token);
                              Navigator.pop(context);
                              taskcontroller.clear();
                              detailcontroller.clear();
                              datecontroller.clear();
                              timecontroller.clear();
                            },
                            child: const Text('Add'),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
