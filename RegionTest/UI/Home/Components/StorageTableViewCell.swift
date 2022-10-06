//
//  StorageTableViewCell.swift
//  RegionTest
//
//  Created by Dastan Mambetaliev on 5/10/22.
//

import Foundation
import UIKit

class StorageTableViewCell: UITableViewCell {
    
    private let memoryLabel: UILabel = {
        $0.font = .systemFont(ofSize: 13)
        $0.contentMode = .left
        $0.text = "Device memory"
        return $0
    }(UILabel())
    
    private let counterLabel: UILabel = {
        $0.font = .systemFont(ofSize: 13)
        $0.contentMode = .right
        $0.text = "Free 0"
        return $0
    }(UILabel())
    
    private let progressView: UIProgressView = {
        $0.progressTintColor = UIColor(hexString: "#FF8800")
        $0.progress = 0.0
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
        return $0
    }(UIProgressView())

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        contentView.addSubviews(memoryLabel, counterLabel, progressView)
        
        memoryLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(11)
            $0.leading.equalToSuperview().offset(15)
        }
        counterLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-16)
            $0.centerY.equalTo(memoryLabel.snp.centerY)
        }
        progressView.snp.makeConstraints {
            $0.top.equalTo(memoryLabel.snp.bottom).offset(9)
            $0.leading.equalTo(memoryLabel.snp.leading)
            $0.trailing.equalTo(counterLabel.snp.trailing)
            $0.height.equalTo(16)
            $0.bottom.equalToSuperview().offset(-12)
        }
    }
    
    func fill(with item: HomeTableViewSection.Item) {
        guard case let .progress(free, percentage) = item else { return }
        progressView.progress = Float(percentage)
        counterLabel.text = "Free \(String(format: "%.2f", free))"
    }
}
