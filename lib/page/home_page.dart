import 'package:constellation/common/constellation_data.dart';
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

  final int _day = 0;
  final int _month = 0;

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
                          Container(
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
                          Container(
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
    final day = int.tryParse(_dayController.text);
    final month = int.tryParse(_monthController.text);

    final dateTime = DateTime(DateTime.now().year, month!, day!);

    final constellationName = constellationData
        .firstWhere((element) =>
            element.startDate.isBefore(dateTime) ||
            element.endDate.isAfter(dateTime))
        .constellationName;

    context.go('/$constellationName');
  }

  @override
  void dispose() {
    super.dispose();
    _nameControlller.dispose();
    _dayController.dispose();
    _monthController.dispose();
  }
}
