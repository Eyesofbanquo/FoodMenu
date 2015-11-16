//
//  RatingControl.swift
//  FoodMenu
//
//  Created by Markim Shaw on 11/11/15.
//  Copyright © 2015 Markim Shaw. All rights reserved.
//

import UIKit

class RatingControl: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    var rating = 0 {
        //with didSet, the contents will be called once this variable is updated
        
        didSet{
            setNeedsLayout()
        }
    }
   // var rating = 0
    var ratingButtons = [UIButton]()
    let emptyStar = UIImage(named: "emptyStar")
    let filledStar = UIImage(named: "filledStar")
    
    
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        
        for _ in 0..<5{
            let button = UIButton()  
            button.setImage(emptyStar, forState: .Normal)
            button.setImage(filledStar, forState: .Selected)
            button.setImage(filledStar, forState: [.Highlighted, .Selected])
            
            button.adjustsImageWhenHighlighted = false
            
            ratingButtons += [button]
            
            button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
            addSubview(button)
        }
    }
    
    //Initialization
    override func layoutSubviews() {
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y:0, width: buttonSize, height: buttonSize)
        
        
        for (index, button) in ratingButtons.enumerate(){
            buttonFrame.origin.x = CGFloat(index * (buttonSize+5))
            button.frame = buttonFrame
        }
        
        updateButtonSelectionStates()
    }
    
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(frame.size.height)
        let spacing: Int = 5
        var stars:Int = 0
        
        for (index, _) in ratingButtons.enumerate(){
            stars += index
        }
        
        let width = (buttonSize + spacing) * stars
        
        return CGSize(width: width, height: buttonSize)
    }
    
    func updateButtonSelectionStates(){
        for (index, button) in ratingButtons.enumerate(){
            button.selected = index < rating
        }
    }
    
    //Mark: Button actoin
    func ratingButtonTapped(button: UIButton){
        rating = ratingButtons.indexOf(button)! + 1
        updateButtonSelectionStates()
    }

}
