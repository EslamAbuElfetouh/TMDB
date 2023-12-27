# TMDB App Documentation

TMDB is a movie app designed to showcase the latest movies and provide detailed information about each movie.
The app utilizes The Movie Database (TMDB) APIs to fetch movie data and follows the VIPER architecture for a scalable and modular codebase.

## Requirements
- iOS Target 16.0+
- Xcode 15.0+
  
## Scenes

1. **Home Screen:**
   - Displays a list of the latest movies.
   
2. **Details Screen:**
   - Provides detailed information about a selected movie.

3. **Favourite Screen:**
   - Currently it contains static data and mirrors the content of the home screen.

## Submodules

### 1. UIComponents
   - **Responsibility:**
     - Has the reusable UI components.

### 2. NetworkKit
   - **Responsibility:**
     - Handles API calls.
     - Contains loaders, models, and request models for data fetching.
     
*For more documentation about `NetworkKit.framework`, please check the framework documentation.*

## Project Dependencies Overview
<img width="1163" alt="Project Dependencies Overview" src="https://github.com/RyuuSenpai/TMDB/assets/13632150/4553c1ee-45c6-482b-8969-91b33da94e0e">

## App Tree

```plaintext
TMDB
├── SubModules
│   ├── NetworkKit
│   │   ├── ...
│   └── UIComponents
│       ├── ...
├── TMDB
│   ├── AppDelegate.swift
│   ├── ...
├── TMDB.xcodeproj
│   ├── ...
├── TMDBTests
│   ├── ...
└── TMDBUITests
    ├── ...
```
## App in Action
https://github.com/RyuuSenpai/TMDB/assets/13632150/d425c734-25f7-48bb-ade0-2b75a0a4ac77

## App Screenshots
| Movie List | Movie List While Scrolling |
|------------|-----------------------------|
| ![Movie List](https://github.com/RyuuSenpai/TMDB/assets/13632150/a286abdb-fc18-4a51-ad71-fcfcd6a42013) | ![Movie List While Scrolling](https://github.com/RyuuSenpai/TMDB/assets/13632150/738652ad-8bd1-4b89-ba58-c07db34c5f46) |
| Movie Details |
| ![Movie Details](https://github.com/RyuuSenpai/TMDB/assets/13632150/06ce8468-a5ea-4b12-bda1-f0f3f978e218) |
| Movie Favourite List navigation options | Favourite List |
| ![Option 1](https://github.com/RyuuSenpai/TMDB/assets/13632150/01f17593-2acd-43ad-ad96-1d0b025c2f80) | ![Option 2](https://github.com/RyuuSenpai/TMDB/assets/13632150/a85a626c-feda-4dc3-8258-98a061be1acc) |


