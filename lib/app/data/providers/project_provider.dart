import '../models/project.dart';
import 'pocketbase_provider.dart';

class ProjectProvider extends PocketbaseProvider {
  Future<List<Project>> fetchProjects() async {
    final records = await pb.collection('projects').getFullList();
    return records.map((e) => Project.fromRecord(e)).toList();
  }
}
