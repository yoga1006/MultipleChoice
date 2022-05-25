//
//  ViewController.swift
//  MultipleChoice
//
//  Created by Yoga on 2022/5/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var yesornoLabel: UILabel!
    @IBOutlet weak var questionSlider: UISlider!
    
    //把四個選項的button都拉到同一個outlet collection
    @IBOutlet var answerButton: [UIButton]!
    
    var questions = [Question]()
    //問題數
    var index = 0
    var score = 0
    //題目顯示的數量
    var count = 1
    //儲存正確答案
    var rightAnswer = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        let question1 = Question(description: "走Ｏ無路", answer: "投", option: ["頭","投","偷","坄"])
        questions.append(question1)
        let question2 = Question(description: "按Ｏ就班", answer: "部", option: ["步","部","布","簿"])
        questions.append(question2)
        let question3 = Question(description: "金榜Ｏ名", answer: "題", option: ["提","偍","題","堤"])
        questions.append(question3)
        let question4 = Question(description: "對牛Ｏ琴", answer: "彈", option: ["談","彈","潭","譚"])
        questions.append(question4)
        let question5 = Question(description: "追根究Ｏ", answer: "柢", option: ["底","抵","牴","柢"])
        questions.append(question5)
        let question6 = Question(description: "Ｏ炙人口", answer: "膾", option: ["快","膾","儈","燴"])
        questions.append(question6)
        let question7 = Question(description: "相得益Ｏ", answer: "彰", option: ["彰","張","璋","章"])
        questions.append(question7)
        let question8 = Question(description: "可見一Ｏ", answer: "斑", option: ["班","搬","般","斑"])
        questions.append(question8)
        let question9 = Question(description: "出類拔Ｏ", answer: "萃", option: ["翠","粹","萃","綷"])
        questions.append(question9)
        let question10 = Question(description: "急Ｏ好義", answer: "公", option: ["工","功","恭","公"])
        questions.append(question10)
        let question11 = Question(description: "重蹈覆Ｏ", answer: "轍", option: ["撤","徹","澈","轍"])
        questions.append(question11)
        let question12 = Question(description: "一Ｏ莫展", answer: "籌", option: ["愁","籌","稠","躊"])
        questions.append(question12)
        
        
        //題目隨機
        questions.shuffle()
        startGame()
        
    }

    func startGame(){

        //四個選項隨機
        questions[index].option.shuffle()
        //四個button填入對應的選項option內容
        for i in 0...3{
            answerButton[i].setTitle(questions[index].option[i], for: .normal)
        }
        
        //righatAnswer存取對的答案
        rightAnswer = questions[index].answer
        //題目顯示區顯示題目
        questionLabel.text = questions[index].description
        questionSlider.value = Float(count)
        
    }

    
    
    //選擇題答案
    @IBAction func clickAnswer(_ sender: UIButton) {
        //當點選button到正確答案時
        if sender.currentTitle == rightAnswer {
            score = score+10
            scoreLabel.text = "分數：\(score)"
            yesornoLabel.text = "恭喜答對，國文造詣真棒！"
        }else{
            yesornoLabel.text = "答錯了，國文造紙要加油！"
        }
        
        
    }
    
    //下一題
    @IBAction func nextQuestion(_ sender: Any) {
        index = index+1
        count = count+1
        questionSlider.value = Float(count)
        yesornoLabel.text = ""
        questionNumberLabel.text = "第\(count)題"
        
        //當題數等於第11題時（只測試10題，因題庫數大於10題）
        if count == 11  {
            index = 0
            count = 1
            questionNumberLabel.text = "第\(count)題"
            score = 0
            scoreLabel.text = "分數：\(score)"
            questions.shuffle()
        }
        startGame()
        
    }
    //重新遊戲
    func reset(){
        
        index = 0
        count = 1
        score = 0
        questionNumberLabel.text = "第\(count)題"
        scoreLabel.text = "分數：\(score)"
        startGame()
        
    }

    //再玩一次會跳出警告視窗（分別為取消跟確定，點選確定會呼叫重新遊戲reset()這個function
    @IBAction func tryAgain(_ sender: Any) {
       
        //建立一個提示框
        let controller = UIAlertController(title: "確認再玩一次？", message: "資料會全部清除喔！", preferredStyle: UIAlertController.Style.alert)
        
        //建立[取消]按鈕
        let noAction = UIAlertAction(title: "取消", style: UIAlertAction.Style.default, handler: nil)
        controller.addAction(noAction)
        
        //建立[確定]按鈕，並呼叫reset function
        let yesAction = UIAlertAction(title: "確定", style: UIAlertAction.Style.default){_ in
            self.reset()
        }
        controller.addAction(yesAction)
        
        //顯示提示框
        present(controller,animated:true,completion:nil)
        
        
    }
    
    
}

