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
    
    var newsDataArray = NSArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ニュース情報の取得先
        let requestUrl = "https://ajax.googleapis.com/ajax/services/search/news?v=1.0&topic=p&hl=ja&rsz=8"
        
        // web サーバーに対して HTTP 通信のリクエストを出してデータを取得
        Alamofire.request(.GET, requestUrl).responseJSON {(request, response, json, error) in
            // まず JSON データを NSDictionary 型に変換
            let jsonDic = json as! NSDictionary
            // 辞書化した jsonDic からキー値 "responseData" を取り出す
            let responseData = jsonDic["responseData"] as! NSDictionary
            // reponseData からキー値"results"を取り出す
            self.newsDataArray = responseData["results"] as! NSArray
            println("\(self.newsDataArray)")
            
        }
        
        // ニュース記事データをテーブルビューに表示
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

