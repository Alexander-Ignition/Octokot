# Octokot

[![Test](https://github.com/Alexander-Ignition/Octokot/actions/workflows/test.yml/badge.svg)](https://github.com/Alexander-Ignition/Octokot/actions/workflows/test.yml)
[![SPM compatible](https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat)](https://swift.org/package-manager)
[![Swift 5.3](https://img.shields.io/badge/swift-5.5-brightgreen.svg?style=flat)](https://developer.apple.com/swift)
[![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://github.com/Alexander-Ignition/Octokot/blob/master/LICENSE)

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
