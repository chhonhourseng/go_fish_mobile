import 'package:app/export.dart';

////////////////// Interface

abstract class {{name.pascalCase()}}Interface {
  Future<BaseResponse<{{name.pascalCase()}}Response>> method({required {{name.pascalCase()}}Request request});
}

////////////////// Repository
@Injectable(as: {{name.pascalCase()}}Interface)
class {{name.pascalCase()}}Repository implements {{name.pascalCase()}}Interface {
  const {{name.pascalCase()}}Repository(this._service);
  
  final {{name.pascalCase()}}Service _service;

  Future<BaseResponse<{{name.pascalCase()}}Response>> method({required {{name.pascalCase()}}Request request}){
    return _service.method(request: request);
  }
}

////////////////// Service
@Injectable()
class {{name.pascalCase()}}Service implements {{name.pascalCase()}}Interface {
  Future<BaseResponse<{{name.pascalCase()}}Response>> method({required {{name.pascalCase()}}Request request}){
    return DioClient.postMethod<{{name.pascalCase()}}Response>(
      path: '/api',
      request: request.toJson(),
    );
  }
}
