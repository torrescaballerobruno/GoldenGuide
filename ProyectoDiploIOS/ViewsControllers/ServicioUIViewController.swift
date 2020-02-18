//
//  ServicioUIViewController.swift
//  ProyectoDiploIOS
//
//  Created by Bruno Torres on 16/02/20.
//  Copyright © 2020 Bruno Torres. All rights reserved.
//

import UIKit

class ServicioUIViewController: UIViewController {

    @IBOutlet weak var serviceImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var comments: UIButton!
    @IBOutlet weak var rating: UILable!
    @IBOutlet weak var description : UITextView!
    
    private service: Service?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    init(service: Service) {
        self.service = service
        self.title.text = service.title
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
/*
 struct Service {
     var id: String
     var description: String
     var price: Double
     var rating: Int
     var pictures: [UIImage]?
     var hirings: Int
     var comments: [Comment]?
 }
 **/
