//
//  PreviewTransitionController.swift
//  PreviewTransitionTest
//
//  Created by Alvin Tan De Jun on 28/7/18.
//  Copyright © 2018 Alvin Tan. All rights reserved.
//

import PreviewTransition

class PreviewTransitionController: PTTableViewController {
    
    fileprivate let items = [("1", "River cruise"), ("2", "North Island"), ("3", "Mountain trail"), ("4", "Southern Coast"), ("5", "Fishing place")] // image names
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tableView.contentInset = UIEdgeInsetsMake(44,0,0,0)
        navigationController?.navigationBar.isTranslucent = false
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    public override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? ParallaxCell else { return }
        
        let index = indexPath.row % items.count
        let imageName = items[index].0
        let title = items[index].1
        
        if let image = UIImage(named: imageName) {
            cell.setImage(image, title: title)
        }
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    }
    
}
