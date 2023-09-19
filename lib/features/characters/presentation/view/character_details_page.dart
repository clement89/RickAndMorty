import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_morty/features/characters/data/models/character.dart';
import 'package:rick_morty/theme/colors.dart';
import 'package:rick_morty/utils/formatter.dart';
import 'package:rick_morty/widgets/custom_image.dart';

@RoutePage()
class CharacterDetailsPage extends StatefulWidget {
  final Character character;

  const CharacterDetailsPage({Key? key, required this.character})
      : super(key: key);

  @override
  State<CharacterDetailsPage> createState() => _CharacterDetailsPageState();
}

class _CharacterDetailsPageState extends State<CharacterDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.character.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 0.40.sw,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.sp),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 15,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.sp),
                  child: CustomImage(
                    imageUrl: widget.character.image,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40.sp),
            _buildDetailItem("Status", widget.character.status),
            _buildDetailItem("Species", widget.character.species),
            _buildDetailItem("Type", widget.character.type),
            _buildDetailItem("Gender", widget.character.gender),
            _buildDetailItem("Origin", widget.character.origin.name),
            _buildDetailItem("Location", widget.character.location.name),
            _buildDetailItem(
                "Born", Formatter.formatDate(widget.character.created)),
            _buildEpisodeList(widget.character.episode),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    if (value.isEmpty) return const SizedBox();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(height: 10.sp),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 16.0), // Add spacing between detail items
      ],
    );
  }

  Widget _buildEpisodeList(List<String> episodes) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Episodes",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold, color: AppColors.headerColor),
        ),
        const SizedBox(height: 8.0), // Add spacing above episode list
        ListView.builder(
          shrinkWrap: true,
          physics:
              const NeverScrollableScrollPhysics(), // Disable scrolling for the ListView
          itemCount: episodes.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                "Episode ${index + 1}",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              subtitle: Text(
                episodes[index],
                style: Theme.of(context).textTheme.bodySmall,
              ),
            );
          },
        ),
      ],
    );
  }
}
