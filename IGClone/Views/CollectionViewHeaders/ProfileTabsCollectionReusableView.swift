//
//  ProfileTabsCollectionReusableView.swift
//  IGClone
//
//  Created by Prachi Modi on 10/19/20.
//  Copyright © 2020 Prachi Modi. All rights reserved.
//

import UIKit

class ProfileTabsCollectionReusableView: UICollectionReusableView {
        static let identifier = "ProfileTabsCollectionReusableView"
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
