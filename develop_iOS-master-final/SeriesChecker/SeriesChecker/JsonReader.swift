//
//  JsonReader.swift
//  SeriesChecker
//
//  Created by Gabriel Castrillon on 19/06/17.
//  Copyright © 2017 Patati. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class JsonReader
{
    private func defaultImage() -> UIImage
    {
        return imgFromURL(urlString: "http://static.tvmaze.com/images/api/tvm_api.png")
    }
    
    func imgFromURL(urlString: String) -> UIImage
    {
        let url = URL(string: urlString)!
        var image: UIImage?
        
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
            
            image = UIImage(data: data) ?? self.defaultImage()
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
        return image!
    }
    
    public func seriesJson(json: [String: Any]) -> Serie
    {
        let cod        =  json["id"] as? Int
        let name       =  json["name"] as? String
        let summary    =  json["summary"] as? String
        
        let imgs_array =  json["image"] as? [String: Any]
        let image      =  imgFromURL(urlString: (imgs_array?["original"] as? String)!)
        
        let rtg_array  =  json["rating"] as? [String: Any]
        let average    =  rtg_array?["average"] as? Double
        
        let eps        =  json["_embedded"] as? [String: Any]
        let json_eps   =  eps?["episodes"] as? [Any]
        var episodes: [Episodio] = []
        
        let genres     =  json["genres"] as? [String]
        
        for ep in json_eps!
        {
            episodes.append(episodeJson(json: ep as! [String: Any]))
        }
        
        let tvShow = Serie(id: cod!, episodios: episodes ,nome: name!, sinopse: summary!, nota: Double(round(average!*10)), img: image, generos: genres!)
        
        return tvShow
    }
    
    public func episodeJson(json: [String: Any]) -> Episodio
    {
        let id         =  json["id"] as? Int
        let temporada  =  json["season"] as? Int
        let num_ep     =  json["number"] as? Int
        let name       =  json["name"] as? String
        let data       =  json["airdate"] as? String
        let summary    =  json["summary"] as? String ?? "Sem descricao"
        
        let imgs_array =  json["image"] as? [String: Any] ?? ["original": "https://madeby.google.com/static/images/google_g_logo.svg"]
        let image      =  imgs_array["original"] as? String
        
        let showEpisode = Episodio(id: id!, temporada: temporada!, num_ep: num_ep!, nome: name!, data: data!, sinopse: summary, image: image!)
        
        return showEpisode
    }
}
