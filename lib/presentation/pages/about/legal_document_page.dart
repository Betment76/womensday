import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:womensday/core/theme/sakura_colors.dart';
import 'package:womensday/presentation/widgets/sakura_background.dart';

/// Полноэкранный просмотр юридического текста из [assetPath] (UTF-8).
class LegalDocumentPage extends StatefulWidget {
  const LegalDocumentPage({
    super.key,
    required this.title,
    required this.assetPath,
  });

  final String title;
  final String assetPath;

  @override
  State<LegalDocumentPage> createState() => _LegalDocumentPageState();
}

class _LegalDocumentPageState extends State<LegalDocumentPage> {
  late final Future<String> _loadFuture;

  @override
  void initState() {
    super.initState();
    _loadFuture = rootBundle.loadString(widget.assetPath);
  }

  @override
  Widget build(BuildContext context) {
    return SakuraBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: Text(widget.title)),
        body: FutureBuilder<String>(
          future: _loadFuture,
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: SakuraColors.sakura),
              );
            }
            if (snapshot.hasError) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Text(
                    'Не удалось загрузить документ.',
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }
            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
              child: SelectableText(
                snapshot.data ?? '',
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.45,
                  color: SakuraColors.branch,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
