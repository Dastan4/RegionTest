//
//  HomeViewController.swift
//  RegionTest
//
//  Created by Dastan Mambetaliev on 30/9/22.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private let tableView: UITableView = {
        $0.backgroundColor = .white
        $0.registerTableCell(CountryTableViewCell.self)
        $0.registerTableCell(StorageTableViewCell.self)
        return $0
    }(UITableView(frame: .zero, style: .grouped))
    
    private var viewModel: IHomeViewModel
    private let delegate = HomeViewDelegate()
    private let dataSource = HomeViewDataSource()
    
    init(vm: IHomeViewModel) {
        viewModel = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let input = viewModel.transform(
            with: .init(
                tableData: { [unowned self] in
                    dataSource.fill(with: $0)
                }
            )
        )
        delegate.itemTapped = input.itemTapped
        
        setupViews()
        setupConstraints()
        configureTableView()
        title = "Download Maps"
        view.backgroundColor = UIColor(hexString: "#FF8800")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func configureTableView() {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
    
    private func setupViews() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

