//
//  EpisodeDetailTableViewController.swift
//  SeriesChecker
//
//  Created by Gabriel Castrillon on 03/07/17.
//  Copyright © 2017 Patati. All rights reserved.
//

import UIKit

class EpisodeDetailTableViewController: UITableViewController
{
    private let auxJson = JsonReader() // Here so we can get the image out of the url.
    var episode: Episodio?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibOverview = UINib(nibName: "EpisodeDetailTableViewCell", bundle: nil)
        tableView.register(nibOverview, forCellReuseIdentifier: "epDetailCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "epDetailCell", for: indexPath) as! EpisodeDetailTableViewCell

        cell.imgEpisode.image   =  auxJson.imgFromURL(urlString: (episode?.image)!)
        cell.epNumber.text      =  replaceParantese(entrada: String(describing: episode?.num_ep))
        cell.seasonNumber.text  =  replaceParantese(entrada: String(describing: episode?.temporada))
        cell.releaseDate.text   =  episode?.data
        cell.synopsisLabel.text =  replaceTagParagrafo(entrada: episode!.sinopse)
        cell.titleEpisode.text  =  episode?.nome

        return cell
    }
    
    private func replaceParantese(entrada: String)-> String{
        return distinct(begin: "(", end: ")", entrada: entrada)
    }
    private func replaceTagParagrafo(entrada: String)-> String{
        return distinct(begin: "<p>", end: "</p>", entrada: entrada)
    }
    
    private func distinct(begin: String, end: String, entrada: String)-> String{
        let begin = entrada.range(of: begin)?.upperBound
        let end = entrada.range(of: end, options: .backwards)?.lowerBound
        return entrada[begin!..<end!]
    }
}
