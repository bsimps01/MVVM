//
//  SongDetailVM.swift
//  mvvm-starter
//
//  Created by Adriana González Martínez on 2/3/21.
//

import Foundation

class MovieDetailVM {
        
    private (set) var songName, songImageName, artist, releaseDate: String!
    private (set) var isFavorite: Bool!
    
    private var dataModel: Song! = nil
    
    var markFavoriteButtonPressed: () -> () = { }
    
    func viewDidLoad() {
        configureDataModel(data: movieData())
        configureOutput()
        
        markFavoriteButtonPressed = { [weak self] in
            guard let _self = self else { return }
            _self.isFavorite = !_self.isFavorite
        }
    }
        
    private func movieData() -> [String: Any] {
        return DataSource.randomSong()
    }
    
    private func configureDataModel(data: [String: Any]) {
        dataModel = Song(data: data)
    }
    
    private func configureOutput() {
        songName = dataModel.songName
        songImageName = dataModel.songImageName
        artist = dataModel.artist
        isFavorite = dataModel.isFavorite
        releaseDate = releaseDisplayDataForMovie()
    }
    
    private func releaseDisplayDataForMovie() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd,yyyy"
        return dateFormatter.string(from: dataModel.releaseDate)
    }
    
}
