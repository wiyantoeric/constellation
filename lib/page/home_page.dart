import 'package:constellation/common/constellation_data.dart';
import 'package:constellation/common/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nameControlller = TextEditingController();
  final TextEditingController _dayController = TextEditingController();
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: Image.asset(
                'assets/background.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Stack(
                children: [
                  Text(
                    'constellation',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _nameControlller,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z]+')),
                        ],
                        decoration: InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: TextFormField(
                              controller: _dayController,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(
                                labelText: 'Day',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          SizedBox(
                            width: 100,
                            child: TextFormField(
                              controller: _monthController,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(
                                labelText: 'Month',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          SizedBox(
                            width: 120,
                            child: TextFormField(
                              controller: _yearController,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(
                                labelText: 'Year',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 48),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: handleCta,
                          child: const Text('Enter'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void handleCta() {
    final name = _nameControlller.text;
    final day = int.parse(_dayController.text);
    final month = int.parse(_monthController.text);
    final year = int.parse(_yearController.text);

    user.updateData(name: name, birthdate: DateTime(year, month, day));

    String userZodiac = "";
    for (var constellation in constellationData) {
      if ((month == constellation.startDate.month &&
              day >= constellation.startDate.day) ||
          (month == constellation.endDate.month &&
              day <= constellation.endDate.day) ||
          (month > constellation.startDate.month &&
              month < constellation.endDate.month)) {
        userZodiac = constellation.constellationName;
        break;
      }
    }

    context.go('/$userZodiac');
  }

  @override
  void dispose() {
    super.dispose();
    _nameControlller.dispose();
    _dayController.dispose();
    _monthController.dispose();
  }
}