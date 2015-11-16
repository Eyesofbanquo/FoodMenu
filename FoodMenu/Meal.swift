//
//  Meal.swift
//  FoodMenu
//
//  Created by Markim Shaw on 11/12/15.
//  Copyright © 2015 Markim Shaw. All rights reserved.
//

import Foundation

import UIKit

class Meal : NSObject, NSCoding{
    struct PropertyKey {
        static let nameKey = "name"
        static let photoKey = "photo"
        static let ratingKey = "rating"
    }
    
    var name: String
    var rating: Int
    var image: UIImage?
    
    //archiving paths
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("meals")
    
    init?(name: String, image: UIImage?, rating: Int){
        self.name = name
        self.image = image
        self.rating = rating
        
        super.init()
        
        if name.isEmpty || rating < 0  {
            return nil
        }
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        let photo = aDecoder.decodeObjectForKey(PropertyKey.photoKey) as? UIImage
        let rating = aDecoder.decodeIntegerForKey(PropertyKey.ratingKey) as Int
        
        self.init(name: name, image: photo, rating: rating)
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(image, forKey: PropertyKey.photoKey)
        aCoder.encodeInteger(rating, forKey: PropertyKey.ratingKey)
        
    }
    
    
}
