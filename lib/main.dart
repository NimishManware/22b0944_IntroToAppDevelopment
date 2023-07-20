import 'package:flutter/material.dart';
import 'catagory.dart';

void main() {
  runApp(MaterialApp(
    title: 'My App',
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      '/expense': (context) => expense(),
    },
  ));
}
List <Catagory> Expenses = [
  Catagory(name: 'Apples',price: -500),
  Catagory(name: 'Bananas',price: -300),
  Catagory(name: 'Mangoes',price: -500),
  Catagory(name: 'Salary',price: 150)
];

class PopupCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[500],
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'New Entry',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Category:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Price:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the pop-up
                },
                child: Icon(Icons.check),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.grey[800], // Set the text color of the button
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Catagory Bill = Catagory(name: 'Total',price: -1150);
Widget catagorycards(Catagory Catagory){
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      color: Colors.blue[300],
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                Catagory.name,
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
              ),
            ),
            SizedBox(width: 60),
            Text(
              '${Catagory.price}',
            ),
          ],
        ),
      ),
    ),
  );
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        title: Text('Budget Tracker'),
        centerTitle: true,
        backgroundColor: Colors.yellow[700],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            CircleAvatar(
              backgroundImage: AssetImage('assets/Goku.png'),
              radius: 40.0,
            ),
            SizedBox(height: 30),
            Text(
              'Welcome, Nimish',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20.0,
            )
            ),
            catagorycards(Bill),
            SizedBox(height: 150),
            FloatingActionButton(
              onPressed: () { Navigator.pushNamed(context, '/expense');},
              child: Icon(
                Icons.arrow_circle_right_rounded,
                size: 50, // Adjust the value as per your requirements
                color: Colors.white,
              ),
              backgroundColor: Colors.blue[600],)
          ],
        ),
      ),
    );
  }
}

class expense extends StatefulWidget {
  @override
  State<expense> createState() => _expenseState();
}

class _expenseState extends State<expense> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        title: Text('Budget Tracker'),
        centerTitle: true,
        backgroundColor: Colors.yellow[700],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
          child: Column(
            children: [
              ...Expenses.map((Category) => catagorycards(Category)).toList(),
              SizedBox(height: 20), // Add your additional widget here
              FloatingActionButton(
                onPressed: () {Navigator.pushNamed(context, '/');},
                child: Icon(
                    Icons.arrow_circle_left_rounded,
                    size: 50, // Adjust the value as per your requirements
                    color: Colors.white,
                ),
                backgroundColor: Colors.blue[600],)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: PopupCard(),
              );
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue[600],
      ),
    );
  }
}



