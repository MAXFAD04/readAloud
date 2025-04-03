import 'package:flutter/material.dart';

class EditAccountPage extends StatelessWidget {
  const EditAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Редактировать аккаунт'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Заголовок с ником и почтой
              Text(
                'Кот_на_Арбузе',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                'cat_on_watermelon_78@gmail.com',
                style: TextStyle(color: Colors.grey),
              ),
              Divider(thickness: 1, height: 32),

              // Основная информация
              Text(
                'Основная информация',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),

              // Фото профиля
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Фото профиля'),
                      SizedBox(height: 4),
                      Text(
                        'Фото профиля позволяет подчеркнуть индивидуальность аккаунта',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/profile_picture.png'), // Замените на путь к изображению профиля
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  // Логика для изменения фото профиля
                },
                child: Text('Изменить'),
              ),
              SizedBox(height: 16),

              // Ник
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ник'),
                      SizedBox(height: 4),
                      Text(
                        'Кот_на_Арбузе',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      // Логика для изменения ника
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Почта
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Почта'),
                      SizedBox(height: 4),
                      Text(
                        'cat_on_watermelon_78@gmail.com',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      // Логика для изменения почты
                    },
                  ),
                ],
              ),
              Divider(thickness: 1, height: 32),

              // Безопасность
              Text(
                'Безопасность',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text('Смена пароля'),
              SizedBox(height: 8),
              Text('Введите старый пароль'),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
              SizedBox(height: 16),
              Text('Введите новый пароль'),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
              SizedBox(height: 16),
              Text('Повторите новый пароль'),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Логика для изменения пароля
                },
                child: Text('Изменить пароль'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 48), // Кнопка на всю ширину
                ),
              ),
              Divider(thickness: 1, height: 32),

              // Поддержка проекта
              Text(
                'Поддержать наш проект',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'За поддержку нашего проекта вы получите VIP-статус, '
                'который позволит изменять параметры звучания и менять тему в приложении.',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.monetization_on),
                    onPressed: () {
                      // Логика для перехода на страницу оплаты
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

