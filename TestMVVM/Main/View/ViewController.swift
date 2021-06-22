//
//  ViewController.swift
//  TestMVVM
//
//  Created by German Rincon Urrego on 20/06/21.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - IBOutlet
    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    var viewModel: ListViewModel = ListViewModel()
    
    //MARK: - View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SetupView()
        bindView()
    }
    
    private func SetupView(){
        activity.isHidden = false
        activity.startAnimating()
        viewModel.LoadData()
    }
    
    private func bindView() {
        viewModel.listViewCell.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.activity.stopAnimating()
                self?.activity.isHidden = true
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.listViewCell.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "viewCell")!
        
        let data = viewModel.listViewCell.value?[indexPath.row]
        
        cell.textLabel?.text = data?.data.title
        cell.detailTextLabel?.text = data?.data.body
        
        return cell
    }
    
    
}
