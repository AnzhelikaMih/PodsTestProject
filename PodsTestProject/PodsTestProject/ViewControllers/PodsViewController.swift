//
//  PodsViewController.swift
//  PodsTestProject
//
//  Created by Анжелика on 10.07.24.
//

import UIKit
import SnapKit

final class PodsViewController: UIViewController {

    // MARK: - Constants
    
    private enum Constants {
        static let title: String = "POQS LIST"
        static let titleFont: UIFont = .systemFont(ofSize: 22, weight: .bold)
    }
    
    // MARK: - Properties
    
    private(set) var viewModel: PreviewViewModelProtocol
    
    // MARK: - Components
    
    lazy var podsTableView: UITableView = {
        let tableView = SelfSizingTableView(frame: .zero, style: .insetGrouped)
        tableView.registerWithoutNib(PodsTableViewCell.self)
        tableView.isScrollEnabled = true
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .white
        tableView.separatorStyle = .singleLine
        tableView.clipsToBounds = true
        tableView.contentInsetAdjustmentBehavior = .automatic
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    // MARK: - Init
    
    init(viewModel: PreviewViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        update()
    }

    public func update() {
        viewModel.didListUpdated = {
            self.podsTableView.reloadData()
        }
    }
}
    
// MARK: - Setup view
private extension PodsViewController {
    func setupView() {
        view.backgroundColor = .clear
        configureNavigationBar()
        setupTableView()
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes = [
            .font: Constants.titleFont,
            .foregroundColor: UIColor.yellow
        ]
        title = Constants.title
    }
    
    func setupTableView() {
        view.addSubview(podsTableView)
        podsTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension PodsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.podsModel.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeue(PodsTableViewCell.self, for: indexPath) else {  return UITableViewCell() }
        
        if indexPath.row < viewModel.podsModel.count {
            cell.configure(with: viewModel.podsModel[indexPath.row])
        } else {
            print("Error: indexPath.row is out of bounds")
        }
        return cell
    }
        
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}
