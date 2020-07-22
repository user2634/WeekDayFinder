

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var resultLable: UILabel!
    
    @IBAction func findDayButton(_ sender: Any) {
        
        resultLable.text = dayOfWeek(day: dateTextField.text, month: monthTextField.text, year: yearTextField.text)
        
    }
    
    func dayOfWeek(day: String?, month: String?,year: String?) -> String{
        guard let day = day , let month = month, let year = year else { return "data error"}
        let calendar = Calendar.current
        var dateComponent = DateComponents()
        dateComponent.day = Int(day)
        dateComponent.month = Int(month)
        dateComponent.year = Int(year)
        let dateformat = DateFormatter()
        dateformat.dateFormat = "EEEE"
        guard let date = calendar.date(from: dateComponent)else{return "error"}
        let weekday = dateformat.string(from: date)
        return weekday
    }
    // метод который убирает клаву при нажатии на любую часть экрана
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

