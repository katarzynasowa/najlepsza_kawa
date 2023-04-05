import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddOpinionPageContent extends StatefulWidget {
  const AddOpinionPageContent({
    super.key,
  });

  @override
  State<AddOpinionPageContent> createState() => _AddOpinionPageContentState();
}

class _AddOpinionPageContentState extends State<AddOpinionPageContent> {
  var restaurantName = '';
  var kawaName = '';
  var rating = 3.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(hintText: 'Podaj nazwę kawiarni'),
            onChanged: (newValue) {
              setState(() {
                restaurantName = newValue;
              });
            },
          ),
          TextField(
            decoration: const InputDecoration(hintText: 'Podaj nazwę kawy'),
            onChanged: (newValue) {
              setState(() {
                kawaName = newValue;
              });
            },
          ),
          Slider(
            value: rating,
            min: 1.0,
            max: 6.0,
            divisions: 10,
            label: rating.toString(),
            onChanged: (newValue) {
              setState(() {
                rating = newValue;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              FirebaseFirestore.instance.collection('restaurants').add({
                'name': restaurantName,
                'kawa': kawaName,
                'rating': rating,
              });
            },
            child: const Text('Dodaj'),
          )
        ],
      ),
    );
  }
}
