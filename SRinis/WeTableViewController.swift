import UIKit

class WeTableViewController: UIViewController {
    
    @IBOutlet weak var WeTableView: UITableView!
    
    let MenuNames: [String] = ["역할 및 목표", "성과 및 경험", "협엄 및 문화", "미래전망"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WeTableView.delegate = self
        WeTableView.dataSource = self
        // 테이블 뷰의 배경색을 투명하게 설정
        WeTableView.backgroundColor = UIColor.clear
    }
}

extension WeTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = WeTableView.dequeueReusableCell(withIdentifier: "WeFirstCell", for: indexPath)
        // 글꼴 변경
        if let font = UIFont(name: "Cafe24Supermagic-Bold", size: 28) {
            cell.textLabel?.font = font
        }
        cell.textLabel?.textColor = UIColor.white // 글자색 흰색으로 변경
        cell.textLabel?.text = MenuNames[indexPath.row] // 텍스트 설정
        cell.textLabel?.textAlignment = .center // 가운데 정렬
        cell.textLabel?.shadowColor = UIColor.black // 그림자 색상
        cell.textLabel?.shadowOffset = CGSize(width: 2, height: 2) // 그림자 크기
        
        // 셀 배경색상을 투명하게 설정
        cell.backgroundColor = UIColor.clear // 배경색상을 투명하게 설정
        
        // 안쪽 테두리 설정
        cell.contentView.layer.borderWidth = 2 // 테두리 두께 설정
        cell.contentView.layer.borderColor = UIColor.white.cgColor // 테두리 색상 설정
        
        // 셀의 모양을 둥근 네모 형태로 변경
        cell.layer.cornerRadius = 10 // 모서리 반경 설정
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // 셀 높이 설정
        return 200
    }
}
