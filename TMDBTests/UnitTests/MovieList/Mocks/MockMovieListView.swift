//
//  MockMovieListView.swift
//  TMDBTests
//
//  Created by Eslam Abo El Fetouh on 22/12/2023.
//

import Foundation
import UIKit
@testable import TMDB

class MockMovieListView: MovieListControllerProtocol {
    // MARK: - Properties

    var updateMoviesCallsCount = 0
    var reloadCollectionViewCallsCount = 0
    var presentErrorCallsCount = 0
    var setLoadingIndicatorVisibleCallsCount = 0
    var loadingIndicatorIsVisible: Bool?
    var stopRefreshingIndicatorCallsCount = 0
    // Expected properties values
    var errorMessage = String()

    // MARK: - Methods

    func updateMovies() {
        updateMoviesCallsCount += 1
    }
    
    func reloadCollectionView() {
        reloadCollectionViewCallsCount += 1
    }
    
    func presentError(with message: String) {
        errorMessage = message
        presentErrorCallsCount += 1
    }
    
    func animateLoadingIndicator() {
        setLoadingIndicatorVisible(true)
    }
    
    func stopLoadingIndicator() {
        setLoadingIndicatorVisible(false)
    }
    
    func setLoadingIndicatorVisible(_ isVisible: Bool) {
        loadingIndicatorIsVisible = isVisible
        setLoadingIndicatorVisibleCallsCount += 1
    }
   
    func stopRefreshingIndicator() {
        stopRefreshingIndicatorCallsCount += 1
    }
    
    func showBottomSheetAlert(title: String, message: String, actions: [UIAlertAction]) {
        // Do nothing
    }
    func showCollectionPlaceholderLabel() {
        // Do nothing
    }
    
    func hideCollectionPlaceholderLabel() {
        // Do nothing
    }
    
    func updateCollectionPlaceholderLabel(text: String) {
        // Do nothing
    }
    
    func showActionSheetAlert(with configuration: TMDB.AlertConfiguration) {
        // Do nothing
    }
}
