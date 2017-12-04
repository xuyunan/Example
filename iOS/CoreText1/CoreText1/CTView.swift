//
//  CTView.swift
//  CoreText1
//
//  Created by Yunan Xu on 03/12/2017.
//  Copyright © 2017 xuyunan0113@gmail.com. All rights reserved.
//

import UIKit
import CoreText

class CTView: UIView {
    
    var str = ""
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {return}

        // 纠正矩阵坐标
        context.textMatrix = .identity
        context.translateBy(x: 0, y: rect.size.height)
        context.scaleBy(x: 1, y: -1)
        
        let text = NSMutableAttributedString(string: str)
        // 富文本属性
        text.addAttributes([NSAttributedStringKey.font : UIFont.systemFont(ofSize: 16)], range:NSMakeRange(0, text.length))
        text.addAttributes([NSAttributedStringKey.foregroundColor : UIColor.red, NSAttributedStringKey.font : UIFont.systemFont(ofSize: 24)], range:NSMakeRange(0, 7))
        
        // 设置样式
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 5
        style.paragraphSpacing = 18
        style.firstLineHeadIndent = 20
        style.alignment = .justified
        text.addAttributes([NSAttributedStringKey.paragraphStyle : style], range: NSMakeRange(0, text.length))
        
        // 给图留位置
        struct RunStruct {
            let ascent: CGFloat
            let descent: CGFloat
            let width: CGFloat
        }
        
        // 该参数将会传递给callbacks
        let extentBuffer = UnsafeMutablePointer<RunStruct>.allocate(capacity: 1)
        extentBuffer.initialize(to: RunStruct(ascent: 60, descent: 0, width: 60))
        
        // 站位CTRun的回调, 预留多大空间
        var callbacks = CTRunDelegateCallbacks(version: kCTRunDelegateVersion1, dealloc: { (pointer) in
        }, getAscent: { (pointer) -> CGFloat in
            let d = pointer.assumingMemoryBound(to: RunStruct.self)
            return d.pointee.ascent
        }, getDescent: { (pointer) -> CGFloat in
            let d = pointer.assumingMemoryBound(to: RunStruct.self)
            return d.pointee.descent
        }, getWidth: { (pointer) -> CGFloat in
            let d = pointer.assumingMemoryBound(to: RunStruct.self)
            return d.pointee.width
        })
        
        let runDelegate = CTRunDelegateCreate(&callbacks, extentBuffer)
        let runDict = [kCTRunDelegateAttributeName as NSAttributedStringKey: runDelegate as Any]
        let attributedImage = NSAttributedString(string: " ", attributes: runDict)
        
        // 图放在哪个位置
        let imgLocation = 80
        text.insert(attributedImage, at: imgLocation)
        
        let range: CFRange = CFRangeMake(0, text.length)
        let path = CGMutablePath()
        path.addRect(bounds)
        
        let framesetter = CTFramesetterCreateWithAttributedString(text as CFAttributedString)
        let frame = CTFramesetterCreateFrame(framesetter, range, path, nil)
        CTFrameDraw(frame, context)
        
        // 绘制图片
        drawImageWithCTFrame(frame, context: context, at: imgLocation)
    }

    
    /// 定位图片位置大小,通过context绘制
    ///
    /// - Parameters:
    ///   - frame: CTFrame
    ///   - context: context
    ///   - imgLocation: 图片在文字中的位置
    func drawImageWithCTFrame(_ frame: CTFrame, context: CGContext, at imgLocation: Int) {
        let lines: CFArray = CTFrameGetLines(frame)
        var lineOrigins = Array(repeatElement(CGPoint.zero, count: CFArrayGetCount(lines)))
        CTFrameGetLineOrigins(frame, CFRange(location: 0, length: 0), &lineOrigins)
        
        let lineCount = CFArrayGetCount(lines)
        
        for lineIndex in 0..<lineCount {
            let line = unsafeBitCast(CFArrayGetValueAtIndex(lines, lineIndex), to: CTLine.self) // C指针类型转OC类型
            let runs = CTLineGetGlyphRuns(line)
            
            let runCount = CFArrayGetCount(runs)
            for runIndex in 0..<runCount {
                let run = unsafeBitCast(CFArrayGetValueAtIndex(runs, runIndex), to: CTRun.self)
                let runRange = CTRunGetStringRange(run)
                if runRange.location > imgLocation || runRange.location + runRange.length <= imgLocation {
                    continue
                } else {
                    var imgBounds = CGRect.zero
                    var ascent: CGFloat = 0
                    imgBounds.size.width = CGFloat(CTRunGetTypographicBounds(run, CFRangeMake(0, 0), &ascent, nil, nil))
                    imgBounds.size.height = ascent
                    let xOffset = CTLineGetOffsetForStringIndex(line, CTRunGetStringRange(run).location, nil)
                    imgBounds.origin.x = lineOrigins[lineIndex].x + xOffset
                    imgBounds.origin.y = lineOrigins[lineIndex].y
                    
                    let image = UIImage(named: "kenan.jpeg")!
                    context.draw(image.cgImage!, in: imgBounds)
                    context.setStrokeColor(UIColor.orange.cgColor)
                    context.stroke(imgBounds, width: 2)
                    return
                }
            }
        }
    }
}
