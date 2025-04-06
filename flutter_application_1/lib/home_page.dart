import 'package:flutter/material.dart';
import 'book.dart';
import 'edit_book_page.dart';
import 'edit_account_page.dart';
import 'book_page.dart'; // Импортируем страницу книги

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCompactView = true; // Переключение между режимами отображения
  List<Book> books = [
    Book('Book Title 1', 'Author 1', 'Прочитана', 'assets/1.jpg'),
    Book('Book Title 2', 'Author 2', 'Читаю (50%)', 'assets/2.jpg'),
  ];

  String searchQuery = '';

  void _showBookDetails(BuildContext context, Book book) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookPage(book: book), // Переход на страницу книги
      ),
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
    showDialog(
      context: context,
      builder: (context) {
        return Align(
          alignment: Alignment.topRight, // Выравнивание по правому верхнему углу
          child: Container(
            width: 300, // Ширина всплывающего окна
            padding: EdgeInsets.all(16.0),
            child: Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0), // Закругление углов
              ),
              backgroundColor: Color(0xFF3EB489), // Зелёный фон
              elevation: 8,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Кнопка закрытия
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(Icons.close, color: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pop(); // Закрытие окна
                      },
                    ),
                  ),
                  // Профиль
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/account.jpg'), 
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Кот_на_Арбузе',
                    style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic, color: Colors.white),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'cat_on_watermelon_78@gmail.com',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  SizedBox(height: 16),
                  // Кнопка редактирования
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditAccountPage()),
                      );
                    },
                    child: Text('Редактировать аккаунт'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Цвет кнопки
                      foregroundColor: Color(0xFF3EB489), // Цвет текста
                    ),
                  ),
                  SizedBox(height: 16),
                  // Список пунктов
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Логика для перехода в Настройки
                        },
                        child: Text('Настройки', style: TextStyle(color: Colors.white)),
                      ),
                      TextButton(
                        onPressed: () {
                          // Логика для перехода в Справка/Отзывы
                        },
                        child: Text('Справка/Отзывы', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showBookOptions(BuildContext context, Book book) {
  showDialog(
    context: context,
    barrierDismissible: true, // Позволяет закрыть диалог, нажав вне его границ
    builder: (context) {
      return Align(
        alignment: Alignment.bottomCenter, // Размещаем окно внизу
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20), // Отступы по бокам и снизу
          decoration: BoxDecoration(
            color: Colors.white, // Белый фон для окна
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 10,
                offset: Offset(0, 3), // Смещение тени
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Полоска для закрытия окна
              GestureDetector(
                onVerticalDragDown: (details) {
                  Navigator.of(context).pop(); // Закрытие окна при потягивании вниз
                },
                child: Container(
                  height: 5,
                  width: 40,
                  color: Colors.grey[300],
                  margin: EdgeInsets.symmetric(vertical: 10),
                ),
              ),
              // Обложка книги
              Image.asset(
                book.cover,
                height: 150,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              // Название и автор
              Text(
                book.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                book.author, // Предполагается, что у вас есть поле author в классе Book
                style: TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              // Кнопки действий
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      // Кнопка "Поделиться"
                      IconButton(
                        icon: Icon(Icons.share),
                        onPressed: () {
                          // Логика для поделиться книгой
                          Navigator.of(context).pop();
                        },
                      ),
                      Text("Поделиться"), // Подпись под кнопкой
                    ],
                  ),
                  Column(
                    children: [
                      // Кнопка "Редактировать"
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EditBookPage(book: book)),
                          );
                        },
                      ),
                      Text("Редактировать"), // Подпись под кнопкой
                    ],
                  ),
                  Column(
                    children: [
                      // Кнопка "Удалить из списка"
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          // Логика для удаления книги
                          Navigator.of(context).pop();
                        },
                      ),
                      Text("Удалить"), // Подпись под кнопкой
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00b358), // Ярко-зеленый фон
        title: Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 8.0),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value.toLowerCase();
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Поиск книг...',
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () => _showFilterMenu(context),
            ),
            IconButton(
              icon: Icon(Icons.view_module),
              onPressed: () {
                setState(() {
                  isCompactView = !isCompactView; // Переключение между режимами отображения
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () => _showUserMenu(context),
            ),
          ],
        ),
      ),
      body: isCompactView
          ? ListView.builder(
              itemCount: books.where((book) => book.title.toLowerCase().contains(searchQuery)).length,
              itemBuilder: (context, index) {
                final filteredBooks = books.where((book) => book.title.toLowerCase().contains(searchQuery)).toList();
                return Card(
                  child: ListTile(
                    leading: Image.asset(filteredBooks[index].cover),
                    title: Text(filteredBooks[index].title),
                    subtitle: Text(filteredBooks[index].tag),
                    trailing: IconButton(
                      icon: Icon(Icons.more_vert),
                      onPressed: () => _showBookOptions(context, filteredBooks[index]), // Показать опции книги
                    ),
                    onTap: () => _showBookDetails(context, filteredBooks[index]), // Переход на страницу книги
                  ),
                );
              },
            )
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: books.where((book) => book.title.toLowerCase().contains(searchQuery)).length,
              itemBuilder: (context, index) {
                final filteredBooks = books.where((book) => book.title.toLowerCase().contains(searchQuery)).toList();
                return Card(
                  child: GestureDetector(
                    onTap: () => _showBookDetails(context, filteredBooks[index]), // Переход на страницу книги
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          filteredBooks[index].cover,
                          fit: BoxFit.cover,
                          height: 150,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            filteredBooks[index].title,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(filteredBooks[index].tag),
                        ),
                        IconButton(
                          icon: Icon(Icons.more_vert),
                          onPressed: () => _showBookOptions(context, filteredBooks[index]), // Показать опции книги
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Логика для добавления новой книги
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
