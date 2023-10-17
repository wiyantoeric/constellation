import 'package:constellation/common/tts.dart';
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
                color: Colors.white, // Set the background color to white
                shape: BoxShape.circle, // Make it a circular shape
              ),
              child: IconButton(
                onPressed: () async {
                  await flutterTts.stop();
                  context.go('/');
                },
                icon: const Icon(Icons.arrow_back),
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
                        '${widget.constellation.startDate.month}/${widget.constellation.startDate.day} - ${widget.constellation.endDate.month}/${widget.constellation.endDate.day}',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color:
                              Colors.white, // Set the background color to white
                          shape: BoxShape.circle, // Make it a circular shape
                        ),
                        child: IconButton(
                          onPressed: () async => await flutterTts.speak(widget.constellation.desc),
                          icon: const Icon(Icons.volume_up_sharp),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
