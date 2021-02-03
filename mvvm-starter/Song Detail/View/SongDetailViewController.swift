//
//  SongDetailViewController.swift
//  mvvm-starter
//
//  Created by Adriana González Martínez on 2/3/21.
//

import UIKit

class SongDetailViewController: UIViewController {

    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var songImage: UIImageView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    private var viewModel = SongDetailVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        artistNameLabel.text = viewModel.artist
        songImage.image = UIImage(named:viewModel.songImageName)
        releaseDateLabel.text = viewModel.releaseDate
        songNameLabel.text = viewModel.songName
       
        setButtonText()
    }
    
    private func setButtonText(){
        if viewModel.isFavorite{
            favoriteButton.setTitle("Remove from Favorites", for: .normal)
        }else{
            favoriteButton.setTitle("Add to Favorites", for: .normal)
        }
    }
    
    @IBAction func favoriteButtonPressed(_ sender: Any) {
        viewModel.markFavoriteButtonPressed()
        setButtonText()
    }
    
}
