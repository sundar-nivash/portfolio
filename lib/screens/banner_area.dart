import 'package:flutter/material.dart';

class PortfolioBanner extends StatelessWidget {
  final String h1;
  final String subtitle;
  final List<SocialMediaLink> socialMediaLinks;

  const PortfolioBanner({
    Key? key,
    required this.h1,
    required this.subtitle,
    required this.socialMediaLinks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //constraints: BoxConstraints(minWidth: 100, maxWidth: 900),
      height: 200,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 197, 238, 238),
            Color.fromARGB(255, 255, 210, 178),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "sdfasdfasdfasdf",
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              "fasdfasdfasdfasdfadf",
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 18,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: socialMediaLinks
                .map((link) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        link.icon,
                        color: const Color.fromARGB(255, 155, 74, 74),
                        size: 30,
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class SocialMediaLink extends StatelessWidget {
  final IconData icon;
  final String url;

  const SocialMediaLink(this.icon, this.url);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

final socialMediaLinks = [
  SocialMediaLink(Icons.facebook, 'https://www.facebook.com/your-portfolio'),
  SocialMediaLink(Icons.facebook, 'https://www.twitter.com/your-portfolio'),
  SocialMediaLink(Icons.facebook, 'https://www.linkedin.com/your-portfolio'),
];
