//
//  FavoritesVC.swift
//  TheMovieApp
//
//  Created by Farid Rustamov on 24.02.25.
//

import UIKit

class FavoritesVC: UIViewController {
    
    //MARK: UI Elements
    
    private lazy var table: UITableView = {
        let t = UITableView()
        t.dataSource = self
        t.delegate = self
        t.backgroundColor = .systemBackground
        t.translatesAutoresizingMaskIntoConstraints = false
        t.register(HorizontalCell.self, forCellReuseIdentifier: "\(HorizontalCell.self)")
        return t
    }()
    
    let viewModel = FavoritesVM()
    let refreshControl = UIRefreshControl()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureConstraints()
        configureModel()
    }
    
    private func configureUI() {
        title = "Favorites"
        view.backgroundColor = .systemBackground
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        table.refreshControl = refreshControl
    }
    
    private func configureConstraints() {
        view.addSubview(table)
        
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    private func configureModel() {
        viewModel.success = { [weak self] in
            self?.table.reloadData()
            self?.refreshControl.endRefreshing()
        }
        
        viewModel.errorHandler = { [weak self] error in
            print(error)
            self?.refreshControl.endRefreshing()
        }
        
        viewModel.getData()
    }
    
    @objc private func refreshData() {
        viewModel.reset()
        table.reloadData()
        viewModel.getData()
    }
}

extension FavoritesVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(HorizontalCell.self)", for: indexPath) as! HorizontalCell
        cell.configure(data: viewModel.movies[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.deleteData(id: viewModel.movies[indexPath.row].id ?? 0)
            viewModel.movies.remove(at: indexPath.row)
            table.reloadData()
        }
    }
}
