//
//  ImageTextVC.swift
//  SwiftTestbed
//
//  Created by firefly on 2020/12/28.
//

import Foundation
import UIKit

class ImageTextVC: BaseViewController {
    
    var textVieW = UITextView(frame: CGRect(x: 30, y: 40, width: 340, height: 600))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        creatUI()
        configUI()
        addUI()
        constraintUI()
    }
    
    func creatUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "test", style: .plain, target: self, action: #selector(parse))
    }
    func configUI() {
        view.backgroundColor = UIColor.groupTableViewBackground
        textVieW.backgroundColor = UIColor.white
        
//        textVieW.text = "asdfasdf asd fasdf j;ljas asdfja;ls j;lk asdf asfasdf jasdfasd;jfkas;djkf asd fsdffsadf asdf  as dfj;lasdj as;ldjf;lkjl;j;k;kddd a "
        
        
        //图片表情
//        //1. 生成一个图片的附件, Attachment:附件
//        let attachMent = NSTextAttachment()
//
//        //2. 使用NSTextAttachment将想要插入的图片作为一个字符处理，转换成NSAttributedString
//        attachMent.image = UIImage(named: "shop_bg")
//
//        //3. 因为图片的大小是按照原图的尺寸, 所以要设置图片的bounds, 也就是大小
//        attachMent.bounds = CGRect(x: 0, y: 100, width: 300, height: 200)
//
//        //4. 将图片添加到富文本上
//        let attachString = NSAttributedString(attachment: attachMent)
//
//        //5. 把图片富文本转换成可变的富文本
//        let mutiAttachString = NSMutableAttributedString(attributedString: attachString)
//
//        //6. 调用富文本的对象方法 addAttributes(_ attrs: [String : Any] = [:], range: NSRange)
//        //来修改对应range范围中 attribute属性的 value值
//        //这里是修改富文本所有文本的字体大小为textView里的文本大小
//        mutiAttachString.addAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)], range: NSMakeRange(0, attachString.length))
//
//        textVieW.attributedText = mutiAttachString
        
    }
    func addUI() {
        view.addSubview(textVieW)
    }
    func constraintUI() {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        insetText()
        insetImage()
    }
    
    //插入文字
    func insetText() {
       
        //创建属性字符串
        let attrStr = NSAttributedString(string: "美女", attributes: [NSAttributedString.Key.foregroundColor:UIColor.red])
         
        let font = textVieW.font!
         
        //创建可变属性字符串
        let attrMutableStr = NSMutableAttributedString(attributedString: textVieW.attributedText)
         
        //将图片属性字符串替换到可变属性字符串的某一个位置
        //获取光标所在位置
        let range = textVieW.selectedRange
         
        //替换属性字符串
        attrMutableStr.replaceCharacters(in: range, with: attrStr)
         
        //显示属性字符串
        textVieW.attributedText = attrMutableStr
         
        //将文字大小重置
        textVieW.font = font
         
        //将光标设置回原来的位置
        textVieW.selectedRange = NSRange(location: range.location + 2, length : 0)

    }

         //插入图片
    func insetImage() {
        
        //创建图片属性字符串
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: "shop_bg")
        let font = textVieW.font!
        attachment.bounds = CGRect(x: 0, y: 0, width: 300, height: 200)
        let attrImageStr = NSAttributedString(attachment: attachment)
        
        //创建可变属性字符串
        let attrMutableStr = NSMutableAttributedString(attributedString: textVieW.attributedText)
        
        //将图片属性字符串替换到可变属性字符串的某一个位置
        //获取光标所在位置
        let range = textVieW.selectedRange
        
        //替换属性字符串
        attrMutableStr.replaceCharacters(in: range, with: attrImageStr)
        
        //显示属性字符串
        textVieW.attributedText = attrMutableStr
        
        //将文字大小重置
        textVieW.font = font
        
        //将光标设置回原来的位置
        textVieW.selectedRange = NSRange(location: range.location + 1, length : 0)
    }
    
    
    @objc func parse() {
        print("\(type(of: self)).\(#function)")
        
        textVieW.attributedText.enumerateAttributes(in: NSRange(location: 0, length: textVieW.attributedText.length), options: NSAttributedString.EnumerationOptions(rawValue: 0)) { (info, range, stop) in
            
            if let attachment = info[NSAttributedString.Key.attachment] as? NSTextAttachment{
                print(attachment.image!)
                print(range)
                
                
            }
            print("\n")

        }
        
        print("text:", textVieW.text)
        
    }
}
