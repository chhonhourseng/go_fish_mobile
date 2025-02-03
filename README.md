# Agora

---

## Getting Started 🚀

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

_\*Agora works on iOS, Android, Web, and Windows._

---

## Working with Translations 🌐

### Adding Strings

```sh
./ff t -a
```


2. Use the new string

```dart

@override
Widget build(BuildContext context) {
  return Text(T.helloWorld.r);
}
```


---

## Working with Auto Export

```sh
./ff auto-export
```


---

## Working with Assets

### Generate Assets

```sh
./ff assets
```


2. Use the new Asset

```dart

@override
Widget build(BuildContext context) {
  return Text(AppAssets.logo);
}
```

---

## Working with Annotations Auto Generate Code

### Generate Injection
#### Annotations 
```dart
@Injectable()
class SimpleModelCubit {}
```
#### Using Injection
```dart
getIt<SimpleModelCubit>();
```
#### Build Generate
```sh
flutter pub run build_runner build --delete-conflicting-outputs --build-filter='lib/app/injector/*.dart'
```
### Generate Model
#### Annotations
```dart
@JsonAnnotation()
class SimpleModelResponse {}
```
#### Build Generate
```sh
flutter pub run build_runner build --delete-conflicting-outputs --build-filter='lib/data/models/**/*.dart'
```
---

## Working with Mason

### Create Generate code
#### Feature - (lib)
```sh
mason make feature
```
#### Crud - (lib)
```sh
mason make crud
```
#### Cubit
```sh
mason make cubit
```
#### Page
```sh
mason make page
```
#### Model
```sh
mason make model
```
---

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```