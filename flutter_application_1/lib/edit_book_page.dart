import 'package:flutter/material.dart';
import 'book.dart';

class EditBookPage extends StatelessWidget {
  final Book book;

  const EditBookPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Редактировать книгу'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Название'),
              controller: TextEditingController(text: book.title),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Автор'),
              controller: TextEditingController(text: book.author),
            ),
            // добавить функциональность для загрузки обложки
            ElevatedButton(
              onPressed: () {
                // Сохранение изменений
                Navigator.pop(context);
              },
              child: Text('Сохранить'),
            ),
          ],
        ),
      ),
    );
  }
}
