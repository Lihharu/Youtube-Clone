//
//  Constants.swift
//  Youtube Clone
//
//  Created by Bulldozer on 17/03/21.
//

import Foundation

struct Constants {
    static var API_KEY = "AIzaSyAVpl2CugmYOTgybzFFeh2zIPnJZbZJ6fo"
    static var PLAYLIST_ID = "UUM6BWkgiGrCHG967i_PyMiw"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    static var VIDEOCEL_ID = "VideoCell"
    static var YT_EMBED_URL = "https://www.youtube.com/embed/"
}

//Untuk Penyimpanan Link
