import 'package:flutter/material.dart';
import 'package:portfolio/models/technologies_enum.dart';

/// It is the responsible to iterate over each value of [technologies] and
/// display a tag corresponding to the value.
class TechnologiesTags extends StatelessWidget {
  /// It is the responsible to iterate over each value of [technologies] and
  /// display a tag corresponding to the value.
  const TechnologiesTags({
    Key? key,
    required this.technologies,
  }) : super(key: key);

  /// The list of [Technology] to iterate over.
  final List<Technology> technologies;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          for (Technology technology in technologies) ...<Widget>[
            if (technology == Technology.dart)
              const _TechnologyTag(
                name: 'Dart',
                color: Colors.blue,
              ),
            if (technology == Technology.flutter)
              _TechnologyTag(
                name: 'Flutter',
                color: Colors.blue.shade400,
              ),
            if (technology == Technology.go)
              _TechnologyTag(
                name: 'Go',
                color: Colors.blue.shade800,
              ),
            if (technology == Technology.nodejs)
              const _TechnologyTag(
                name: 'Node.js',
                color: Colors.green,
              ),
            if (technology == Technology.typescript)
              const _TechnologyTag(
                name: 'TypeScript',
                color: Colors.blueGrey,
              ),
            if (technology == Technology.svelte)
              _TechnologyTag(
                name: 'Svelte',
                color: Colors.amber.shade900,
              ),
            const SizedBox(
              width: 5,
            ),
          ],
        ],
      ),
    );
  }
}

class _TechnologyTag extends StatelessWidget {
  const _TechnologyTag({
    Key? key,
    required this.color,
    required this.name,
  }) : super(key: key);

  final Color color;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 5.0,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(50.0),
        color: color.withOpacity(0.3),
        border: Border.all(
          color: color,
        ),
      ),
      child: Text(name),
    );
  }
}
