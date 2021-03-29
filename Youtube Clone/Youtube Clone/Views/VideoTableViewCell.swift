//
//  VideoTableViewCell.swift
//  Youtube Clone
//
//  Created by Bulldozer on 25/03/21.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var video:Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //Inisialisasi
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        //Konfigurasi tampilan untuk negara bagian yang dipilih
    }
    
    func setCell(_ v:Video){
        
        self.video = v
        
        //Pastikan kami memiliki a video
        guard self.video != nil else {
            return
        }
        
        //Atur Judulnya
        self.titleLabel.text = video?.title
        
        //Atur Tanggalnya
        let df = DateFormatter()
        df.dateFormat = "EEEE, MM D, YYYY"
        self.dateLabel.text = df.string(from: video!.published)
        
        //Atur Thumbnail
        guard self.video!.thumbnail != "" else {
            return
        }
        
        //Periksa cache sebelum mengunduh data
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail) {
            
            //Mengatur tampilan gambar thumbnail
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        
        //Unduh data thumbnail
        let url = URL(string: self.video!.thumbnail)
        
        //Dapatkan objek sesi URL
        let session = URLSession.shared
        
        //Membuat Data Task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                
                //Menyimpan Data di cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                //Periksa apakah url unduhan cocok dengan url gambar mini video yang saat ini disetel untuk ditampilkan oleh sel ini
                if url!.absoluteString != self.video?.thumbnail {
                    
                    //Video call telah didaur ulang untuk video lain dan tidak lagi cocok dengan thumbnail yang diunduh
                    return
                }
                
                //Membuat objek gambar
                let image = UIImage(data: data!)
                
                //Atur tampilan gambar
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
                
            }
            
        }
        //Memulai Data Task
        dataTask.resume()
    }
    
}
