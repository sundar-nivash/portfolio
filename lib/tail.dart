import 'package:flutter/material.dart';
import 'package:flutterweb/model/project_details.dart';

class ZoomableImage extends StatefulWidget {
  final ProjectDetails project;

  ZoomableImage({required this.project});

  @override
  _ZoomableImageState createState() => _ZoomableImageState();
}

class _ZoomableImageState extends State<ZoomableImage> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        print("object");
      }),
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.network(
                widget.project.imageUrl!,
                fit: BoxFit.cover,
              ),
            ),
            isHovered == true
                ? Positioned(
                    child:
                        // if (isHovered)
                        Container(
                      color: Colors.black.withOpacity(0.65),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              widget.project.name!, // Display your text here
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              widget.project
                                  .type!, // Display additional text if needed
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
            if (isHovered)
              Positioned(
                bottom: 16.0,
                right: 16.0,
                child: Icon(
                  (Icons.ads_click), // Replace with the desired icon
                  color: Colors.white,
                  size: 32.0,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
