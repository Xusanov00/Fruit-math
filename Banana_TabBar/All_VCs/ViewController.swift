//
//  ViewController.swift
//  Banana_TabBar
//
//  Created by Ali on 01/10/22.
//

import UIKit

//struct QuestionDM {
//    var firstQuestion: Int
//    var secondQuestion: Int
//    var options: [String]
//    var trueAnswer: String
//    
//}



class ViewController: UIViewController {

    
    
    @IBOutlet weak var resultLblApple: UILabel!
    
    @IBOutlet var firstImgsApple: [UIImageView]!
    
    @IBOutlet var secondImgsApple: [UIImageView]!
    
    
    @IBOutlet weak var resultViewApple: UIView!
    
    @IBOutlet var btnsApple: [UIButton]!
    
    
    
    
    var AppleQuestions: [QuestionDM] = [
        QuestionDM(firstQuestion: 2, secondQuestion: 4, options: ["2","6","7","5"], trueAnswer: "6"),
        QuestionDM(firstQuestion: 2, secondQuestion: 3, options: ["8","6","5","9"], trueAnswer: "5"),
        QuestionDM(firstQuestion: 5, secondQuestion: 5, options: ["10","9","7","6"], trueAnswer: "10"),
        QuestionDM(firstQuestion: 5, secondQuestion: 1, options: ["2","6","3","8"], trueAnswer: "6"),
        QuestionDM(firstQuestion: 4, secondQuestion: 5, options: ["10","6","9","5"], trueAnswer: "9"),
        QuestionDM(firstQuestion: 4, secondQuestion: 4, options: ["8","3","5","2"], trueAnswer: "8"),
        QuestionDM(firstQuestion: 3, secondQuestion: 3, options: ["5","6","1","9"], trueAnswer: "6"),
        QuestionDM(firstQuestion: 1, secondQuestion: 1, options: ["6","7","2","8"], trueAnswer: "2"),
        QuestionDM(firstQuestion: 3, secondQuestion: 1, options: ["5","3","4","2"], trueAnswer: "4"),
        QuestionDM(firstQuestion: 1, secondQuestion: 2, options: ["9","5","3","6"], trueAnswer: "3"),

    ]
    
    var curQIndex: Int = 0
    var trueAns: Int = 0
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        setAppleData()
    }

    
    
    
    func setAppleData() {

        if curQIndex > AppleQuestions.count-1 {
            resultLblApple.text = "\(trueAns) / \(AppleQuestions.count)"
            resultViewApple.isHidden = false
            return
        }
        
        AppleQuestions[curQIndex].options.shuffle()
        
        
        for ind in 0..<firstImgsApple.count {
            if ind < AppleQuestions[curQIndex].firstQuestion {
                firstImgsApple[ind].isHidden = false
            }else {
                firstImgsApple[ind].isHidden = true
            }
        }
        
        for ind in 0..<secondImgsApple.count {
            if ind < AppleQuestions[curQIndex].secondQuestion {
                secondImgsApple[ind].isHidden = false
            }else {
                secondImgsApple[ind].isHidden = true
            }
        }
        
        for btn in btnsApple.enumerated() {
            
            btn.element.setTitle(AppleQuestions[curQIndex].options[btn.offset] , for: .normal)
            
//            btn.element.setImage(UIImage(systemName: "\(AppleQuestions[curQIndex].options[btn.offset]).circle.fill", withConfiguration: UIImage.SymbolConfiguration(weight: .bold)), for: .normal) /*-------------BUTTON PICTURE-------------------*/
            
            btn.element.setTitleColor(.white, for: .normal)
            
        }
        
        
        
    }

    
    

    
    func findAppleAns()-> Int {
        
        for op in AppleQuestions[curQIndex].options.enumerated() {
            if op.element == AppleQuestions[curQIndex].trueAnswer {
                return op.offset
            }
        }
        
        
        return 0
    }

    
    
    func stopAppleBtn(isEnamle: Bool) {
        
        for btn in btnsApple {
            btn.isEnabled = isEnamle
            
        }
    }
    
    
    
    
    
    
    
    
    @IBAction func answerTapped(_ sender: UIButton) {
        
        if sender.currentTitle == AppleQuestions[curQIndex].trueAnswer {
            
            trueAns += 1
          sender.setTitleColor(.green, for: .normal)
            stopAppleBtn(isEnamle: false)
        }else {
            
          sender.setTitleColor(.red, for: .normal)
            
            let ind = findAppleAns()
            btnsApple[ind].setTitleColor(.green, for: .normal)
            stopAppleBtn(isEnamle: false)
            
        }
    }
    
    
    
    
    
    
    
    @IBAction func nextTapped(_ sender: UIButton) {
        
        curQIndex += 1
        setAppleData()
        stopAppleBtn(isEnamle: true)

    }
    
    
    
    
    
    
    
    @IBAction func restartTapped(_ sender: Any) {
        trueAns = 0
        curQIndex = 0
        resultViewApple.isHidden = true
        setAppleData()
        stopAppleBtn(isEnamle: true)
    }
    
    
    @IBAction func homeTapped(_ sender: Any) {
        dismiss(animated: true)
    }

}

