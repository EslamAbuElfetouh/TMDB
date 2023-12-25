# TMDB App Documentation

TMDB is a movie app designed to showcase the latest movies and provide detailed information about each movie.
The app utilizes The Movie Database (TMDB) APIs to fetch movie data and follows the VIPER architecture for a scalable and modular codebase.

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
     - Houses reusable UI components.

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
