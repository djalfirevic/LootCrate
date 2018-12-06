//
//  UIImageView+Extensions.swift
//  Boxes
//
//  Created by Djuro Alfirevic on 12/5/18.
//  Copyright © 2018 Djuro Alfirevic. All rights reserved.
//

import Foundation
import UIKit

var cache = [String: UIImage]()
extension UIImageView {
    
    func loadImage(from imageUrl: String) {
        if let image = cache[imageUrl] {
            self.image = image
            return
        }
        
        if let url = URL(string: imageUrl), imageUrl.isValidURL {
            DispatchQueue.global(qos: .userInitiated).async {
                let data = try? Data(contentsOf: url)
                
                DispatchQueue.main.async {
                    if let data = data, url.absoluteString == imageUrl {
                        if let image = UIImage(data: data) {
                            self.image = image
                            cache[imageUrl] = image
                        }
                    }
                }
            }
        }
    }
    
}
