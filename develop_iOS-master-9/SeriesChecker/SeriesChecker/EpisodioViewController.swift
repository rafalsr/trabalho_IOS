//
//  EpisodioViewController.swift
//  SeriesChecker
//
//  Created by LAB CCET on 05/06/17.
//  Copyright © 2017 Patati. All rights reserved.
//

import UIKit

class EpisodioViewController: UITableViewController
{
    let auxForImg = JsonReader()
    var serie: Serie?
    private var selectedIndexRow: Int = -1

    override func viewDidLoad()
    {
        super.viewDidLoad()

        print(serie!.nome)
        
        let nibEpisodes = UINib(nibName: "EpisodeTableViewCell", bundle: nil)
            tableView.register(nibEpisodes, forCellReuseIdentifier: "episodeCell")
    }

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (serie?.episodios.count)!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let epCell    = tableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath) as! EpisodeTableViewCell
        
        epCell.epTitleLabel.text  = serie?.episodios[indexPath.row].nome
        epCell.seasonLabel.text   = "\(serie?.episodios[indexPath.row].temporada ?? 0)"
        epCell.epNumberLabel.text = "\(serie?.episodios[indexPath.row].num_ep ?? 0)"
        
        return epCell
    }
    
    // Triggered when a episode row is selected
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print(indexPath.row)
        
        selectedIndexRow = indexPath.row
        self.performSegue(withIdentifier: "episodeDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "episodeDetail"
        {
            if let viewController = segue.destination as? EpisodeDetailTableViewController
            {
                viewController.episode = serie?.episodios[selectedIndexRow]
            }
        }
    }
}
