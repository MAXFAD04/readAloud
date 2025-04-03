import 'package:flutter/material.dart';
import 'book.dart';

class EditBookPage extends StatelessWidget {
  final Book book;

  const EditBookPage({super.key, required this.book});

  void _showInputDialog(BuildContext context, String title, String initialValue, Function(String) onSubmitted) {
    TextEditingController controller = TextEditingController(text: initialValue);
    
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: 'Введите новое значение'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Отмена'),
            ),
            TextButton(
              onPressed: () {
                onSubmitted(controller.text);
                Navigator.of(context).pop();
              },
              child: Text('Сохранить'),
            ),
          ],
        );
      },
    );
  }

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
            GestureDetector(
              onTap: () {
                _showInputDialog(context, 'Редактировать название', book.title, (newTitle) {
                  // Логика для обновления названия
                  // Например, обновите состояние книги или используйте состояние управления
                });
              },
              child: Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text('Название: ${book.title}'),
              ),
            ),
            GestureDetector(
              onTap: () {
                _showInputDialog(context, 'Редактировать автора', book.author, (newAuthor) {
                  // Логика для обновления автора
                });
              },
              child: Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text('Автор: ${book.author}'),
              ),
            ),
            GestureDetector(
              onTap: () {
                _showInputDialog(context, 'Редактировать аннотацию', book.tag, (newTag) {
                  // Логика для обновления аннотации
                });
              },
              child: Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text('Аннотация: ${book.tag}'),
              ),
            ),
            // Блок для загрузки обложки
            GestureDetector(
              onTap: () {
                // Логика для загрузки обложки
              },
              child: Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text('Загрузить обложку'),
              ),
            ),
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
