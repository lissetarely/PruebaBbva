//
//  ServiceProtocol.swift
//  PruebaBbva
//
//  Created by Liset Areli Sanchez Martinez on 23/06/23.
//

import UIKit

protocol serviceProtocol : AnyObject {
    static func fetchUsers(results: Int, completion : @escaping(String?,[User]) -> ())
}
