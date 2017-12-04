//
//  ViewController.swift
//  CoreText1
//
//  Created by Yunan Xu on 03/12/2017.
//  Copyright © 2017 xuyunan0113@gmail.com. All rights reserved.
//

// 示例内容:
// 1. CoreText基础
// 2. 读取文件文本内容, 使用CoreText绘制, 控制富文本属性, 设置样式...
// 3. 使用空白字符站位, 预留空间, 绘制图片, 实现图文混排

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ctview: CTView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let file = Bundle.main.path(forResource: "kenan", ofType: "txt") else { return }
        do {
            let text = try String(contentsOfFile: file, encoding: .utf8)
            ctview.str = text
        } catch _ {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

