import 'package:rebuilder_docs/main.dart';

final _documentations = box<Documentation>(store);
final documentationsRM = rm(_documentations);
final documentations = list(_documentations, documentationsRM);

@Entity()
class Documentation {
  @Id()
  int id = 0;
  String name = '';
  String content = '';
}
