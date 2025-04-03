import 'package:flutter/material.dart';
import 'book.dart';

class BookPage extends StatefulWidget {
  final Book book;

  const BookPage({Key? key, required this.book}) : super(key: key);

  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  bool _isSearching = false;
  double _textSize = 16.0;
  double _lineSpacing = 1.5;
  String _searchQuery = '';
  bool _isReading = false;

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
    });
  }

  void _changeTextSize(double delta) {
    setState(() {
      _textSize += delta;
    });
  }

  void _changeLineSpacing(double delta) {
    setState(() {
      _lineSpacing += delta;
    });
  }

  void _toggleReading() {
    setState(() {
      _isReading = !_isReading;
    });
  }

  void _showFontSettings(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Настройки шрифта'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Размер текста:'),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () => _changeTextSize(-2),
                      ),
                      Text('${_textSize.toInt()}%'),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () => _changeTextSize(2),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Межстрочный интервал:'),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () => _changeLineSpacing(-0.1),
                      ),
                      Text('${_lineSpacing.toStringAsFixed(1)}'),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () => _changeLineSpacing(0.1),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _showVoiceSettings(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Настройки озвучивания'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Скорость чтения:'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      // Логика для уменьшения скорости
                    },
                  ),
                  Text('1.0x'),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      // Логика для увеличения скорости
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book.title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: _toggleSearch,
          ),
          IconButton(
            icon: Icon(Icons.text_fields),
            onPressed: () => _showFontSettings(context),
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () => _showVoiceSettings(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (_isSearching)
              TextField(
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Введите слово для поиска...',
                  border: OutlineInputBorder(),
                ),
              ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.teal[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    _searchQuery.isEmpty
                        ? _getBookText() // Здесь будет текст книги
                        : _searchInBook(_getBookText(), _searchQuery),
                    style: TextStyle(fontSize: _textSize, height: _lineSpacing),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('Страница 1/10'), // Здесь можно динамически обновлять номер страницы
            ),
            ElevatedButton(
              onPressed: _toggleReading,
              child: Text(_isReading ? 'Остановить озвучивание' : 'Начать озвучивание'),
            ),
            if (_isReading) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.fast_rewind),
                    onPressed: () {
                      // Логика для перемотки назад на 5 секунд
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.pause),
                    onPressed: () {
                      // Логика для паузы озвучивания
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.fast_forward),
                    onPressed: () {
                      // Логика для перемотки вперед на 5 секунд
                    },
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _getBookText() {
    // Здесь можно добавить текст книги, который будет отображаться
    return '''
    ТЕКСТ КНИГИ
    ''';
  }

  String _searchInBook(String bookText, String query) {
    // Логика поиска в тексте книги
    if (query.isEmpty) return bookText;

    // Разделяем текст на строки
    List<String> lines = bookText.split('\n');
    String result = '';

    for (String line in lines) {
      if (line.toLowerCase().contains(query.toLowerCase())) {
        result += line + '\n'; // Добавляем строки, содержащие запрос
      }
    }
    return result.isEmpty ? 'Ничего не найдено' : result;
  }
}

