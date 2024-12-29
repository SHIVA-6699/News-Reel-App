import 'package:flutter/material.dart';
import 'package:y_player/y_player.dart';

class ReelsSection extends StatelessWidget {
  final List<String> shortUrls = [
    'https://www.youtube.com/watch?v=YObmJwEIJyo',
    'https://www.youtube.com/watch?v=YObmJwEIJyo',
    'https://www.youtube.com/watch?v=YObmJwEIJyo',
    'https://www.youtube.com/watch?v=YObmJwEIJyo',
    'https://www.youtube.com/watch?v=YObmJwEIJyo',
    'https://www.youtube.com/watch?v=YObmJwEIJyo',
    'https://www.youtube.com/watch?v=YObmJwEIJyo',
    'https://www.youtube.com/watch?v=YObmJwEIJyo',
    'https://www.youtube.com/watch?v=YObmJwEIJyo',
    'https://www.youtube.com/watch?v=YObmJwEIJyo',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Reels'),
        backgroundColor: Colors.black,
      ),
      body: PageView.builder(
        itemCount: shortUrls.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          // Get device width and height
          final screenWidth = MediaQuery.of(context).size.width;
          final screenHeight = MediaQuery.of(context).size.height;

          return Stack(
            children: [
              // Full-Screen Video Player
              SizedBox(
                width: screenWidth,
                height: screenHeight,
                child: YPlayer(
                  youtubeUrl: shortUrls[index],
                  autoPlay: true,
                  color: Colors.white, // Custom progress bar color
                  onStateChanged: (status) {
                    debugPrint('Player Status: $status');
                  },
                  onProgressChanged: (position, duration) {
                    debugPrint(
                        'Progress: ${position.inSeconds}/${duration.inSeconds}');
                  },
                  onControllerReady: (controller) {
                    debugPrint('Controller is ready!');
                  },
                ),
              ),
              // Overlay UI for News Reels
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title and description
                    Text(
                      'News Title $index',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Description for news reel $index.',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 15),
                    // Interaction buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Like Button
                        IconButton(
                          icon: const Icon(Icons.thumb_up, color: Colors.white),
                          onPressed: () {
                            debugPrint('Liked reel $index');
                          },
                        ),
                        // Share Button
                        IconButton(
                          icon: const Icon(Icons.share, color: Colors.white),
                          onPressed: () {
                            debugPrint('Shared reel $index');
                          },
                        ),
                        // Comment Button
                        IconButton(
                          icon: const Icon(Icons.comment, color: Colors.white),
                          onPressed: () {
                            debugPrint('Commented on reel $index');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}


