## Bike Rental Demo App

## 1. How to Run

### Prerequisites

- Flutter SDK (3.10.x or compatible)
- For Android: Android Studio with Android SDK
- For iOS: Xcode (macOS only)
- For Web: Chrome or any modern browser

### Setup

```bash
# Install dependencies
flutter pub get

# Generate code (DI, localization)
flutter pub run build_runner build --delete-conflicting-outputs
```

### Running on Different Platforms

**Android:**

```bash
flutter run
# Or specify device
flutter devices                    # List available devices
flutter run -d <device-id>         # Run on specific device
```

**iOS (macOS only):**

```bash
flutter run
# Or specify device
flutter run -d iPhone               # Run on iPhone simulator
flutter run -d iPad                 # Run on iPad simulator
```

**Web:**

```bash
flutter run -d chrome               # Run on Chrome
flutter run -d edge                 # Run on Edge
flutter run -d web-server           # Run on web server (localhost)
```

The mocked environment is configured via DI (`AppEnvironment.mocked`), so the app is immediately usable with seeded data. No backend setup is required.

## 2. Architecture Overview

In this app, we use a **Clean Architecture** approach with three main layers: data, domain, and presentation. This layer based architectur keeps each features loosely coupled and makes it easier to swap implementations or add new features without breaking existing ones.

The **domain layer** is the heart of the application, the business layer. It contains business entities, repository interfaces, and usecases that represent the real world rules of the product. As long as the real world business logic does not change, this layer should stay stable and unaffected by UI or infrastructure changes.

The **data layer** is where we connect to data sources, such as REST APIs, GraphQL endpoints, local databases, in memory datasources, or any combination of them. This layer is responsible for translating the data we get from outside the app into domain entities that the domain layer understands, and for implementing the repository interfaces defined by the domain layer.

The **presentation layer** is where we handle the UI, such as pages and widgets (components). This layer consumes usecases from the domain layer and shows information to the user based on the business rules defined there. It does not know how data is stored or fetched, only how to react to domain level results and states.

---

## 3. Decisions & Trade-offs

### Architecture Choices

**Clean Architecture with Feature Modules**

- **Decision**: Organize code by features rather than by technical layers only, so each feature contains its own data, domain, and presentation layers.
- **Advantage**: This keeps each feature loosely coupled and isolated from others. A change or removal in one feature will not impact others, and adding new functionality to a feature won't break unrelated features. This isolation makes it much easier to maintain and refactor, for example, moving to a true multi-module setup in the future is more straightforward.The separation allows teams to work on features independently.
- **Trade-off**: Some code duplication (such as similar repository patterns across features), but better encapsulation and easier feature scaling.

**Bloc/Cubit for State Management**

- **Decision**: Use `flutter_bloc` as the state management library. The approach is to use Cubit as much as possible, and only introduce Bloc when a flow becomes complex enough to need event based handling. In this app, a state has to be a class, not just a primitive value like `isLoading`, for example we use class based states such as `SomeFeatureLoadingState`.
- **Advantage**: Bloc and Cubit use a state based model where the UI is fully driven by explicit states. We have to define what the expected states are up front, which makes the UI and logic are predictable. Using class based states, sealed classes, and inheritance also keeps the code cleaner and gives strong type safety when handling different branches of logic.
- **Disadvantage**: Using Bloc and class based states introduces more boilerplate compared to simpler state management approaches such as `Provider` or plain `get_it`. Some of this boilerplate can be reduced by introducing shared base classes such as a `BaseCubit` or `BaseBloc` in the future.

**Injectable for Dependency Injection**

- **Decision**: Use code generation with `injectable` and `get_it` instead of manual wiring.
- **Advantage**: We do not have to define a manual service locator. Especially when the app is getting bigger, the dependencies will be getting bigger also and it will be really hard to maintain the service locator. Injectable solves this issue by automatically generating the service locator.
- **Disadvantage**: First, it adds a build step to the application. As the application grows, it may take some time to finish the build runner. Also, using injectable makes us have to add "non business" code into the domain layer, especially in usecases we need to add `@injectable`. But this is not a problem to add non business code into domain as long as we have a strict rule like which code can be added to domain and which code cannot be added.

**Mocked Datasources with In Memory DBs**

- **Decision**: In this application, I am using a mocked database because of the limited time I had.
- **Trade-off**: The data will be deleted as soon as the application is killed.

**Using Slang as Localization Rather Than Flutter Localization**

- **Decision**: In this application, we are using slang as the localization library. At start I was trying to use localization made by the Flutter team (flutter_localization). But I faced an issue when trying to map a backend error message to translated local message for form issues, as I was trying to map it dynamically by the ARB keys to message. So I had an experience of using slang and I knew that it is possible in slang, so that's why I am using slang so that we can map the data from the backend.
- **Advantage**: Slang allows us to dynamically map backend error messages to translated local messages by ARB keys, which was not possible with flutter_localization. This makes it easier to handle form validation errors and other backend messages that need to be translated.
- **Disadvantage**: We are adding a dependency to a third party library which is maintained not by the official team.

**Form Validation in Backend**

- **Decision**: From my experience, form validation should happen in the backend. Having validation in the backend makes sure that we only have one source of truth for the validation rules, and it also makes it possible to change those rules without redeploying the application to the store. But if the application is fullstack, like using Firebase, or is just a local app, we can add validation in the datasource layer.
- **Advantage**: Adding validation in the datasource layer keeps the presentation layer clean, so that later if we add or change a backend we only need to update the datasource layer, not the presentation layer.
- **Trade-off**: In this application there is currently no form validation, but if I had to add it I would put the validation in the datasource layer. A schema based validation would be convenient here, because we can create the schema once and reuse it everywhere in the app. I am currently creating a schema based validator named "vality" that follows this idea.

---

## 4. What You Would Do Next with More Time

1. Add unit testing and UI testing to the application.

2. Add a validator to the form.

3. Improve the UI looks to make it more attractive.

4. Use cached image for network images.

5. In home we have a lot of "list" including PromotionList, PackageList and BikeList. Unfortunately in current implementation each section is still using a List.builder/grid.builder with shrinkwrap=true. This can lead to performance issues as the number of list items grows. In the future maybe we can use a CustomScrollView combined with SliverListBuilder or SliverGridBuilder so that the list will be rendered efficiently to avoid performance issues.

6. Use Firebase database. The application is currently still using mocked in memory database. I actually have prepared so that the app can be easily shifted to another data source. You can read the Data and Mocked Backends section below for more details.

7. Add extra flavor to the application by having multiple environments. For example, we can have a `mocked` environment (which can be used for automation UI testing), a `firebase-dev` environment for development testing, and a `firebase-prod` environment for production.

## 5. AI Tools Usage

1. Using Figma AI to generate the design.

2. Using Cursor to help with the coding especially generating repetitive code, using its auto completion, discussing about some architectural trade-off and other things. I can say that I use a lot of AI in this application and it makes me more like the architect of the app rather than a casual coder. But I guarantee I understand 100% of the application.

3. Using the AI to help me generate the README especially to fix some wording and grammar issues.

## Features

### Onboarding and Account

- Simple register flow (name, email, password).
- Simple login flow.
- Session handled through a mocked session handler and a secure storage abstraction.

### Explore and Rent

- **Home**
  - **Promotions**: title, short copy, validity.
  - **Rental Packages**: plan, per day or per week price, and terms.
  - **Bikes**: model, image, range, and availability.
- **Bike Detail Page**
  - Shows full bike information (specifications, description, availability badge).
  - **I am Interested to Rent** button:
    - Opens a dialog with a rental interest form.
    - Fields: preferred start date, pickup area, contact, additional notes.
    - On submit, shows success and stores the submitted interest.
  - If an interest already exists for the current user and bike:
    - The primary button changes to **View Details**.
    - Opens a read only bike interest dialog showing the submitted interest.

---

## Data and Mocked Backends

Data is backed by in memory mocked datasources, injected via `injectable`:

- `AuthMockedNetworkDts` with `AuthMockDB`
- `BikeMockedNetworkDts` with `BikeMockDB`
- `BikeInterestMockedNetworkDts` with `BikeInterestMockDB`
- `PackageMockedNetworkDts` with `PackageMockDB`
- `PromotionMockedNetworkDts` with `PromotionMockDB`

Pattern:

- Each mocked network datasource is registered as `@Injectable(as: XNetworkDts, env: [AppEnvironment.mocked])`.
- Each has a companion `@LazySingleton` mock DB that lives for the lifetime of the app, keeping data in memory across calls.

This keeps the app fast and deterministic while still mimicking a real multi layer data flow.

### Future Backend Integration (for example, Firebase)

This mocked setup is ready to be replaced by real backends:

1. Implement the network datasource interfaces, for example `BikeFirebaseNetworkDts implements BikeNetworkDts`, `AuthFirebaseNetworkDts implements AuthNetworkDts`, and so on.
2. Add a new environment, for example extend `AppEnvironment` with `firebase` or `production`.
3. Register the new implementations with `@Injectable(as: XNetworkDts, env: [AppEnvironment.firebase])`.
4. Switch the environment that is passed to `configureDependencies`.

Because repositories depend only on the network datasource interfaces, the domain and presentation layers do not need to change when real backends are added.

---

## Caching and Memoization

This app has no caching and memoization functionality yet.
