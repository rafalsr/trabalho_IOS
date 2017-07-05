//
//  ControllerMain.swift
//  SeriesChecker
//
//  Created by LAB CCET on 05/06/17.
//  Copyright © 2017 Patati. All rights reserved.
//

import Foundation

import UIKit

class MoviesTableViewController: UITableViewController
{
    var series : [Serie]?
    private var selectedIndexRow: Int = -1
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let nib = UINib(nibName: "NewTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "tvShowCell")
    }

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (series?.count)!
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tvShowCell", for: indexPath) as! NewTableViewCell
        
        cell.imgView.image    =  series?[indexPath.row].img
        cell.titleView.text   =  series?[indexPath.row].nome
        cell.sinopseView.text =  series?[indexPath.row].sinopse
        cell.genreView.text   =  getArrayContent(array: (series?[indexPath.row].generos)!)
        cell.gradeView.text   =  replaceParantese(entrada: "\(series?[indexPath.row].nota)")
        
        return cell
    }
    
    // Triggered when a tv show row is selected
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print(indexPath.row)
        selectedIndexRow = indexPath.row
        self.performSegue(withIdentifier: "detalheSerie", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "detalheSerie"  // Case more than one segue, then we would need.
        {
            if let viewController = segue.destination as? EpisodioViewController
            {
                viewController.serie = series?[selectedIndexRow]
            }
        }
    }
    
    // Used to concatenate array's content into one single string.
    private func getArrayContent(array: [String]) -> String
    {
        var fraseconcatenada: String = ""
        var index = 0
        
        for word in array
        {
            if index != array.count - 1
            {
                fraseconcatenada += word + ", "
            }
            else
            {
                fraseconcatenada += word
            }
            index += 1
        }
        return fraseconcatenada
    }
    
    private func replaceParantese(entrada: String)-> String
    {
        return distinct(begin: "(", end: ")", entrada: entrada)
    }
    
    private func distinct(begin: String, end: String, entrada: String)-> String
    {
        let begin = entrada.range(of: begin)?.upperBound
        let end = entrada.range(of: end, options: .backwards)?.lowerBound
        return entrada[begin!..<end!]
    }
}
