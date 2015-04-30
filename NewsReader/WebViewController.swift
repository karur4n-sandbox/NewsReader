//
//  WebViewController.swift
//  NewsReader
//
//  Created by karur4n on 2015/04/30.
//  Copyright (c) 2015年 karur4n. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet var webview :UIWebView! = UIWebView()
    // URL を格納する String 変数を作成
    var newsUrl = "http://qiita.com/"
    var indicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webview.delegate = self
        indicator.center = self.view.center
        indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        webview.addSubview(indicator)

        //String変数newsUrlをNSURLに変換
        var url = NSURL(string :newsUrl)!
        //NSURLRequestにURL情報を渡す
        var urlRequest = NSURLRequest(URL: url)
        //URL情報を引数にUIWebViewクラスのロードメソッド実行
        webview.loadRequest(urlRequest)
    }
    
    // Web ページの読み込み開始を通知
    func webViewDidStartLoad(webView: UIWebView) {
        // インディケータの表示アニメを開始
        indicator.startAnimating()
    }
    
    // Web ページの読み込み終了を通知
    func webViewDidFinishLoad(webView: UIWebView) {
        // インディケータを停止
        indicator.stopAnimating()
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
