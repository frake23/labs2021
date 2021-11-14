import 'package:cli/cli.dart' as cli;

main(List<String> arguments) async {
  print('Hello world: ${await cli.calculate()}!');
}
