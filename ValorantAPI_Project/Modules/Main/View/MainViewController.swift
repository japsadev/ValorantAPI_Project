//
//  MainViewController.swift
//  ValorantAPI_Project
//
//  Created by Salih Yusuf Göktaş on 2.09.2023.
//

import UIKit

class MainViewController: UIViewController {
	
	@IBOutlet private weak var mainTableView: UITableView!
	
	var viewModel: MainViewModelProtocol? {
		didSet {
			viewModel?.delegate = self
		}
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		setupTableView()
		registerCells()
		viewModel?.fetchAgents()
    }
	
	private func setupTableView() {
		mainTableView.dataSource = self
	}
	
	private func registerCells() {
		let iconCellName = String(describing: IconCell.self)
		let iconCellNib = UINib(nibName: iconCellName, bundle: .main)
		mainTableView.register(iconCellNib, forCellReuseIdentifier: iconCellName)
		
		let descriptionCellName = String(describing: DescriptionCell.self)
		let descriptionCellNib = UINib(nibName: descriptionCellName, bundle: .main)
		mainTableView.register(descriptionCellNib, forCellReuseIdentifier: descriptionCellName)
		
		let categoryCellName = String(describing: CategorySegmentedCell.self)
		let categoryCellNib = UINib(nibName: categoryCellName, bundle: .main)
		mainTableView.register(categoryCellNib, forCellReuseIdentifier: categoryCellName)
		
		let agentItemCellName = String(describing: AgentItemCell.self)
		let agentItemCellNib = UINib(nibName: agentItemCellName, bundle: .main)
		mainTableView.register(agentItemCellNib, forCellReuseIdentifier: agentItemCellName)
	}
}

extension MainViewController: MainViewModelDelegate {
	func handle(notify: MainViewNotify) {
		switch notify {
		case .didFetchAgent:
			break
		case .reloadTableView:
			DispatchQueue.main.async {
				self.mainTableView.reloadData()
			}
		case .errorFetchAgent(error: let error):
			break
		}
	}
}

extension MainViewController: UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		guard let mainTableCellTypeCount = viewModel?.mainTableCellType.count
		else { return 0 } //.icon, .description, .category
		return mainTableCellTypeCount
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		guard let mainTableCellTypeSection = viewModel?.mainTableCellType[section]
		else { return 0 }
	
		switch mainTableCellTypeSection {
		case .icon:
			return 1
		case .description:
			return 1
		case .categorySegmented:
			return 1
		case .agents(model: let agents):
			return agents.count
		}
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let mainTableCellTypeSection = viewModel?.mainTableCellType[indexPath.section]
		else { return UITableViewCell() }
		
		switch mainTableCellTypeSection {
		case .icon:
			if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: IconCell.self)) as? IconCell {
				return cell
			}
		case .description:
			if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DescriptionCell.self)) as? DescriptionCell {
				return cell
			}
		case .categorySegmented:
			if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CategorySegmentedCell.self)) as? CategorySegmentedCell {
				return cell
			}
		case let .agents(model: agents):
			if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AgentItemCell.self)) as? AgentItemCell {
				cell.prepareCell(with: agents[indexPath.row])
				return cell
			}
			return UITableViewCell()
		}
		return UITableViewCell()
	}
}
