//
//  WebViewController.swift
//  NewsReader
//
//  Created by karur4n on 2015/04/30.
//  Copyright (c) 2015年 karur4n. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet var webview :UIWebView! = UIWebView()
    // URL を格納する String 変数を作成
    var newsUrl = "http://qiita.com/"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //String変数newsUrlをNSURLに変換
        var url = NSURL(string :newsUrl)!
        //NSURLRequestにURL情報を渡す
        var urlRequest = NSURLRequest(URL: url)
        //URL情報を引数にUIWebViewクラスのロードメソッド実行
        webview.loadRequest(urlRequest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
