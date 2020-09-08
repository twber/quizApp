//
//  ViewController.swift
//  quizApp
//
//  Created by Bernice TSAI on 2020/9/8.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreTextField: UITextField!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var answerButtons: [UIButton]!
    var score:Int = 0
    var num = 0
    var dataBase = [QASet(question:"kosong", answer:"0"),QASet(question:"satu", answer:"1"),QASet(question:"dua",answer:"2"), QASet(question:"tiga",answer:"3"),QASet(question:"empat",answer:"4"),QASet(question:"lima",answer:"5"),QASet(question:"enam",answer:"6"),QASet(question:"tujuh",answer:"7"),QASet(question:"lapan",answer:"8"),QASet(question:"sembilan",answer:"9"),QASet(question:"sepuluh",answer:"10"),QASet(question:"sebelas",answer:"11"),QASet(question:"duabelas",answer:"12"),QASet(question:"tigabelas",answer:"13"),QASet(question:"empatbelas",answer:"14"),QASet(question:"limabelas",answer:"15"),QASet(question:"enambelas",answer:"16"),QASet(question:"tujuhbelas",answer:"17"),QASet(question:"lapanbelas",answer:"18"),QASet(question:"sembilanbelas",answer:"19"),QASet(question:"duapuluh",answer:"20"),QASet(question:"duapuluh satu",answer:"21"),QASet(question:"tigapuluh",answer:"30"),QASet(question:"empatpuluh",answer:"40"),QASet(question:"limapuluh",answer:"50"),QASet(question:"enampuluh",answer:"60"),QASet(question:"seratus", answer:"100"),QASet(question:"seribu", answer:"1,000"),QASet(question:"sepuluh ribu", answer:"10,000"),QASet(question:"Sejuta ", answer:"1,000,000"),QASet(question:"satu bilion", answer:"1,000,000,000"),QASet(question:"nombor", answer:"number"),QASet(question:"perpuluhan", answer:"decimals"),QASet(question:"kurang", answer:"less than"),QASet(question:"lebih", answer:"more than")]
    
    func questionQueue(){
        var choices : [String] = []
        questionLabel.text = "No \(num + 1).  " + dataBase[0].question
        let choiceOne = dataBase[0].answer
        choices.append(choiceOne)
        var databaseNew = dataBase
        databaseNew.remove(at: 0)
        for _ in 0...2{
            //databaseNew = databaseNew.shuffled()
            choices.append(databaseNew[0].answer)
            databaseNew.remove(at: 0)
        }
        choices.shuffle()
        for button in 0...3{
           answerButtons[button].setTitle(choices[button], for: .normal)
        }

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scoreTextField.text = "\(score)"
        dataBase.shuffle()
        questionQueue()
    }

    @IBAction func giveResponse(_ sender: UIButton) {
        print(dataBase.count)
        num = num + 1
        print("correct answer is :\(dataBase[0].answer)")
        print("my choice is :\(String(describing: sender.title(for: .normal)))")
        if num < 10 {
            if sender.title(for: .normal) == dataBase[0].answer{
                sender.backgroundColor = UIColor.green
                    score += 10
                    scoreTextField.text = "\(score)"
            }else{
                sender.backgroundColor = UIColor.red
            }
            dataBase.remove(at: 0)
            dataBase.shuffle()
            questionQueue()
            DispatchQueue.main.asyncAfter (deadline: .now() + 0.8){
                for button in self.answerButtons{
                button.backgroundColor = UIColor.clear
            }
            }
        } else if num == 10{
            if sender.title(for: .normal) == dataBase[0].answer{
                sender.backgroundColor = UIColor.green
                    score += 10
                    scoreTextField.text = "\(score)"
            }else{
                sender.backgroundColor = UIColor.red
            }
        
        DispatchQueue.main.asyncAfter (deadline: .now() + 0.8){
            for button in self.answerButtons{
            button.backgroundColor = UIColor.clear
            }
            self.score = 0
            self.scoreTextField.text = "\(self.score)"
                }
        num = 0
        dataBase.shuffle()
        questionQueue()
        
}
        
    }
}

