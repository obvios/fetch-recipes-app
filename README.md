# Steps to Run the App
1. Ensure you have **Xcode 15.3** or later installed on your Mac.

2. Clone the repository to your local machine:
```
git@github.com:obvios/fetch-recipes-app.git
```
```
https://github.com/obvios/fetch-recipes-app.git
```

3. Open the `.xcodeproj` file in Xcode.

4. The project uses Swift Package Manager for dependencies. Xcode should automatically fetch the Kingfisher package. If not, go to **File > Packages > Resolve Package Versions**.

5. Select an iOS 16 simulator or a physical device running iOS 16 or later as the run destination.

6. Click the Run button (▶️) or press **Cmd+R** to build and run the app.

## Notes
- This app requires iOS 16.0 or later.
- The app uses the Kingfisher library for efficient image downloading and caching.

## Troubleshooting
If you encounter any issues with the Kingfisher package:
- Go to **File > Packages > Reset Package Caches**
- Clean the build folder (**Shift+Cmd+K**)
- Rebuild the project

Ensure you have an active internet connection for the initial download of the Kingfisher package and for the app to fetch data and images.

# Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?
1. Architecture: I prioritized setting up a Clean Architecture to establish clear boundaries, maintain single responsibility, and emphasize testability. With a clear separation of concerns, the project becomes more scalable and maintainable, which I believe adds long-term value.

2. Unit Testing: I dedicated time to setting up mocks and testing across the domain, data access, and presentation layers. This approach allowed me to validate business logic, data handling, and state management independently.

# Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?
I spent approximately 6-7 hours on this project. I allocated time as follows:
- 25%: Creating a technical design document and defining core components
- 25%: Implementing the domain and data access layers
- 25%: Building the presentation layer and testing functionality
- 25%: Writing unit tests to verify functionality and test edge cases

# Trade-offs and Decisions: Did you make any significant trade-offs in your approach?
Image Caching: I chose to use the third-party Kingfisher library for image caching to speed up development. While this introduces a third-party dependency, Kingfisher’s ease of integration, SwiftUI support, and performance were well-suited to the app’s requirements. Given more time, I would abstract it behind a protocol/facade to maintain flexibility.

Dependency Injection: Due to time constraints, I opted not to use a dedicated dependency injection framework. Instead, I initialized and injected dependencies at the app entry point. With more time, I would have implemented a dependency container to manage initialization more cleanly.

# Weakest Part of the Project: What do you think is the weakest part of your project?
I believe the weakest part is the networking code. Ideally, I would implement a more robust networking infrastructure using protocols and generics to reduce boilerplate, with support for tracking metrics such as request/response times and error rates.

# External Code and Dependencies: Did you use any external code, libraries, or dependencies?
Yes, I used the Kingfisher library for image caching due to its straightforward integration with Swift Package Manager, SwiftUI support, and suitability for this project’s use case.

# Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.
I recognize that I could have completed the assignment more quickly with a simpler approach to architecture. However, I believe the increased testability and clarity achieved with Clean Architecture were worth the initial setup time.

Additionally, while I streamlined dependency injection to prioritize other parts of the application, given more time, I would refactor this area for a more scalable dependency management solution.

Lastly, although the UI was simple, given more time I would also prefer to further refine the styling by defining reusable styles and using constants for padding and layout values instead of hard-coding them. This would improve consistency, make the code more maintainable, and allow for easier adjustments to the design if needed.
