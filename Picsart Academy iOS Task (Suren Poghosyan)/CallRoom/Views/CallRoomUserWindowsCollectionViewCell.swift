//
//  CallRommCollectionViewCell.swift
//  Picsart Academy iOS Task (Suren Poghosyan)
//
//  Created by Suren Poghosyan on 22.11.23.
//

import UIKit

// Collection View cell 
final class CallRoomUserWindowsCollectionViewCell: UICollectionViewCell {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.systemGray3

        contentView.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String) {
        titleLabel.text = title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 40)  
        titleLabel.textColor = .black

    }
}
