//
//  MusicViewController.swift
//  DemoApi
//
//  Created by JENIL BHADJA on 19/02/23.
//

import UIKit

class MusicViewController: UIViewController {

    @IBOutlet weak var tblMusic  : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblMusic.delegate = self
        self.tblMusic.dataSource = self
    }
}

extension MusicViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicTableViewCell", for: indexPath)as!
        MusicTableViewCell
        return cell
    }
}


