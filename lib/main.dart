import 'package:flutter/material.dart';

const List<String> categorias = ['categoria 1', 'categoria 2', 'categoria 3', 'categoria 4'];

void main() => runApp(const EjemploAdd());

class EjemploAdd extends StatelessWidget {
  const EjemploAdd({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Agregar Información')),
        body: const Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                SizedBox(
                width: double.infinity,
                child: DropdownButtonExample(
                  label: 'Elija la Categoría',
                  items: categorias,
                ),
              ),
              SizedBox(height: 30),
                TextField(
                decoration: InputDecoration(
                  labelText: 'Descripción (máximo 200 caracteres)',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
                maxLength: 200,
              ),
              SizedBox(height: 20),
                TextField(
                decoration: InputDecoration(
                  labelText: 'Dirección',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({Key? key, required this.label, required this.items});

  final String label;
  final List<String> items;

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label),
        DropdownButton<String>(
          value: dropdownValue.isNotEmpty ? dropdownValue : null,
          icon: const Icon(Icons.arrow_downward),
          elevation: 18,
          style: const TextStyle(color: Colors.black),
          isExpanded: true,
          underline: Container(
            height: 2,
            color: Colors.blue,
          ),
          onChanged: (String? value) {
            setState(() {
              dropdownValue = value!;
            });
          },
          items: widget.items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
