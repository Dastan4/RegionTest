//
//  CountryTableViewCell.swift
//  RegionTest
//
//  Created by Dastan Mambetaliev on 30/9/22.
//

import Foundation
import UIKit

class CountryTableViewCell: UITableViewCell {
    
    private let mapImageView: UIImageView = {
        $0.image = UIImage(named: "map")
        return $0
    }(UIImageView())
    
    private let label: UILabel = {
        $0.font = .systemFont(ofSize: 17)
        $0.contentMode = .left
        return $0
    }(UILabel())
    
    private let statusImageView: UIImageView = {
        $0.image = UIImage(named: "download")
        $0.isUserInteractionEnabled = true
        return $0
    }(UIImageView())
    
    private lazy var tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        contentView.addSubviews(mapImageView, label, statusImageView)
        
        mapImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.size.equalTo(30)
            $0.centerY.equalToSuperview()
        }
        label.snp.makeConstraints {
            $0.leading.equalTo(mapImageView.snp.trailing).offset(16)
            $0.trailing.equalTo(statusImageView.snp.leading).offset(-10)
            $0.centerY.equalTo(mapImageView.snp.centerY)
        }
        statusImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-22)
            $0.centerY.equalTo(label.snp.centerY)
        }
    }
    
    func fill(with item: HomeTableViewSection.Item) {
        guard case let .country(text, tap) = item else { return }
        selfTapped = tap
        label.text = text
        if statusImageView.image == UIImage(named: "download") {
            statusImageView.addGestureRecognizer(tapGesture) // remove it if want didSelectRow
        } else {
            statusImageView.removeGestureRecognizer(tapGesture)
        }
    }
    
    private var selfTapped: (() -> ())?
    
    @objc private func tapped() {
        selfTapped?()
    }
}
