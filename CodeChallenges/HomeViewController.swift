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
//  HomeViewController.swift
//

import UIKit

class HomeViewController: UIViewController, TagListViewDelegate {

    static let identifier = "HomeViewController"

    class func newVC() -> HomeViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyBoard.instantiateViewController(withIdentifier: HomeViewController.identifier) as! HomeViewController
        
        return vc
    }

    let topFive: [String] = ["GrahamCampbell","fabpot","weierophinney","rkh","josh"]
    
    lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.boldSystemFont(ofSize: 20)
        lb.textAlignment = .left
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .black
        lb.text = "Top 5 GitHub Users"
        return lb
    }()
    
    lazy var descLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.textAlignment = .left
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .lightGray
        lb.text = "Tap the username to see more information"
        return lb
    }()
    
    lazy var tagList: TagListView = {
        let tagList = TagListView()
        tagList.translatesAutoresizingMaskIntoConstraints = false
        tagList.paddingX = 11
        tagList.paddingY = 11
        tagList.marginX = 7
        tagList.marginY = 7
        tagList.textFont = UIFont.systemFont(ofSize: 13)
        tagList.textColor = .white
        tagList.cornerRadius = 4
        tagList.tagBackgroundColor = .blue
        return tagList
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.addSubview(titleLabel)
        titleLabel.anchor(top: self.view.topAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor, paddingTop: 20, paddingLeft: 16,  paddingRight: 16)
        
        self.view.addSubview(descLabel)
        descLabel.anchor(top: titleLabel.bottomAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor, paddingTop: 14, paddingLeft: 16,  paddingRight: 16)
        
        self.view.addSubview(tagList)
        tagList.anchor(top: descLabel.bottomAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor, paddingTop: 14, paddingLeft: 16,  paddingRight: 16)
        
        self.tagList.addTags(self.topFive)
        self.tagList.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tagPressed(_ title: String, tagView: TagView, sender: TagListView) {
        let vc = PersonViewController.newVC(title)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: View Controller Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Home"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.title = ""
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

}
