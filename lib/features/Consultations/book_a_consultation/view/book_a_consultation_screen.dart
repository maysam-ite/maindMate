import 'package:flutter/material.dart';
import 'package:maindmate/features/Consultations/book_a_consultation/view/widgets/book_a_consiltation_widget.dart';
import 'package:maindmate/main.dart';

class BookAConsultationScreen extends StatelessWidget {
  const BookAConsultationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: appTheme.primaryBackground,
        leading: Image.asset('assets/images/Component 2 – 2.png'),
        title: const Center(
          child: Text('Centered Title'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [BookAConsultationWidget()],
        ),
      ),
    );
  }
}
