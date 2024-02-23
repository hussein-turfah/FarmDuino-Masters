import 'package:flutter/material.dart';

class OnOffCards extends StatefulWidget {
  final String title;
  const OnOffCards({super.key, required this.title});

  @override
  State<OnOffCards> createState() => _NewCardsDesignState();
}

class _NewCardsDesignState extends State<OnOffCards>
    with SingleTickerProviderStateMixin {
  bool isClicked = true;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void startAnimation() {
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    Widget iconWidget = isClicked
        ? AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Opacity(
                opacity: _controller.value * 0.9 + 0.1,
                child: Image.asset(
                  'assets/icons/light_bulb.png',
                  color: Colors.black,
                  width: 170,
                  opacity: const AlwaysStoppedAnimation(0.1),
                ),
              );
            },
          )
        : const Opacity(
            opacity: 0.1,
            child: Icon(
              Icons.lightbulb_outline,
              color: Colors.black,
              size: 150,
            ),
          );
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        setState(() {
          isClicked = !isClicked;
          if (isClicked) {
            _controller.forward(from: 0);
          }
        });
      },
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        width: (size.width / 2) - 25,
        height: 185,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              isClicked
                  ? widget.title == 'Lights'
                      ? const Color.fromARGB(255, 251, 239, 202)
                      : const Color.fromARGB(255, 171, 228, 255)
                  : Colors.white,
              isClicked
                  ? widget.title == 'Lights'
                      ? Colors.amber
                      : const Color.fromARGB(255, 10, 141, 248)
                  : Colors.white,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              if (widget.title == 'Fans') ...[
                AnimatedBuilder(
                  animation: _controller,
                  child: Opacity(
                    opacity: 0.1,
                    child: Image.asset(
                      'assets/icons/fan.png',
                      color: Colors.black,
                      width: 170,
                    ),
                  ),
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: isClicked
                          ? _controller.value * 2 * 3.14
                          : 0, // Rotate 360 degrees
                      child: child,
                    );
                  },
                ),
              ] else ...[
                Column(
                  children: [
                    (!isClicked)
                        ? const SizedBox(
                            height: 18,
                          )
                        : Container(),
                    iconWidget,
                  ],
                )
              ],
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(fontSize: 21),
                  ),
                  Text(
                    isClicked ? 'ON' : 'OFF',
                    style: const TextStyle(fontSize: 50),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  // Transform.scale(
                  //   scale: 0.9,
                  //   child: Switch(
                  //     activeColor: CustomColors.detailsColor,
                  //     value: isClicked,
                  //     onChanged: (value) {
                  //       setState(() {
                  //         isClicked = value;
                  //         if (isClicked) {
                  //           _controller.forward(from: 0);
                  //         }
                  //       });
                  //     },
                  //   ),
                  // )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
