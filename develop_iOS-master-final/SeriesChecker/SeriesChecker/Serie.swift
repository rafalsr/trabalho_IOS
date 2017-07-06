//
//  Serie.swift
//  SeriesChecker
//
//  Created by LAB CCET on 05/06/17.
//  Copyright © 2017 Patati. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Serie
{
    var id: Int
    var episodios: [Episodio]
    var nome: String
    var sinopse: String
    var nota: Double
    var img: UIImage
    var generos: [String]
    
    init(id: Int, episodios: [Episodio], nome: String, sinopse: String, nota: Double, img: UIImage, generos: [String])
    {
        self.id = id
        self.episodios = episodios
        self.nome = nome
        self.sinopse = sinopse
        self.nota = nota
        self.img = img
        self.generos = generos
    }
    
}


