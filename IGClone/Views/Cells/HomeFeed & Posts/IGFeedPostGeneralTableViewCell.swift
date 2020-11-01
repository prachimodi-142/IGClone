//
//  IGFeedPostGeneralTableViewCell.swift
//  IGClone
//
//  Created by Prachi Modi on 10/15/20.
//  Copyright © 2020 Prachi Modi. All rights reserved.
//

import UIKit

class IGFeedPostGeneralTableViewCell: UITableViewCell {

    static let identifier = "IGFeedPostGeneralTableViewCell"
       
       override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemOrange
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       public func configure() {
           //configure the cell
       }
       
       override func layoutSubviews() {
           super.layoutSubviews()
       }

}
