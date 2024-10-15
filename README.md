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

# Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?
I spent approximately 6-7 hours on this project. I allocated time as follows:
- 25%: Creating a technical design document and defining core components
- 25%: Implementing the domain and data access layers
- 25%: Building the presentation layer and testing functionality
- 25%: Writing unit tests to verify functionality and test edge cases

# Trade-offs and Decisions: Did you make any significant trade-offs in your approach?
One significant trade off was the use of a third party image caching library, Kingfisher. This was a choice I made for rapid development, at the cost of introducing a
dependency on a third party library. Of course I could have abstracted it behind a protocol/facade, however I chose not to for times sake.

I also decided not to spend time on setting up a dependency injection framework, again due to time. So instead I simply initialize and inject the dependencies at the app
entry point. If given more time, I would have preferred to implement a dependency container responsible for initializing important objects.

# Weakest Part of the Project: What do you think is the weakest part of your project?
I believe the weakest part of my project is the networking code. Ideally, I would implemement a networking infrastructure layer more robustly, with protocols and generics.
This would reduce boilder plate code for using APIs and could help to track general metrics.

# External Code and Dependencies: Did you use any external code, libraries, or dependencies?
Yes, I used the Kingfisher third party library to handle image caching. I chose it for it's straightforward integration with the Swift Package Manager sytem, it's SwiftUI support, and ease of use
for the apps use case.

# Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.
I realize that I could have completed the assignemnt quicker if I had put less emphasis on using a Clean architecture approach, due to the increased overhead to set up. However,
I believe that the increased testability of the core peices of the app was worth it.

I also want to point out that I took a shortcut with dependency injection. At that point I was more focused on developing a clean UI and testing for edge cases.
