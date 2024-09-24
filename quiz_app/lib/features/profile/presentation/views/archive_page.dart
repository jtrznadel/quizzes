import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/widgets/basic_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../../application/archive_controller.dart';

@RoutePage()
class ArchivePage extends ConsumerStatefulWidget {
  const ArchivePage({super.key});

  @override
  ConsumerState<ArchivePage> createState() => _ArchivePageState();
}

class _ArchivePageState extends ConsumerState<ArchivePage> {
  @override
  void initState() {
    super.initState();
    ref.read(archiveControllerProvider.notifier).getQuizzArchive();
  }

  @override
  Widget build(BuildContext context) {
    final archiveState = ref.watch(archiveControllerProvider);
    return Scaffold(
      appBar: BasicAppBar(title: S.of(context).archiveAppBarTitle),
      body: Center(
        child: archiveState.map(
          loading: (_) => const CircularProgressIndicator(),
          success: (_) => const Text('Success'),
          error: (_) => const Text('Error'),
        ),
      ),
    );
  }
}
