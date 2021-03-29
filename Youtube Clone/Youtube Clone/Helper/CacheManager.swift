//
//  CacheManager.swift
//  Youtube Clone
//
//  Created by Bulldozer on 25/03/21.
//

import Foundation

class CacheManager {
    
    static var cache = [String:Data]()
    
    static func setVideoCache(_ url:String, _ data:Data?) {
        
        //Simpan data gambar dan gunakan url sebagai kuncinya
        cache[url] = data
        
    }
    
    static func getVideoCache(_ url:String) -> Data? {
        
        //Mencoba untuk mendapatkan data untuk url yang ditentukan
        return cache[url]
    }
    
    
}
