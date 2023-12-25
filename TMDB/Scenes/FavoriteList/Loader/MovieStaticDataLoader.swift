//
//  MovieStaticDataLoader.swift
//  TMDB
//
//  Created by Eslam Abo El Fetouh on 25/12/2023.
//

import Foundation
import NetworkKit

protocol MovieLocalDataLoaderProtocol {
    func loadMovies() -> MovieResponse
}
final class MovieStaticDataLoader: MovieLocalDataLoaderProtocol {
    
    func loadMovies() -> MovieResponse {
        .init(page: 1, results: createMovies(), totalPages: 1, totalResults: 10)
    }
    
    private func createMovies() -> [Movie] {
        [
            .init(id: 554600,
                  title: "Uri: The Surgical Strike",
                  overview: "Following the roguish terrorist attacks at Uri Army Base camp in Kashmir, India takes the fight to the enemy, in its most successful covert operation till date with one and only one objective of avenging their fallen heroes.",
                  releaseDate: "2019-01-11",
                  posterPath: "/yNySAgpAnWmPpYinim9E0tUzJWG.jpg",
                  backdropPath: "/S3EIcOUQYxgd3QzjOo2rZJ2MN8.jpg",
                  voteAverage: 7.2
                 ),
            .init(
                id: 562,
                title: "Die Hard",
                overview: "NYPD cop John McClane's plan to reconcile with his estranged wife is thrown for a serious loop when, minutes after he arrives at her office, the entire building is overtaken by a group of terrorists. With little help from the LAPD, wisecracking McClane sets out to single-handedly rescue the hostages and bring the bad guys down.",
                releaseDate: "1988-07-15",
                posterPath: "/yFihWxQcmqcaBR31QM6Y8gT6aYV.jpg",
                backdropPath: "/yw55hiqnDOwZiXpkraXu114rmGz.jpg",
                voteAverage: 7.8
            ),
            .init(
                id: 88096,
                title: "Prep & Landing: Naughty vs. Nice",
                overview: "Lanny and Wayne are at it again! With the Big 2-5 fast approaching, Wayne and Lanny must race to recover classified North Pole technology which has fallen into the hands of a computer-hacking Naughty Kid! Desperate to prevent Christmas from descending into chaos, Wayne seeks out the foremost Naughty Kid expert to aid in the mission: a bombastic member of the Coal Bucket Brigade who also happens to be his estranged brother, Noel.",
                releaseDate: "2011-12-05",
                posterPath: "/4TLCK2Gb6eAEmaszg001o1hjGfS.jpg",
                backdropPath: "/jWV48K20m0wF7yNOjrA1ifUBeSJ.jpg",
                voteAverage: 6.9
            )
        ]
    }
}
