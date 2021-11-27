# Octokot

Swift toolkit for the GitHub API

## Quick start

```swift
import Octokot

let github = GitHubAPI()
```

```swift
let repo = try await github.repos.apple.swift()
```

```swift
let repo = try await github.repos["server-swift"]["async-http"]()
```

