//
//  ViewController.swift
//  matubatsuApp
//
//  Created by 待寺翼 on 2023/07/27.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    var currentQuestionNum = 0
    
    let questions: [[String: Any]] = [
        [
            "question":  "iphoneアプリを開発する統合環境はZcodeである",
            "answer": false
        ],
        [
            "question": "xcode画面の右側にはユーティリティーズがある",
            "answer": true
        ],
        [
            "question": "UILabelは文字列を表示する際に利用する",
            "answer": true
        ]
    ]
    
    func shoeQuestion() {
        let question = questions[currentQuestionNum]
        if let que = question["question"] as? String{ questionLabel.text = que
            
        }
    }
    func checkAnswer(yourAnswer: Bool) {
        
        let question = questions[currentQuestionNum]
        
        if let ans = question["answer"] as? Bool {
            
            if yourAnswer == ans {
                
                currentQuestionNum += 1
                showAlert(message: "正解!!")
            } else {
                showAlert(message: "不正解×")
            }
            
        } else {
            print("答えが入ってません")
            return
        }
        
        if currentQuestionNum >= questions.count {
            
            currentQuestionNum = 0
        }
            shoeQuestion()
        }

    func showAlert(message: String){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let close = UIAlertAction( title: "閉じる", style: .cancel)
        alert.addAction(close)
         present(alert, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        shoeQuestion()
    }
    
    @IBAction func tappedYesButton(_ sender: Any) {
        checkAnswer(yourAnswer: true)
    }
       @IBAction func tappedNoButton(_ sender: Any) {
           checkAnswer(yourAnswer: false)
    }
    
}
