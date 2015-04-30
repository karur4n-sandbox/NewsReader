//
//  ViewController.swift
//  NewsReader
//
//  Created by karur4n on 2015/04/30.
//  Copyright (c) 2015年 karur4n. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var newsDataArray = NSArray()

    @IBOutlet var table :UITableView!
    
    var newsUrl = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        
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
            // ニュース記事データをテーブルビューに表示
            self.table.reloadData()
            
        }
    }
    
    // テーブルビューのセルの数を newsDataArray に格納しているデータの数で設定
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsDataArray.count
    }
    
    // セルに表示する内容を設定
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // StoryBoard で取得した Cell を取得
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        // ニュース記事データを取得
        var newsDic = newsDataArray[indexPath.row] as! NSDictionary
        
        // タイトルとタイトルの行数、公開日時を Cell にセット
        cell.textLabel?.text = newsDic["title"] as? String
        cell.textLabel?.numberOfLines = 3
        cell.detailTextLabel?.text = newsDic["publishedDate"] as? String
        return cell
    }
    
    // テーブルビューのセルがタップされた処理
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // セルのインデックスパス番号を出力
        println("タップされたセルのインデックスパス:\(indexPath.row)")
        // ニュース記事データを取得
        var newsDic = newsDataArray[indexPath.row] as! NSDictionary

        newsUrl = newsDic["unescapedUrl"] as! String
        
        performSegueWithIdentifier("toWebView", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var wvc = segue.destinationViewController as! WebViewController
        wvc.newsUrl = newsUrl
    }
}

