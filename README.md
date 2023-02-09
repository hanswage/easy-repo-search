# easy-repo-search
An easy application for iOS to search through GitHub repositories. This application is designed as a simple application, using only SwiftUI, Swift, MVVM design principles and Combine.

# Techniques
- Swift
- SwiftUI
- Combine
- MVVM

# Requirements
Please use Xcode 14.2 or higher. No additional setup is required.

# Config.xcconfig
Found in `easy repo search/Resources` directory, there is a file called `Config.xcconfig`. This file contains the variable `GITHUB_KEY`. Please update this key with your own variable. A key is required to increase the number of requests a single user can make per minute. However, the app can run without a key, if it would be removed from the code.

Note: The key is a dummy key and needs to be replaced.

# Project setup
The project has two targets: the app and Unit Tests.

## App
After the Launch Screen, the app opens `ContentView` as its first view, found in the group `Views`. This view is filled by `GitHubViewModel`, found under the `ViewModels` group. A list is displayed, filled with labels made from `RepoCellView`. After typing in a search query, any repository can be clicked.

This will open `DetailView`, showing details about the selected repository. A common element is `DetailsCounterView`, that shows an icon and the number of stars, viewers and forks.

## Tests
Tests are added to the app. This uses a mock of the `ResponseProtocol`, allowing custom json files with certain conditions to be loaded.

## Model hierarchy
The incoming data is parsed into a model, with the following hierarchy:
- GitHubSearch (Object)
	- GitHubItem (Array)
		- GitHubOwner (Object)