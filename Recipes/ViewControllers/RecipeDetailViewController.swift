//
//  RecipeDetailViewController.swift
//  Recipes
//
//  Created by Sebastian Bonilla on 6/28/19.
//  Copyright © 2019 bonsebas. All rights reserved.
//

import UIKit
import SDWebImage

class RecipeDetailViewController: UIViewController {

    var recipeId: Int?
    var recipe: Recipe?
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var instructionsLabel: UITextView!
    @IBOutlet weak var star1Image: UIImageView!
    @IBOutlet weak var star2Image: UIImageView!
    @IBOutlet weak var star3Image: UIImageView!
    @IBOutlet weak var star4Image: UIImageView!
    @IBOutlet weak var star5Image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let id = recipeId else { return }
        
        APIManager.getResponse(url: "http://gl-endpoint.herokuapp.com/recipes/\(id)") { [weak self] (data: Recipe?, error) in
            self?.recipe = data
            self?.setupUI()
        }
    }
    
    func setupUI() {
        guard let title = recipe?.title, let image = recipe?.image, let instructions = recipe?.instructions, let rating = recipe?.rating else { return }
        self.title = title
        self.recipeImage.sd_setImage(with: URL(string: image), completed: nil)
        self.instructionsLabel.text = instructions
        switch rating {
        case 1:
            star1Image.image = UIImage(named: "fill_star")
        case 2:
            star1Image.image = UIImage(named: "fill_star")
            star2Image.image = UIImage(named: "fill_star")
        case 3:
            star1Image.image = UIImage(named: "fill_star")
            star2Image.image = UIImage(named: "fill_star")
            star3Image.image = UIImage(named: "fill_star")
        case 4:
            star1Image.image = UIImage(named: "fill_star")
            star2Image.image = UIImage(named: "fill_star")
            star3Image.image = UIImage(named: "fill_star")
            star4Image.image = UIImage(named: "fill_star")
        case 5:
            star1Image.image = UIImage(named: "fill_star")
            star2Image.image = UIImage(named: "fill_star")
            star3Image.image = UIImage(named: "fill_star")
            star4Image.image = UIImage(named: "fill_star")
            star5Image.image = UIImage(named: "fill_star")
        default:
            break
        }
    }
}
