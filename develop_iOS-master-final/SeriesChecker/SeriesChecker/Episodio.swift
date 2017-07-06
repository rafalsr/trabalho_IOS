//
//  Episodio.swift
//  SeriesChecker
//
//  Created by LAB CCET on 05/06/17.
//  Copyright © 2017 Patati. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Episodio
{    
    var id: Int
    var temporada: Int
    var num_ep: Int
    var nome: String
    var image: String
    var data: String
    var sinopse: String
    
    
    init(id:Int, temporada: Int, num_ep: Int, nome: String, data: String, sinopse: String, image: String)
    {
        self.id         =  id
        self.temporada  =  temporada
        self.num_ep     =  num_ep
        self.nome       =  nome
        self.data       =  data
        self.sinopse    =  sinopse
        self.image      =  image
    }
}
