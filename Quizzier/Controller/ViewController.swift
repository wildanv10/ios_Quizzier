//
//  ViewController.swift
//  Quizzier
//
//  Created by Wildan Novaldi on 16/06/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var TrueButton: UIButton!
    @IBOutlet weak var FalseButton: UIButton!
    @IBOutlet weak var QuestionsProgress: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    var progress = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    @IBAction func AnswerAction(_ sender: UIButton) {
        let userAnswer = sender.titleLabel!.text == "True" ? true : false
        let actualAnswer = quizBrain.checkAnswer(userAnswer)
        
        if userAnswer == actualAnswer {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        QuestionLabel.text = quizBrain.getQuestionText()
        QuestionsProgress.progress = quizBrain.getProgress()
        ScoreLabel.text = "Score: \(quizBrain.getScore())"
        
        TrueButton.backgroundColor = UIColor.clear
        FalseButton.backgroundColor = UIColor.clear
    }
    
}

