import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Reader',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCompactView = true; // Переключение между режимами отображения
  List<Book> books = [
    Book('Book Title 1', 'Author 1', 'Прочитана', 'assets/book1.jpg'),
    Book('Book Title 2', 'Author 2', 'Читаю (50%)', 'assets/book2.jpg'),
    // Добавьте больше книг по необходимости
  ];

  void _showBookDetails(BuildContext context, Book book) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          height: 300,
          child: Column(
            children: [
              Image.asset(book.cover),
              Text(book.title, style: TextStyle(fontSize: 20)),
              Text(book.author, style: TextStyle(fontSize: 16)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: () {}, child: Text('ПОДЕЛИТЬСЯ')),
                  ElevatedButton(onPressed: () {}, child: Text('РЕДАКТИРОВАТЬ')),
                  ElevatedButton(onPressed: () {}, child: Text('УДАЛИТЬ')),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _showFilterMenu(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Фильтры'),
          content: Text('Здесь будут настройки фильтров...'),
          actions: [
            TextButton(
              child: Text('Закрыть'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

void _showUserMenu(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Пользователь', style: TextStyle(fontSize: 24)),
            ListTile(title: Text('Ник пользователя')),
            ListTile(title: Text('Почта')),
            ListTile(title: Text('Редактировать аккаунт')),
            ListTile(title: Text('Настройки')),
            ListTile(title: Text('Справка/Отзывы')),
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
        title: Text('Библиотека'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () => _showFilterMenu(context),
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () => _showUserMenu(context),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Поиск книг...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(isCompactView ? Icons.grid_view : Icons.list),
                  onPressed: () {
                    setState(() {
                      isCompactView = !isCompactView;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: isCompactView
                ? ListView.builder(
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: Image.asset(books[index].cover),
                          title: Text(books[index].title),
                          subtitle: Text(books[index].tag),
                          trailing: IconButton(
                            icon: Icon(Icons.more_vert),
                            onPressed: () => _showBookDetails(context, books[index]),
                          ),
                        ),
                      );
                    },
                  )
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                   
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: GestureDetector(
                          onTap: () => _showBookDetails(context, books[index]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                books[index].cover,
                                fit: BoxFit.cover,
                                height: 150,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  books[index].title,
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(books[index].tag),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class Book {
  final String title;
  final String author;
  final String tag; // Тег статуса книги
  final String cover; // Путь к обложке книги

  Book(this.title, this.author, this.tag, this.cover);
}
