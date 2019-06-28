//
//  RecipesViewController.swift
//  Recipes
//
//  Created by Sebastian Bonilla on 6/28/19.
//  Copyright © 2019 bonsebas. All rights reserved.
//

import UIKit

class RecipesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var recipes: [Recipe]?
    var selectedRecipe: Int?
    let searchController: UISearchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSearch()
        self.title = "Recipes"
        APIManager.getResponse(url: "http://gl-endpoint.herokuapp.com/recipes") { [weak self] (data: [Recipe]?, error) in
            self?.recipes = data
            self?.tableView.reloadData()
        }
    }
    
    func setupSearch() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Recipes"
        
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

}

extension RecipesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = recipes?.count else { return 0 }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell") else {
            return UITableViewCell()
        }
        
        if let recipe = recipes?[indexPath.row] {
            cell.textLabel?.text = recipe.title
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detail = segue.destination as? RecipeDetailViewController else { return }
        detail.recipeId = selectedRecipe
    }
}

extension RecipesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRecipe = recipes?[indexPath.row].id
        self.performSegue(withIdentifier: "goDetail", sender: nil)
    }
}

extension RecipesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print("search fired")
    }
}


