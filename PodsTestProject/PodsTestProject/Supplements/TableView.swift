//
//  TableView+Extension.swift
//  PodsTestProject
//
//  Created by Анжелика on 10.07.24.
//

import UIKit

extension UITableView {
    func registerWithoutNib<T: UITableViewCell>(_: T.Type) {
        register(T.self, forCellReuseIdentifier: T.identifier)
    }

    func dequeue<T: UITableViewCell>(_: T.Type, for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T
    }
}

extension UITableViewCell {
    static var reuseID: String { .init(describing: self) }
}

extension UITableViewCell: NibLoadable {}

protocol NibLoadable {
    static var nib: UINib { get }
    static var identifier: String { get }
}

extension NibLoadable {
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: Bundle.main)
    }

    static var identifier: String {
        return String(describing: self)
    }
}

extension UINib {
    convenience init<T>(_: T.Type) {
        self.init(nibName: String(describing: T.self), bundle: Bundle.main)
    }
}
