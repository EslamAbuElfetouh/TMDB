# NetworkLayer Documentation

## Overview

- The NetworkLayer is a Swift module designed to handle API requests in a scalable, maintainable, and testable way. It provides a flexible and extensible architecture for making HTTP requests and handling API responses.
- To Start using this you can just conform to the APILoaderProtocol, and just call `loadItems` method, or you can create your own implemenation using `APIClient.share` directly without using the loader.

## Usage
- In AppDelegate config APIClient by injecting `NetworkLayerConfigProtocol`

```swift
let networkConfig = NetworkLayerConfig(baseUrl: YourBaseUrl,
                                       token: YourToken)
APIClient.shared.configClient(networkConfig)

```
- Create your own loaderProtocol and loader that match your needs for the API request, and conform to `APILoaderProtocol`.

```swift
// Defining the method name and expected result
public protocol YourLoaderProtocol {
    func loadMyItems(requestConfiguration configuration: APIRequestConfigurationProtocol,
                          completionHandler: @escaping (APIResult<YourModel>) -> Void)
}

// Conform to APILoaderProtocol and YourLoaderProtocol.
class YourAPILoader: APILoaderProtocol, YourLoaderProtocol {
    typealias Entity = YourModel

    func loadMyItems(requestConfiguration configuration: APIRequestConfigurationProtocol,
                   completionHandler: @escaping ResultHandler<Entity>) {
        // Call `loadItems` method that was predefined in the `APILoaderProtocol` extension to perform the request.
        loadItems(requestConfiguration: configuration, completionHandler: completionHandler)
    }
}
```

Now you can use `YourLoader` to loadYourItems, without the need to directly interact with APIClient, promoting code reusability and testability, since you can Mock your loader and pass your expected result to it, and you can reuse your loader in anyplace across app.

## Table of Contents

1. [APIClient](#apiclient)
2. [APILoaderProtocol](#apiloaderprotocol)
3. [NetworkLayerConfig](#networklayerconfig)
4. [APIRequestConfiguration](#apirequestconfiguration)
5. [APIRequestInterceptor](#apirequestinterceptor)
6. [APIRouterProtocol](#apirouterprotocol)
