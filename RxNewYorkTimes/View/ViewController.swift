//
//  ViewController.swift
//  RxNewYorkTimes
//
//  Created by omair khan on 15/12/2021.
//

import UIKit
import SDWebImage
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    // TableView
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TopNewsTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let disposeBag = DisposeBag()

    private var viewModel = TopStoriesListViewModel()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Top Stories"
        setUpTableView()
        populateData()
    }
    
    // MARK: TableView setup
    func setUpTableView(){
        /*
         - Add as Subview
         - Add constraints
         - tableView Row Height
         */
        
        self.view.addSubview(tableView)
        
        
        self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: (self.navigationController?.navigationBar.frame.height)!).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        
        tableView.rowHeight = 150
    }
    
    
    
    //MARK: Populate Data
    func populateData(){
        
        // fetch items
        self.viewModel.fetchItems(disposeBag: disposeBag)
        
        // Bind Data
        self.viewModel.topStoriesList.bind(to: self.tableView.rx.items(cellIdentifier: "cell", cellType: TopNewsTableViewCell.self)){ row,item,cell in
            cell.abbstractLabel.text = item.abstract
            cell.titleLabel.text = item.title
            cell.myImageView.sd_setImage(with: URL(string: item.multimedia?[0].url ?? ""), placeholderImage: UIImage(named: "NY"), options: .continueInBackground, completed: nil)
            
        }
        
      
    }
}

