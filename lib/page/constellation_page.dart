import 'package:constellation/common/tts.dart';
import 'package:constellation/common/user_data.dart';
import 'package:constellation/model/constellation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConstellationPage extends StatefulWidget {
  const ConstellationPage({super.key, required this.constellation});

  final Constellation constellation;

  @override
  State<ConstellationPage> createState() => _ConstellationPageState();
}

class _ConstellationPageState extends State<ConstellationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      body: Stack(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Image.asset(
              widget.constellation.imgUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () async {
                  await flutterTts.stop();
                  context.go('/home');
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    user.name,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "${user.birthdate.day}-${user.birthdate.month}-${user.birthdate.year}",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Age: ${DateTime.now().year - user.birthdate.year}",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 150,
                      width: 150,
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.8),
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      child: Image.asset(
                        widget.constellation.logoUrl,
                        fit: BoxFit.cover,
                      )),
                  const SizedBox(height: 24),
                  Column(
                    children: [
                      Text(
                        widget.constellation.constellationName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Text(
                        widget.constellation.desc,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        '${widget.constellation.startDate.day}/${widget.constellation.startDate.month} - ${widget.constellation.endDate.day}/${widget.constellation.endDate.month}',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () async =>
                              await flutterTts.speak(widget.constellation.desc),
                          icon: const Icon(Icons.volume_up_sharp),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
