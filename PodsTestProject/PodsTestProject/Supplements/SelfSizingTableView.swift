//
//  SelfSizingTableView.swift
//  PodsTestProject
//
//  Created by Анжелика on 10.07.24.
//

import UIKit

class SelfSizingTableView: UITableView {
    override var intrinsicContentSize: CGSize {
        .init(width: contentSize.width, height: min(.infinity, contentSize.height))
    }
    
    override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
            setNeedsLayout()
        }
    }
}
