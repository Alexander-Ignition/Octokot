# 🐱 Octokot

[![Test](https://github.com/Alexander-Ignition/Octokot/actions/workflows/test.yml/badge.svg)](https://github.com/Alexander-Ignition/Octokot/actions/workflows/test.yml)
[![SPM compatible](https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat)](https://swift.org/package-manager)
[![Swift 5.3](https://img.shields.io/badge/swift-5.5-brightgreen.svg?style=flat)](https://developer.apple.com/swift)
[![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://github.com/Alexander-Ignition/Octokot/blob/master/LICENSE)

Swift toolkit for the GitHub API

## Instalation

Add dependency to `Package.swift`...

```swift
.package(url: "https://github.com/Alexander-Ignition/Octokot", branch: "main"),
```

... and your target

```swift
.target(name: "ExampleApp", dependencies: ["Octokot"]),
```

## Usage

Import the library and you can create an instance of the GitHub API. 
It is a wrapper over the [GitHub REST API](https://docs.github.com/en/rest)

```swift
import Octokot

let github = GitHubAPI()
```

Most methods are similar to urls from REST API.

You can call them using swift `@dynamicMemberLookup` ...

```swift
let repo = try await github.repos.apple.swift()
```

... or you can use them via `subscript`.

```swift
let repo = try await github.repos["server-swift"]["async-http"]()
```

## Authentication

### Personal Access Token

[Create a Personal Access Token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) 
after which you can set it in the configuration and use the methods for which authentication is required.

```swift
var configuration = GHConfiguration.default
configuration.setAccessToken("<personal_access_token>")

let github = GitHubAPI(configuration: configuration)

let user = try await github.user()
```

Personal Access Token can be in base 64 encoded strings for this case there is a second method in the configuration.

```swift
configuration.setAccessToken(base64: "<base64_encoded_personal_access_token>")
```
