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
        
        navigationItem.hidesBackButton = true
        
        getResultAnimal(countOfAnimals: calculateResults())
        
        showResultAnimal()
    }
    
    private func calculateResults() -> [Animal: Int] {
        var countOfAnimals: [Animal: Int] = [:]
        
        let animals = results.map{ $0.animal }
        
        for animal in animals {
            countOfAnimals[animal] = (countOfAnimals[animal] ?? 0) + 1
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
