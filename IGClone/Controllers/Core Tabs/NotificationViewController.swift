//
//  NotificationViewController.swift
//  IGClone
//
//  Created by Prachi Modi on 9/25/20.
//  Copyright © 2020 Prachi Modi. All rights reserved.
//

import UIKit

enum UserNotificationType {
    case like(post: UserPost)
    case follow(state: FollowState)
    
}

struct UserNotification {
    let type: UserNotificationType
    let text: String
    let user: User
}

final class NotificationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.isHidden = false
        tableView.register(NotificationsLikeEventTableViewCell.self, forCellReuseIdentifier: NotificationsLikeEventTableViewCell.identifier)
        tableView.register(NotificationsFollowEventTableViewCell.self, forCellReuseIdentifier: NotificationsFollowEventTableViewCell.identifier)
        return tableView
    }()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.tintColor = .label
        return spinner
    }()
    
    private lazy var noNotificationsView = NoNotificationsView()
    
    private var models = [UserNotification]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchNotifications()
        navigationItem.title = "Notification"
        view.backgroundColor = .systemBackground
        view.addSubview(spinner)
//        spinner.startAnimating()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        spinner.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        spinner.center = view.center
        
    }
    
    private func fetchNotifications() {
        for x in 0...100 {
            let user = User(username: "Prachi",
            profilePhoto: URL(string: "https://www.google.com/")!,
            bio: "", name: (first: "", last: ""),
            birthdate: Date(),
            gender: .female,
            counts: UserCount(followers: 1, following: 1, posts: 1), joinedDate: Date())
            let post = UserPost(postType: .photo,
                                taggedUsers: [],
                                identifier: "",
                                thumbnailImage: URL(string: "https://www.google.com/")!,
                                postURL: URL(string: "https://www.google.com/")!,
                                caption: nil,
                                likeCount: [],
                                comments: [],
                                createdDate: Date(), owner: user)
            
            let model = UserNotification(type: x % 2 == 0 ? .like(post: post) : .follow(state: .not_following),
                                         text: "Hello!!",
                                         user: user)
            
            models.append(model)
        }
    }
    
    private func addNoNotificationsView() {
        tableView.isHidden = true
        noNotificationsView.frame = CGRect(x: 0, y: 0, width: view.width/2, height: view.width/4)
        noNotificationsView.center = view.center
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        switch model.type {
        case .like(_):
            let cell = tableView.dequeueReusableCell(withIdentifier: NotificationsLikeEventTableViewCell.identifier, for: indexPath) as! NotificationsLikeEventTableViewCell
            cell.configure(with: model)
            cell.delegate = self
            return cell
        case .follow:
            let cell = tableView.dequeueReusableCell(withIdentifier: NotificationsFollowEventTableViewCell.identifier, for: indexPath) as! NotificationsFollowEventTableViewCell
//            cell.configure(with: model)
            cell.delegate = self
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52
    }
     }
    
    extension NotificationViewController: NotificationsLikeEventTableViewCellDelegate {
        func didTapRelatedPostButton(model: UserNotification) {
            switch model.type{
            case .like(let post):
                let vc = PostViewController(model: post)
                vc.title = post.postType.rawValue
                vc.navigationItem.largeTitleDisplayMode = .never
                navigationController?.pushViewController(vc, animated: true)
                      
            case .follow(_):
                fatalError("Dev Issue: Should naver get called")
            }
    }
    
}
 extension NotificationViewController: NotificationsFollowEventTableViewCellDelegate {
    func didTapFollowUnFollowButton(model: UserNotification) {
        print("Tapped Button")
    }
            
       
    }
    


