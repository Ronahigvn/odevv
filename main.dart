import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'KISILIK ANKETI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isChecked = false;
  double sliderValue = 0;
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Text('Adiniz ve Soyadiniz:'),
          TextField(),
          TextField(autofocus: true),
          DropdownButton<String>(
            hint: const Text('Cinsiyet Seçiniz'),
            value: selectedGender,
            items: <String>['Erkek', 'Kadın', 'Diğer'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedGender = newValue;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Resit Misiniz?'),
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value ?? false;
              });
            },
          ),
          SwitchListTile(
            tileColor: Colors.red,
            title: const Text('Sigara Kullaniyor musunuz?'),
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value ?? false;
              });
            },
          ),
          Slider(
            min: 0,
            max: 100,
            value: sliderValue,
            onChanged: (double value) {
              setState(() {
                sliderValue = value;
              });
            },
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              children: [
                if (selectedGender != null)
                  ListTile(
                    title: Text('Seçilen Cinsiyet: $selectedGender'),
                  ),
                ListTile(
                  title: Text('Adiniz ve Soyadiniz: '),
                ),
                ListTile(
                  title:
                      Text('Resit Misiniz?: ${isChecked ? 'Evet' : 'Hayır'}'),
                ),
                ListTile(
                  title: Text(
                      'Sigara Kullaniyor musunuz?: ${isChecked ? 'Evet' : 'Hayır'}'),
                ),
                ListTile(
                  title: Text('Slider Value: $sliderValue'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
