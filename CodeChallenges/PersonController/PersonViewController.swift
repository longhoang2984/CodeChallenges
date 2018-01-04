//
// Copyright 2017 (C) Long Hoàng
//
// Created on : 1/4/18
// Author     : Hoàng Cửu Long
//
//-----------------------------------------------------------------------------
// Revision History (Release 1.0.0.0)
//-----------------------------------------------------------------------------
// VERSION     AUTHOR/      DESCRIPTION OF CHANGE
// OLD/NEW     DATE                RFC NO
//-----------------------------------------------------------------------------
// --/1.0  |Hoàng Cửu Long| Initial Create.
//         | 1/4/18       |
//---------|------------------|---------------------------------------------------
//         |Hoàng Cửu Long| Defect ID 1/Description
//         | 1/4/18      |
//---------|------------------|---------------------------------------------------
//
//  PersonViewController.swift
//

import UIKit

class PersonViewController: UIViewController {

    static let identifier = "PersonViewController"

    class func newVC(_ userName: String) -> PersonViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyBoard.instantiateViewController(withIdentifier: PersonViewController.identifier) as! PersonViewController
        vc.userName = userName
        return vc
    }

    @IBOutlet weak var avtImageView: CustomImageView!
    @IBOutlet weak var perNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var borderView: UIView!
    
    
    var userName: String!
    var person: PersonDisplay?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Person"
        // Do any additional setup after loading the view.
        avtImageView.layer.cornerRadius = avtImageView.frame.height / 2
        getPerson()
    }

    fileprivate func getPerson() {
        guard let `userName` = userName else {
            self.showError()
            return
        }
        let jsonUrlString = "https://api.github.com/users/\(userName)"
        guard let url = URL(string: jsonUrlString) else {
            self.showError()
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            guard let data = data else {
                DispatchQueue.main.async {
                    self.showError()
                }
                return
            }
            
            do {
                
                let person = try JSONDecoder().decode(PersonDisplay.self, from: data)
                self.person = person
                DispatchQueue.main.async {
                    self.setUpUI()
                }
                
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
                DispatchQueue.main.async {
                    self.showError()
                }
            }
            
            }.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpUI() {
        guard let person = self.person,
            let name = person.name,
            let avatarUrl = person.avatar_url,
            let location = person.location
            else {
                self.showError()
                return
        }
        
        self.perNameLabel.text = name
        self.locationLabel.text = location
        self.avtImageView.loadImage(urlString: avatarUrl)
        borderView.backgroundColor = .lightGray
    }
    
    func showError() {
        let alertVC = UIAlertController(title: "Error", message: "Something went wrong!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Reload" , style: .cancel) { (_) in
            self.getPerson()
        }
        let backAction = UIAlertAction(title: "Back" , style: .destructive) { (_) in
            self.navigationController?.popViewController(animated: true)
        }
        alertVC.addAction(okAction)
        alertVC.addAction(backAction)
        self.present(alertVC, animated: true, completion: nil)
    }
}
