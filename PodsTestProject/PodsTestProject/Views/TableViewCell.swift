//
//  TableViewCell.swift
//  PodsTestProject
//
//  Created by Анжелика on 10.07.24.
//

import UIKit
import SnapKit

final class PodsTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    
    private enum Constants {
        static let nameFont: UIFont = .systemFont(ofSize: 22, weight: .bold)
        static let descriptionFont: UIFont = .systemFont(ofSize: 16, weight: .regular)
    }
    
    // MARK: - Components
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.nameFont
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.descriptionFont
        label.textColor = .gray
        label.numberOfLines = .max
        return label
    }()
    
    private lazy var iconRepo: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: Self.reuseID)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    
    public func configure(with model: PodsPreviewModel) {
        nameLabel.text = model.titleName
        descriptionLabel.text = model.description
        iconRepo.image = model.icon
    }
    
    // MARK: - Reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        descriptionLabel.text = nil
        iconRepo.image = nil
    }
}

// MARK: - Private Extension
private extension PodsTableViewCell {
    
    // MARK: - Setup
    func setupView() {
        clipsToBounds = true
        contentView.addSubview(nameLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(iconRepo)
        applyConstraints()
    }

    func applyConstraints() {
        iconRepo.snp.makeConstraints { make in
            make.leading.equalTo(contentView).offset(Grid.Spacing.s)
            make.centerY.equalTo(contentView)
            make.size.equalTo(Grid.Size.xl)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(Grid.Spacing.s)
            make.leading.equalTo(iconRepo.snp.trailing).offset(Grid.Spacing.m)
            make.trailing.equalTo(contentView).offset(-Grid.Spacing.m)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(Grid.Spacing.xs)
            make.leading.equalTo(iconRepo.snp.trailing).offset(Grid.Spacing.m)
            make.trailing.equalTo(contentView).offset(-Grid.Spacing.m)
            make.bottom.equalTo(contentView).offset(-Grid.Spacing.s)
        }
    }
}
