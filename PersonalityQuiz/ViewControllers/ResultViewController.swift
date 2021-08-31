//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var titleOfResultLabel: UILabel!
    @IBOutlet weak var descriptionOfResultLabel: UILabel!
    
    var results: [Answer]!
    private var resultAnimal: Animal!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.setHidesBackButton(true, animated: true)
        
        getResultAnimal(countOfAnimals: calculateResults())
        
        showResultAnimal()
    }
    
    private func calculateResults() -> [Animal: Int] {
        
        var countOfDogs = 0
        var countOfCats = 0
        var countOfRabbits = 0
        var countOfTurtles = 0
        
        var countOfAnimals: [Animal: Int] = [:]

        for result in results {
            switch result.animal {
            case .dog:
                countOfDogs += 1
                countOfAnimals[result.animal] = countOfDogs
            case .cat:
                countOfCats += 1
                countOfAnimals[result.animal] = countOfCats
            case .rabbit:
                countOfRabbits += 1
                countOfAnimals[result.animal] = countOfRabbits
            case .turtle:
                countOfTurtles += 1
                countOfAnimals[result.animal] = countOfTurtles
            }
        }
        
        return countOfAnimals
    }
    
    private func getResultAnimal(countOfAnimals: [Animal: Int]) {
        let maxResult = countOfAnimals.max { $0.value < $1.value }
        
        guard let resultAnimal = maxResult else { return }
        
        self.resultAnimal = resultAnimal.key
    }
    
    private func showResultAnimal() {
        titleOfResultLabel.text = "Вы - \(resultAnimal.rawValue)"
        descriptionOfResultLabel.text = resultAnimal.definition
    }
}
