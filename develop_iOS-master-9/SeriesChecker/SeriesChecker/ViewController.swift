//
//  ViewController.swift
//  SeriesChecker
//
//  Created by LAB CCET on 05/06/17.
//  Copyright © 2017 Patati. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    private var jsonCarregado : Any?
    private let json = JsonReader()
    private var jsonSeries: [Any?] = []
    private var seriesArray: [Serie] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let seriesArray = ["game%20of%20thrones", "friends", "lost", "suits", "breaking%20bad"]
        
        for show in seriesArray
        {
            requestJson(serie: show)
        }
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        self.performSegue(withIdentifier: "botaoSegue", sender: self)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "botaoSegue"
        {
            if let navController = segue.destination as? UINavigationController
            {
                if let viewController = navController.topViewController as? MoviesTableViewController
                {
                    for showJson in jsonSeries
                    {
                        seriesArray.append(json.seriesJson(json: showJson as! [String : Any]))
                    }
                    viewController.series = seriesArray
                }
            }
        }
    }
    
    func requestJson(serie: String)
    {
        let url = URL(string: "https://api.tvmaze.com/singlesearch/shows?q=\(serie)&embed=episodes")!
        let semaphore = DispatchSemaphore(value: 0)
        let task = URLSession.shared.dataTask(with: url)
        {
            data, response, error in
            guard error == nil else
            {
                print(error!)
                return
            }
            guard let data = data else
            {
                print("Data is empty")
                return
            }
            
            self.jsonCarregado = try! JSONSerialization.jsonObject(with: data, options: [])
            self.jsonSeries.append(self.jsonCarregado)
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
    }
    
}

