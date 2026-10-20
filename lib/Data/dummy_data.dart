import 'package:flutter/material.dart';

class QuizModel {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final Color iconColor;
  final Color iconBackgroundColor;
  final int questionCount;
  final List<Map<String, dynamic>> questions;

  const QuizModel({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.iconColor,
    required this.iconBackgroundColor,
    required this.questionCount,
    required this.questions,
  });
}

final List<QuizModel> dummyQuizzes = [
  QuizModel(
    id: 'wawasan',
    title: 'Seberapa luas wawasanmu?',
    description: 'Jelajahi fakta menarik dari berbagai penjuru dunia.',
    icon: Icons.language,
    iconColor: const Color(0xFF437B62),
    iconBackgroundColor: const Color(0xFFE4F0E8),
    questionCount: 10,
    questions: [
      {
        'question': 'Apa nama ibu kota negara Jepang?',
        'options': ['Kyoto', 'Tokyo', 'Osaka', 'Hiroshima'],
        'correctAnswer': 1,
      },
      {
        'question': 'Berapa jumlah benua di dunia?',
        'options': ['5', '6', '7', '8'],
        'correctAnswer': 2,
      },
      {
        'question': 'Planet mana yang dikenal sebagai Planet Merah?',
        'options': ['Venus', 'Mars', 'Jupiter', 'Saturnus'],
        'correctAnswer': 1,
      },
      {
        'question': 'Siapa penemu lampu pijar?',
        'options': [
          'Nikola Tesla',
          'Thomas Edison',
          'Alexander Graham Bell',
          'Albert Einstein',
        ],
        'correctAnswer': 1,
      },
      {
        'question': 'Hewan terdarat tertua yang masih hidup saat ini adalah?',
        'options': ['Gajah', 'Kura-kura raksasa', 'Paus biru', 'Buaya'],
        'correctAnswer': 1,
      },
      {
        'question': 'Unsur kimia dengan simbol \'O\' adalah?',
        'options': ['Emas', 'Oksigen', 'Perak', 'Osmium'],
        'correctAnswer': 1,
      },
      {
        'question': 'Negara terluas di dunia berdasarkan wilayah adalah?',
        'options': ['Kanada', 'Tiongkok', 'Amerika Serikat', 'Rusia'],
        'correctAnswer': 3,
      },
      {
        'question': 'Bahasa yang paling banyak digunakan di dunia adalah?',
        'options': ['Inggris', 'Mandarin', 'Spanyol', 'Arab'],
        'correctAnswer': 1,
      },
      {
        'question': 'Candi Borobudur terletak di provinsi?',
        'options': ['Jawa Barat', 'Jawa Tengah', 'Jawa Timur', 'DI Yogyakarta'],
        'correctAnswer': 1,
      },
      {
        'question': 'Mata uang resmi negara Inggris adalah?',
        'options': ['Euro', 'Dollar', 'Pound Sterling', 'Yen'],
        'correctAnswer': 2,
      },
    ],
  ),
  QuizModel(
    id: 'digital',
    title: 'Kenali dunia digital',
    description: 'Dari internet sampai coding. Seberapa tech-savvy kamu?',
    icon: Icons.code,
    iconColor: const Color(0xFF8B60A9),
    iconBackgroundColor: const Color(0xFFECE4F8),
    questionCount: 10,
    questions: [
      {
        'question': 'Bahasa pemrogramaan utama yang digunakan dalam pengembangan Flutter adalah?',
        'options': ['Java', 'Kotlin', 'Dart', 'Swift'],
        'correctAnswer': 2,
      },
      {
        'question': 'Apa kepanjangan dari HTML?',
        'options': [
          'HyperText Markup Language',
          'HighText Machine Language',
          'HyperTransfer Mode Language',
          'Home Tool Markup Language',
        ],
        'correctAnswer': 0,
      },
      {
        'question': 'Komponen komputer yang berfungsi sebagai "otak" pemrosesan adalah?',
        'options': ['RAM', 'GPU', 'CPU', 'SSD'],
        'correctAnswer': 2,
      },
      {
        'question':
            'Protokol aman yang digunakan untuk enkripsi transmisi web adalah?',
        'options': ['HTTP', 'HTTPS', 'FTP', 'SMTP'],
        'correctAnswer': 1,
      },
      {
        'question': 'Sistem operasi berbasis kernel Linux buatan Google untuk smartphone adalah?',
        'options': ['iOS', 'Windows Phone', 'Android', 'Symbian'],
        'correctAnswer': 2,
      },
      {
        'question': 'Struktur data LIFO (Last In First Out) diwakili oleh?',
        'options': ['Queue', 'Stack', 'Tree', 'Graph'],
        'correctAnswer': 1,
      },
      {
        'question':
            'Unit penyimpanan data digital sebesar 1024 Megabyte disebut?',
        'options': ['1 Kilobyte', '1 Terabyte', '1 Gigabyte', '1 Petabyte'],
        'correctAnswer': 2,
      },
      {
        'question': 'Penemu jaringan World Wide Web (WWW) adalah?',
        'options': [
          'Bill Gates',
          'Steve Jobs',
          'Tim Berners-Lee',
          'Mark Zuckerberg',
        ],
        'correctAnswer': 2,
      },
      {
        'question':
            'Format gambar yang mendukung animasi bergerak tanpa suara adalah?',
        'options': ['JPEG', 'PNG', 'GIF', 'SVG'],
        'correctAnswer': 2,
      },
      {
        'question': 'Apa kepanjangan dari AI dalam teknologi?',
        'options': [
          'Automated Information',
          'Artificial Intelligence',
          'Advanced Integration',
          'Applied Innovation',
        ],
        'correctAnswer': 1,
      },
    ],
  ),
  QuizModel(
    id: 'sains',
    title: 'Rahasia di balik sains',
    description: 'Temukan keajaiban sains dalam kehidupan sehari-hari.',
    icon: Icons.science_outlined,
    iconColor: const Color(0xFFB07233),
    iconBackgroundColor: const Color(0xFFF9EEDD),
    questionCount: 10,
    questions: [
      {
        'question': 'Proses pembuatan makanan pada tumbuhan dengan bantuan cahaya matahari disebut?',
        'options': ['Respirasi', 'Fotosintesis', 'Transpirasi', 'Fermentasi'],
        'correctAnswer': 1,
      },
      {
        'question': 'Gaya yang menarik benda menuju pusat bumi disebut?',
        'options': [
          'Gaya Gesek',
          'Gaya Magnet',
          'Gaya Gravitasi',
          'Gaya Pegas',
        ],
        'correctAnswer': 2,
      },
      {
        'question': 'Zat yang memiliki pH kurang dari 7 tergolong zat?',
        'options': ['Basa', 'Netral', 'Asam', 'Garam'],
        'correctAnswer': 2,
      },
      {
        'question': 'Organ manusia yang berfungsi memompa darah ke seluruh tubuh adalah?',
        'options': ['Paru-paru', 'Hati', 'Ginjal', 'Jantung'],
        'correctAnswer': 3,
      },
      {
        'question': 'Kecepatan cahaya di ruang hampa udara sekitar?',
        'options': [
          '300.000 km/s',
          '150.000 km/s',
          '3.000 km/s',
          '30.000 km/s',
        ],
        'correctAnswer': 0,
      },
      {
        'question': 'Gas paling melimpah di atmosfer Bumi adalah?',
        'options': ['Oksigen', 'Karbondioksida', 'Nitrogen', 'Hidrogen'],
        'correctAnswer': 2,
      },
      {
        'question': 'Bagian terkecil dari suatu unsur yang masih memiliki sifat unsur tersebut adalah?',
        'options': ['Molekul', 'Sel', 'Atom', 'Jaringan'],
        'correctAnswer': 2,
      },
      {
        'question':
            'Perubahan wujud zat dari padat menjadi gas langsung disebut?',
        'options': ['Mencair', 'Membeku', 'Menyublim', 'Mengembun'],
        'correctAnswer': 2,
      },
      {
        'question': 'Suhu titik beku air murni pada skala Celsius adalah?',
        'options': ['100°C', '0°C', '-10°C', '32°C'],
        'correctAnswer': 1,
      },
      {
        'question': 'Planet terbesar dalam tata surya kita adalah?',
        'options': ['Bumi', 'Saturnus', 'Neptunus', 'Jupiter'],
        'correctAnswer': 3,
      },
    ],
  ),
];
