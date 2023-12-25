# NetworkKit.framework Documentation

## Overview

The `NetworkKit.framework` is designed to simplify the usage of the underlying `NetworkLayer package`, providing a higher-level abstraction for common networking tasks. It encompasses loaders, models, and routers tailored to specific use cases.

## Usage:
To use NetworkKit.framework, follow these steps:

### Adding Framework to Target:
Add Framework to Target's `Frameworks, Libraries, and Embedded Content` located in `Genral` tab.

### Configure APIClient:
##### - Importing NetworkLayer in AppDelegate

##### - injecting `NetworkLayerConfigProtocol.
```swift
let networkConfig = NetworkLayerConfig(baseUrl: YourBaseUrl,
                                            token: YourToken)
APIClient.shared.configClient(networkConfig)
```

### Create Routers.
Create Enum, that conforms to `APIRouterProtocol`, each enum should contain API cases depending on Your API categorization.`Please check NetworkLayer Documenation for more details about how to create Routers`.

### Create and reuse Loaders:
Create and reuse loaders for your specific API requests.`Please check NetworkLayer Documenation for more details about how to create Loader`.

### Create Models:
Create the models within the NetworkKit.framework for structured representation of API responses. and reuse the models based on your use case.
###### Example:
```swift
public struct Movie: Codable {
    public let id: Int?
    public let overview: String?

public init(id: Int,
            overview: String?) { 
    self.id = id
    self.overview = overview
}

enum CodingKeys: String, CodingKey {
    case id
    case overview = "over_view"
}

```

### Create Request Model:
Create Request Models that encapsulate the parameters needed for specific API requests. Request Models help structure your data and make API calls more readable and maintainable.
###### Example:
```swift
public struct DiscoverMovieRequest: Encodable {
    let page: Int
    let sortBy: String?

public init(page: Int,
            sortBy: String?) { 
    self.page = page
    self.sortBy = sortBy
}

enum CodingKeys: String, CodingKey {
    case sortBy = "sort_by"
    case page
}
```
