//
//  ViewController.swift
//  Quiz
//
//  Created by Carlos Poles on 2/11/17.
//  Copyright © 2017 Carlos Poles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    //  Model Layer
    
    let questions: [String] = [
        "What is 7+7?",
        "What is the capital of Vermont",
        "What is cognac made from?"
    ]
    
    let answers: [String] = [
        "14",
        "Montpellier",
        "Grapes"
    ]
    
    // currentQuestionIndex keeps the current indices of the arrays
    var currentQuestionIndex: Int = 0
    
    // MARK: Class Methods
    func animateLabelTransitions() {
        // Animate the alpha
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [],
                       animations: {
            self.currentQuestionLabel.alpha = 0
            self.nextQuestionLabel.alpha = 1
        }, // closure type ()->Void as animations: argument
            completion: { _ in swap(&self.currentQuestionLabel, &self.nextQuestionLabel)
        })
    }
    
    // MARK: Action Methods
    
    @IBAction func showNextQuestion(_ sender: UIButton) {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        
        let question: String = questions[currentQuestionIndex];
        nextQuestionLabel.text = question
        answerLabel.text = "???"
        
        // animate the question label transitions
        animateLabelTransitions()
    }
    
    @IBAction func showAnswer(_ sender: UIButton) {
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    // MARK: UIViewController Overrides
    // load first question before the UI is rendered
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestionLabel.text = questions[currentQuestionIndex]
    }
    
    // set the label's initial alpha
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nextQuestionLabel.alpha = 0
    }
    
}

