//
//  TownViewController.swift
//  Upstate
//
//  Created by Jose Alarcon Chacon on 1/18/22.
//

import UIKit
import Firebase
import FirebaseFirestore


class TownViewController: UIViewController {
    

    @IBOutlet weak var tableView: UITableView!
    
    var dataB: Firestore!
    private var towns = [Towns]()
    private var townsReference: CollectionReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        title = Constants.navTitle.setNavTitle
        navigationItem.enableMultilineTitle()
        tableView.tableFooterView = UIView()
        townsReference = Firestore.firestore().collection("Towns")
        setUserImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchTowns()
    }
    
    
    func fetchTowns() {
        townsReference.getDocuments { snapshot, error in
            if let error = error {
                print("Error Fetching: \(error.localizedDescription)")
            } else {
                guard let snap = snapshot else {return }
                for document in snap.documents {
                    let data = document.data()
                    let city = data["city"] as? String ?? ""
                    let image = data["image"] as? String ?? ""
                    let name = data["name"] as? String ?? ""
                    let state = data["state"] as? String ?? ""
                    let type = data["type"] as? String ?? ""
                    
                    let addTown = Towns(city: city, image: image, name: name, state: state, type: type)
                    self.towns.append(addTown)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func setUserImage() {
        let btn = UIButton(type: .system)
        btn.frame = CGRect(x: 1, y: 1, width: 40, height: 40)
        btn.layer.cornerRadius = 15
        btn.clipsToBounds = true
        btn.imageView?.contentMode = .scaleAspectFit
        btn.addTarget(self, action: #selector(userProfile), for: .touchUpInside)
        
        let defaultImage = try? Data(contentsOf: URL(string : "https://www.w3schools.com/howto/img_avatar.png")!)
        if let imageData = defaultImage , let image =  UIImage(data: imageData)?.resizeImage(to: btn.frame.size) {
            btn.setBackgroundImage(image, for: .normal)
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: btn)
    }
    @objc func userProfile() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let profileVC = storyBoard.instantiateViewController(withIdentifier: Constants.StoryBoardContainer.userpRrofile) as! ProfileViewController
        profileVC.modalPresentationStyle = .fullScreen
        self.present(profileVC, animated:true, completion:nil)
    }
}


extension TownViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.00
    }
}

extension TownViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return towns.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.StoryBoardContainer.townTableViewTdentifier, for: indexPath) as? TownCell {
            
            cell.configureCell(towns[indexPath.row])
            cell.townImage.layer.cornerRadius = 25.0
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

extension UIImage {
    func resizeImage(to size: CGSize) -> UIImage {
       return UIGraphicsImageRenderer(size: size).image { _ in
           draw(in: CGRect(origin: .zero, size: size))
       }
    }
}
