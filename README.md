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

# Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?

# Trade-offs and Decisions: Did you make any significant trade-offs in your approach?

# Weakest Part of the Project: What do you think is the weakest part of your project?

# External Code and Dependencies: Did you use any external code, libraries, or dependencies?

# Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.
