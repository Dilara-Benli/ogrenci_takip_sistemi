import 'package:flutter/material.dart';
import 'package:temel_widget/models/student.dart';
import 'package:temel_widget/screens/student_add.dart';
import 'package:temel_widget/screens/student_edit.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mesaj = "Öğrenci Takip Sistemi";

  Student selectedStudent = Student.withId(0, "", "", 0);

  List<Student> students = [
    Student.withId(1, "Dilara", "Benli", 90),
    Student.withId(2, "Ece", "Yılmaz", 30),
    Student.withId(3, "Algun", "Ay", 45)
  ];

  @override
  Widget build(BuildContext context) {
    //widget döndüren build fonk
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: Text(mesaj),
      ),
      body: buildBody(context),
    );
  }

  void mesajGoster(BuildContext context, String sms) {
    var alert = AlertDialog(
      title: Text("İşlem sonucu"),
      content: Text(sms),
    );

    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(students[index].image),
                    ),
                    title: Text(students[index].firstName +
                        " " +
                        students[index].lastName),
                    subtitle: Text("Sınavdan aldığı not: " +
                        students[index].grade.toString() +
                        " (" +
                        students[index].getStatus +
                        ")"),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: () {
                      setState(() {
                        //ekranın yeniden çizilmesi
                        selectedStudent = students[index];
                      });
                      print(selectedStudent.firstName);
                    },
                  );
                })),
        Text("Seçili öğrenci: " + selectedStudent.firstName),
        SizedBox(
          height: 20.0,
        ),
        Row(
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.cyan),
                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text("Add"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd(students)));
                },
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green),
                child: Row(
                  children: [
                    Icon(Icons.update),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text("Update"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentEdit(selectedStudent)));
                },
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.red),
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text("Delete"),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    students.remove(selectedStudent);
                  });
                  var sms = "Silindi " + selectedStudent.firstName;
                  mesajGoster(context, sms);
                },
              ),
            )
          ],
        )
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
