//
//  PreviewViewModelProtocol.swift
//  PodsTestProject
//
//  Created by Анжелика on 10.07.24.
//

import UIKit

protocol PreviewViewModelProtocol {
    var didListUpdated: (() -> ())? { get set }
    var podsModel: [PodsPreviewModel] { get }
    func showAlert(_ title: String, _ message: String)
    func fetchData()
}
