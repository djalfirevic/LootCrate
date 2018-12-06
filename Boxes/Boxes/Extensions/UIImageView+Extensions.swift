//
//  UIImageView+Extensions.swift
//  Boxes
//
//  Created by Djuro Alfirevic on 12/5/18.
//  Copyright © 2018 Djuro Alfirevic. All rights reserved.
//

import Foundation
import UIKit

let cache = NSCache<AnyObject, AnyObject>()
extension UIImageView {
    
    func loadImage(from imageUrl: String) {
        if let image = cache.object(forKey: imageUrl as AnyObject) as? UIImage {
            self.image = image
            return
        }
        
        if let url = URL(string: imageUrl), imageUrl.isValidURL {
            DispatchQueue.global(qos: .userInitiated).async {
                let data = try? Data(contentsOf: url)
                
                DispatchQueue.main.async { [weak self] in
                    if let data = data, url.absoluteString == imageUrl {
                        if let image = UIImage(data: data) {
                            self?.image = image
                            cache.setObject(image, forKey: imageUrl as AnyObject)
                        }
                    }
                }
            }
        }
    }
    
}
