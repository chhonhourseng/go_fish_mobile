import 'package:app/export.dart';

typedef {{name.pascalCase()}}State = BaseBlocState<{{name.pascalCase()}}Response>;

@Injectable()
class {{name.pascalCase()}}Cubit extends BaseBlocCubit<{{name.pascalCase()}}Response> {
  {{name.pascalCase()}}Cubit(this.repository);

  final {{name.pascalCase()}}Interface repository;

  @override
  Future<BaseResponse<{{name.pascalCase()}}Response>> responseData([String? id, data, subData, bool isNetwork = true]) async {
    if (data is {{name.pascalCase()}}Request) {
      final response = await repository.method(request: data);
      if (kDebugMode) {}
      return response;
    }
    throw const CustomException().toString();
  }

/// Future<BaseResponse<{{name.pascalCase()}}Response>> method({required {{name.pascalCase()}}Request request});
}