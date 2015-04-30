//
//  ViewController.swift
//  NewsReader
//
//  Created by karur4n on 2015/04/30.
//  Copyright (c) 2015年 karur4n. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ニュース情報の取得先
        let requestUrl = "https://ajax.googleapis.com/ajax/services/search/news?v=1.0&topic=p&hl=ja&rsz=8"
        
        // web サーバーに対して HTTP 通信のリクエストを出してデータを取得
        Alamofire.request(.GET, requestUrl).responseJSON {
            (request, response, json, error) in
            println(json)
        }
        
        // ニュース記事データをテーブルビューに表示
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

