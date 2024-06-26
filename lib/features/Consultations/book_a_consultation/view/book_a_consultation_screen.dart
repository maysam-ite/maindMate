import 'package:flutter/material.dart';
import 'package:maindmate/core/services/divide_widgets.dart';
import 'package:maindmate/core/shared/widgets/general_app_bar.dart';
import 'package:maindmate/features/Consultations/book_a_consultation/view/widgets/book_a_consiltation_widget.dart';

class BookAConsultationScreen extends StatelessWidget {
  const BookAConsultationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generalAppBar(title:'book_an_oppointment'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            const BookAConsultationWidget(),
            const BookAConsultationWidget()
          ].divide(const SizedBox(
            height: 10,
          )),
        ),
      ),
    );
  }
}
