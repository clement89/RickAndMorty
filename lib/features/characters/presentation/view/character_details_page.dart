import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_morty/features/characters/data/models/character.dart';
import 'package:rick_morty/widgets/custom_image.dart';

@RoutePage()
class CharacterDetailsPage extends StatelessWidget {
  final Character character;

  const CharacterDetailsPage({Key? key, required this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                width: 0.40.sw,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.sp),
                  child: CustomImage(
                    imageUrl: character.image,
                  ),
                ),
              ),
            ),
            _buildDetailItem("Status", character.status),
            _buildDetailItem("Species", character.species),
            _buildDetailItem("Type", character.type),
            _buildDetailItem("Gender", character.gender),
            _buildDetailItem("Origin", character.origin.name),
            _buildDetailItem("Location", character.location.name),
            _buildDetailItem("Created", character.created),
            _buildEpisodeList(character.episode),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14.0,
          ),
        ),
        const SizedBox(height: 16.0), // Add spacing between detail items
      ],
    );
  }

  Widget _buildEpisodeList(List<String> episodes) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Episodes",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        const SizedBox(height: 8.0), // Add spacing above episode list
        ListView.builder(
          shrinkWrap: true,
          physics:
              const NeverScrollableScrollPhysics(), // Disable scrolling for the ListView
          itemCount: episodes.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("Episode ${index + 1}"),
              subtitle: Text(episodes[index]),
            );
          },
        ),
      ],
    );
  }
}
