//FINAL
//  CPCalendar.swift
//  Cebu Pacific
//
//  Created by Randell Joseph Ramirez on 28/11/2019.
//  Copyright © 2019 Randell Joseph Ramirez. All rights reserved.
//
import Foundation
import JTAppleCalendar
import UIKit
import SnapKit


class multiCityData{
    var firstDate = Date()
    var lastDate = Date()
    
}
enum flightType {
    case oneWay
    case twoWay
    case multiCity
}

class CebCalendarHeader: JTAppleCollectionReusableView {
    let monthLabel = UILabel()
    let weeks = [ "Sun","Mon","Tue","Wed","Thu" , "Fri" , "Sat"]
    let smallDot = UILabel()
    let monthDescription = UILabel()
    //Stack View
    let stackView = UIStackView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
        setupStackview()
    }
    
    func setupLabel(){
        self.addSubview(monthDescription)
        self.addSubview(monthLabel)
        self.addSubview(smallDot)
        smallDot.backgroundColor = UIColor(red: 0.362, green: 0.671, blue: 0.296, alpha: 1)
        monthLabel.frame  = CGRect(x: 0, y: self.center.y, width:100, height: 16)
        monthDescription.frame = CGRect(x: 0, y: 0 , width:100, height: 16)
        monthDescription.snp.makeConstraints { (view) in
            view.trailing.equalTo(self).offset(-20)
            view.centerY.equalTo(monthLabel.snp.centerY)
            
        }
        smallDot.frame = monthDescription.frame
        smallDot.snp.makeConstraints { (view) in
            view.height.width.equalTo(4)
            view.centerY.equalTo(monthDescription)
            
            view.trailing.equalTo(monthDescription.snp.leading).offset(-8)
        }
        smallDot.layer.cornerRadius = 4 / 2
        smallDot.clipsToBounds = true
        
        
        //        monthLabel.translatesAutoresizingMaskIntoConstraints = false
        //        monthLabel.constraints.
        //        monthLabel.center = CGPoint(x: self.frame.width / 2 , y:  self.frame.height / 2 )
        monthLabel.snp.makeConstraints { (month) in
            month.leading.equalTo(self).offset(16)
            //            month.top.equalToSuperview().offset(20)
        }
        //        monthLabel.
        monthLabel.font =    UIFont.boldSystemFont(ofSize: 16.0)
        //        monthDescription.font = UIFont(name: "SourceSansPro-Regular", size: 4)
//        monthDescription.font =   monthDescription.font.withSize(11)
      monthDescription.font  = UIFont(name: "SourceSansPro-Regular", size: 10)
               monthLabel.font = UIFont(name: "FSAlbert-Bold", size: 16)
//               monthDescription.font = UIFont(name: "FSAlbert-Bold", size: 16)
//         self.titleLabel?.font = UIFont(name: "FSAlbert-Bold", size: 16)
        //        UIFont.systemFontSize(ofSize: 9)
        monthDescription.text = "CHEAPEST FARE"
        monthDescription.textColor = UIColor(red: 0.362, green: 0.671, blue: 0.296, alpha: 1)
        
        
        
        //        //Day Maker
        //        for data in weeks {
        //
        //            let dayLabel = UILabel()
        //            dayLabel.textAlignment  = .center
        //            dayLabel.font =  dayLabel.font.withSize(9)  // UIFont(name: dayLabel.font.fontName, size: 10)
        //            dayLabel.text = data
        //            dayLabel.font =   UIFont.boldSystemFont(ofSize: 9)
        //            stackView.addArrangedSubview(dayLabel)
        //        }
        
    }
    
    
    func setupStackview(){
        stackView.axis  = NSLayoutConstraint.Axis.horizontal
        stackView.distribution  = UIStackView.Distribution.fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 2
        
        //Stack view
        //        self.addSubview(stackView)
        //        stackView.snp.makeConstraints { (view) in
        //            view.top.equalTo(self.monthLabel.snp.bottom).offset(20)
        //            view.width.equalTo(self)
        //            view.height.equalTo(20)
        //        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CebCalendarCell: JTAppleCell{
    let dateLabel = UILabel()
    let flightCode = UILabel()
    let selectedView = UIView()
    let price = Int.random(in: 1500 ... 6000)
    var soldOut = Bool()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
        print("ramdom price" , price)
//        setupSoldOut()
        
//        print("OOOHHH" ,dateLabel.text)
        if price > 1500 {
            
        }
        
//                backgroundColor = .red
        
            contentView.sizeThatFits(CGSize(width: 30, height: 30))
       
    }
    func configureCell(value:String){
        flightCode.text = value
    }
    func setupSoldOut(){
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "SOULD OUT")
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        
        if dateLabel.text == "1" {
            flightCode.attributedText = attributeString
         
            flightCode.text = """
                        Sold
                        Out
            """
        }
        
    }
    func checkPrice(){
        if price <= 2000 {
            flightCode.textColor =    UIColor(hexString: "#5CAB4C")
        }else {
            flightCode.textColor =    UIColor(hexString: "#6B6B6B") //UIColor(red: 0.362, green: 0.671, blue: 0.296, alpha: 1)
        }
        
    }
    
    func disabledDate(){
        dateLabel.textColor = .gray
        dateLabel.alpha = 0.2
        flightCode.isHidden = true
        
    }
    func middleTappedEffect(){
        dateLabel.textColor = .black
        selectedView.backgroundColor = UIColor(red: 0.952, green: 0.986, blue: 0.993, alpha: 1)
        //        flightCode.textColor = UIColor(hexString: "#6B9ED0")
        checkPrice()
    }
    
    func defaultTextView(){
        dateLabel.textColor = .black
        checkPrice()
        
        //          flightCode.textColor =  UIColor(red: 0.42, green: 0.42, blue: 0.42, alpha: 1)
        selectedView.backgroundColor = UIColor(red: 1, green: 0.804, blue: 0, alpha: 1)
    }
    func setupLabel(){
        dateLabel.frame  = CGRect(x: 0, y: 0, width: 25, height: 30)
        dateLabel.font = UIFont(name: "FSAlbert-Regular", size: 16)
        selectedView.clipsToBounds = true
        self.addSubview(selectedView)
        selectedView.backgroundColor = UIColor(red: 1, green: 0.804, blue: 0, alpha: 1)
        self.addSubview(dateLabel)
        self.addSubview(flightCode)
        dateLabel.snp.makeConstraints { (view) in
            view.centerX.equalTo(self)
            view.top.equalTo(self)
            
        }
        flightCode.numberOfLines = 2
        flightCode.snp.makeConstraints { (view) in
            view.top.equalTo(dateLabel.snp.bottom)
            view.centerX.equalTo(dateLabel)
        }
        selectedView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        selectedView.snp.makeConstraints { (view) in
            view.width.height.equalTo(50)
            view.center.equalTo(self)
        }
        checkPrice()
        flightCode.font = UIFont(name: "SourceSansPro-Regular", size: 10)
        flightCode.contentMode = .center
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


protocol CEBCalendarDelegate :Any {
    func doneSelected(type:flightType,date:[Date])
}


class CPFixBottomView : UIView{
    let stackViewHolder = UIStackView()
    let mainView = UIView()
    let priceDescription = UILabel()
    let totalPrice = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        setupStackView()
        
        setupPrice()
        setupButton()
    }
    convenience init(flightType:flightType) {
        self.init()
        commonInit()
        setupStackView()
    }
    
    func commonInit(){
        mainView.backgroundColor = .white
        mainView.CebAddShadow()
        mainView.CebTopRadiusOnly()
        mainView.frame  = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        self.addSubview(mainView)
        mainView.snp.makeConstraints { (view) in
            view.width.equalTo(self)
            view.height.equalTo(self)
            view.bottom.equalTo(self)
            view.centerY.equalTo(self)
        }
    }
    func setupStackView(){
        //Botom
        stackViewHolder.axis  = NSLayoutConstraint.Axis.horizontal
        stackViewHolder.distribution  = UIStackView.Distribution.fillEqually
        stackViewHolder.translatesAutoresizingMaskIntoConstraints = false
        stackViewHolder.spacing = 0
        stackViewHolder.backgroundColor = .clear
        self.addSubview(stackViewHolder)
        
        
        stackViewHolder.snp.makeConstraints { (view) in
            view.width.height.equalTo(self)
            
        }
        
        
    }
    func setupPrice(){
        
        for data in 0...1 {
            let views = UIView()
            views.tag = data
            views.frame = self.frame
            views.backgroundColor = .clear
            stackViewHolder.addArrangedSubview(views)
        }
        
        
        totalPrice.text = "₱16,100.00"
//        totalPrice.font = totalPrice.font.withSize(24)
        totalPrice.font = UIFont(name: "FSAlbert-Bold", size: 16)
        totalPrice.textColor =  UIColor(red: 0, green: 0.435, blue: 0.757, alpha: 1)
        let leftView = self.stackViewHolder.viewWithTag(0)
        
        
        leftView?.addSubview(totalPrice)
        totalPrice.snp.makeConstraints { (view) in
//            view.top.equalTo(stackViewHolder).offset(4)
            view.centerY.equalTo(stackViewHolder.snp.centerY)
            //                view.top.equalTo(stackViewHolder.snp.centerY)
            view.leading.equalTo(stackViewHolder).offset(16)
        }
        
        
        priceDescription.text = "One-way all-in fare in for 1 adult"
        priceDescription.font = priceDescription.font.withSize(9)
        priceDescription.textColor =   UIColor(red: 0.341, green: 0.341, blue: 0.341, alpha: 1)
        leftView!.addSubview(priceDescription)
        priceDescription.snp.makeConstraints { (view) in
            view.top.equalTo(totalPrice.snp.bottom).offset(4)
            view.leading.equalTo(stackViewHolder).offset(16)
        }
        
        
        
        
    }
    
    
    func setupButton(){
        let css = ButtonModel()
               css.title = "Select dates"
               css.actionName = "dsdsa"
               css.actionParameter = "actionParameter"
               
               let button = CebButton(data: css)
        
        
//        let button = UIButton()
//        button.setTitle("Select dates", for: .normal)
//        button.backgroundColor = ColorUtil.hexColor(hex: "#00A4E5")
        
        //        button.setBackgroundImage(UIColor.black, for: .highlighted)
//        button.layer.cornerRadius = 5
        let rightView = self.stackViewHolder.viewWithTag(1)
        rightView!.addSubview(button)
        button.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(rightView!)
            make.centerY.equalTo(rightView!)
            make.trailing.equalTo(rightView!).offset(-50.9)
        }
        
        button.accessibilityIdentifier = "action_push"
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setGradientBackground(targetView:UIView) {
        let colorTop =   UIColor(red: 0, green: 0.643, blue: 0.898, alpha: 1).cgColor
        let colorBottom =  UIColor(red: 0, green: 0.435, blue: 0.757, alpha: 1).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = targetView.frame
        
        targetView.layer.insertSublayer(gradientLayer, at:0)
    }
}
open class CPCalendar : UIView {
    var tabLayer = UIViewController()
    var datelabelColorSelected = UIColor(red: 0.302, green: 0.443, blue: 0.706, alpha: 1)
    let weeks = ["Su","Mo","Tu","We","Th" , "Fr" , "Sa" ]
    let daysStackView = UIStackView()
    var delegate  : CEBCalendarDelegate!
    let btnDoneSelected = UIButton()
    var firstDate : Date?
    var dateRange = CPDateRangeTopView()
    var maxCity = [1,2,3].count
    var  type  = flightType.twoWay
    //    var date = [Date()]

    let subFooter = CPFixBottomView()
    var twoDatesAlreadySelected : Bool{
        return firstDate != nil && calendarView.selectedDates.count > 1
    }
      let calendarView  = JTAppleCalendarView()
     
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        setupDaysofWeek()
        setupCalendar()
        self.backgroundColor = .clear
        loadDateRangeView()
    }
    
    func loadDateRangeView(){
        self.addSubview(dateRange)
        dateRange.snp.makeConstraints { (view) in
            view.leading.equalTo(daysStackView.snp.leading).offset(15)
            view.top.equalTo(daysStackView).offset(-60)
//             view.top.equalTo(self).offset(
            view.height.equalTo(40)
            view.trailing.equalTo(daysStackView.snp.trailing).offset(-15)
            
        }
    }
    convenience init(flightType:flightType) {
        self.init()
        type = flightType
        setupButton()
    }
    
    @objc func buttonedTapped(sender:UIButton){
        
        print(" i was tapped")
    }
    
    
    func setupDaysofWeek(){
        daysStackView.axis  = NSLayoutConstraint.Axis.horizontal
        daysStackView.distribution  = UIStackView.Distribution.fillEqually
        daysStackView.translatesAutoresizingMaskIntoConstraints = false
        daysStackView.spacing = 2
        daysStackView.alignment = .leading
    
        //Stack view
        self.addSubview(daysStackView)
        
        let blankView = UIView()
        daysStackView.CebAddShadow()
        blankView.frame = CGRect(x: 0, y: 0, width: 0, height: 43)
        blankView.CebAddShadowTop()
        daysStackView.addSubview(blankView)
        blankView.snp.makeConstraints { (view) in
            view.top.equalTo(daysStackView)
            //            view.width.equalTo(self)
//                        view.leading.equalTo(calendarView.snp.leading)
            view.leading.equalToSuperview().offset(-200)
            view.trailing.equalToSuperview().offset(200)
                        view.height.equalTo(45)
        }
        daysStackView.snp.makeConstraints { (view) in
            view.top.equalTo(60)
            view.leading.equalTo(calendarView.snp.leading)
            view.width.equalTo(calendarView)
            view.height.equalTo(20)
        }
        
        for data in weeks {
            let dayLabel = UILabel()
            dayLabel.textAlignment  = .center
            dayLabel.font =   UIFont(name: "SourceSansPro-Regular", size: 12)
            dayLabel.text = data
            if data == "Su" {
                
                dayLabel.textColor =  UIColor(red: 0.634, green: 0.048, blue: 0.155, alpha: 1)
            }else {
                dayLabel.textColor =  UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
            }
            dayLabel.frame = CGRect(x: self.daysStackView.center.x, y: self.daysStackView.center.y, width: self.daysStackView.frame.width, height: self.daysStackView.frame.height)
            daysStackView.addArrangedSubview(dayLabel)
        }
    }
    
    func setSelectedDateView(){
        let toView = UIView()
        let fromView = UIView()
        fromView.backgroundColor = .white
        toView.backgroundColor = .white
        fromView.layer.borderColor = UIColor(red: 0, green: 0.643, blue: 0.898, alpha: 1).cgColor
        fromView.layer.borderWidth = 1
        fromView.layer.cornerRadius = 4
        toView.layer.borderWidth = 1
        toView.layer.cornerRadius = 4
        
        
        
        fromView.frame = CGRect(x: 0, y: 0, width: 164.67, height: 40)
        toView.frame  = fromView.frame
        self.addSubview(fromView)
        self.addSubview(toView)
        let totalWidth = 175.22// calendarView.frame.width / 2
        fromView.snp.makeConstraints { (view) in
            //            view.centerX.equalTo(calendarView.snp.centerX).offset(-20)
            view.leading.equalTo(calendarView.snp.leading).offset(20)
            view.top.equalTo(self)
            view.height.equalTo(40)
            
            view.width.equalTo(totalWidth)
            
        }
        
        toView.layer.borderColor = UIColor.gray.cgColor
        
        toView.snp.makeConstraints { (view) in
            view.leading.equalTo(fromView.snp.trailing)
            view.top.equalTo(self)
            view.height.equalTo(40)
            view.width.equalTo(totalWidth )
        }
        //        topStackView.frame = CGRect(x: 0, y: 0, width: 164.67, height: 20)
        //        self.addSubview(topStackView)
        
        
        
    }
    func setupButton(){
        //          self.addSubview(btnDoneSelected)
        self.btnDoneSelected.setTitle("Done", for: .normal)
        self.btnDoneSelected.backgroundColor = .red
        self.btnDoneSelected.layer.cornerRadius = 5
        self.btnDoneSelected.isUserInteractionEnabled = true
        self.btnDoneSelected.isHidden = true
        
        self.btnDoneSelected.addTarget(self, action: #selector(buttonedTapped(sender:)), for: .touchUpInside)
        //        self.btnDoneSelected
        self.calendarView.addSubview(btnDoneSelected)
        
        self.btnDoneSelected.frame = CGRect(x: 160, y: 160, width: 60, height: 60)
        self.btnDoneSelected.snp.makeConstraints { (view) in
            //            view.top.equalTo(calendarView.snp.bottom).offset(40)
            ////            view.width.equalTo(self.calendarView)
            //            view.leading.equalTo(self.calendarView).offset(60)
            ////            view.trailing.equalTo(self.calendarView).offset(60)
            //            view.height.equalTo(60)
            //            view.bottom.equalToSuperview()
            //            view.trailing.equalToSuperview()
            //            view.height.equalTo(60)
            //            view.top.equalToSuperview()
            //            view.centerX.equalTo(calendarView)
            
        }
        
    }
    
    //    convenience init(_ timezone:TimeZone) {
    //        self.init()
    //    }
    //
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit(){
        self.addSubview(calendarView)
        //        subFooter.backgroundColor = .white
        subFooter.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 71.78)
        self.addSubview(subFooter)
        //Footer
//        if tabLayer.tabBarController.
//        print("tabControllller " , tabLayer.view.safeAreaInsets.bottom)
        subFooter.snp.makeConstraints { (view) in
            view.height.equalTo(71.78)
            
            if #available(iOS 11.0, *) {

                view.bottom.equalTo(self).offset(-74)
            }else {
                view.bottom.equalTo(self).offset(-64)
                
            }
            
//            print("tab -->>",tabLayer.layer.frame.height)
//            if #available(iOS 11.0, *) {
//                view.bottom.equalTo( tabLayer.safeAreaInsets.top)
//            } else {
//                // Fallback on earlier versions
//            }
            view.width.equalTo(self)
            
            //            view.centerY.equalToSuperview()
            
        }
        
        //      let cell = UINib.init(nibName: "CEBCalendarCell", bundle: Bundle.main)
        //        calendarView.register(cell, forCellWithReuseIdentifier: "dateCell")
        
        
        //        guard let cell = calendarXib() else { return }
        //         let cellNib = UINib.init(nibName: "CEBCalendarCell", bundle: Bundle.main)
    }
    
    func setupCalendar(){
        
        //        calendarView.allowsRangedSelection = true
        calendarView.cellSize = 70 //45
        //        calendarView.contentSize = CGSize(width: 30, height: 30)
        calendarView.isRangeSelectionUsed = true
        calendarView.backgroundColor =  UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        //        calendarView.minimumLineSpacing = 0
        
        //        calendarView.calendarDataSource = self as! JTACMonthViewDataSource
        //        calendarView.calendarDelegate = self as! JTACMonthViewDelegate
        //        calendarView.cellSize = 50
        calendarView.snp.makeConstraints { (view) in
//            view.width.equalTo(self)
//            view.width.equalTo(self).offset(32)
            view.leading.equalTo(self).offset(16)
            view.trailing.equalTo(self).offset(-16)

            view.centerY.equalTo(self)
//            view.top.equalTo(daysStackView.snp.bottom)
            view.top.equalTo(daysStackView).offset(80)
            view.bottom.equalTo(self).offset(-100)
        }
        calendarView.backgroundColor = .white
        calendarView.register(CebCalendarCell.self, forCellWithReuseIdentifier: "dateCell")
        //        calendarView.register(viewClass: CebCalendarHeader.self, forDecorationViewOfKind: "DateHeader")
        calendarView.register(CebCalendarHeader.self, forSupplementaryViewOfKind: JTAppleCalendarView.elementKindSectionHeader, withReuseIdentifier: "DateHeader")
        setupButton()
        
        if type == .multiCity {
            calendarView.allowsMultipleSelection = true
            
        }else if type == .oneWay {
            calendarView.allowsMultipleSelection = false
            
        }else if type == .twoWay {
            calendarView.allowsMultipleSelection = true
        }
        setupCalendarDelegate()
    }
    
    
    
    //    func commonInit(){
    ////        let calendarView  = JTACMonthView(frame: .zero)
    ////        calendarView.calendarDelegate = self
    ////        calendarView.scrollDirection = .horizontal
    ////        calendarView.calendarDataSource  = self
    ////        calendarView.translatesAutoresizingMaskIntoConstraints = false
    ////        calendarView.register(CEBCalendarCell.self, forCellWithReuseIdentifier: "dateCell")
    ////        calendarView.frame = CGRect(x: 0, y: 0, width: 300, height: self.frame.height)
    //
    ////        view.frame = self.bounds
    ////        view.addSubview(calendarView)
    ////        let cellNib = UINib.init(nibName: "CEBCalendarCell", bundle: Bundle.main)
    ////         self.register(cellNib, forCellWithReuseIdentifier: "dateCell")
    //
    //        self.addSubview(calendarView)
    //    }
    
    //    func calendarXib()->UIView? {
    //     let bundle = Bundle(for: type(of: self))
    //     let nib = UINib(nibName: "CEBCalendarCell", bundle: bundle)
    //     return nib.instantiate(withOwner: self, options: nil).first as? UIView
    //    }
}


extension CPCalendar : JTAppleCalendarViewDataSource, JTAppleCalendarViewDelegate{
    
    
    func setupCalendarDelegate(){
        self.calendarView.calendarDelegate = self
        self.calendarView.calendarDataSource = self
    }
    func calendar(_ calendar: JTAppleCalendarView, headerViewForDateRange range: (start: Date, end: Date), at indexPath: IndexPath) -> JTAppleCollectionReusableView {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        
        let header = calendar.dequeueReusableJTAppleSupplementaryView(withReuseIdentifier: "DateHeader", for: indexPath) as! CebCalendarHeader
        header.monthLabel.text = dateFormatter.string(from:  range.start)
        print(dateFormatter.string(from:  range.start))
        return header
        
    }
    
    func calendarSizeForMonths(_ calendar: JTAppleCalendarView?) -> MonthSize? {
        return MonthSize(defaultSize: 40)
        
    }
    
    
    //    collectionViewLayout
    
    
    
    func calendar(_ calendar: JTAppleCalendarView, shouldDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) -> Bool {
        
  
        if twoDatesAlreadySelected && cellState.selectionType != .programatic {
            firstDate = nil
            calendarView.deselectAllDates()
            dateRange.textFieldViewTo.text = ""
            dateRange.textFieldViewFrom.text = ""
            return false
        }else {
            guard let cell = cell as? CebCalendarCell else { return false }
            DispatchQueue.main.async {
                cell.dateLabel.textColor = .black
                cell.defaultTextView()
                //                cell.flightCode.textColor =  UIColor.red//UIColor(hexString: "#6B9ED0")
            }
        }
        return true
    }
    
    func calendar(_ calendar: JTAppleCalendarView, shouldSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) -> Bool {
      
//        guard let cell = cell as? CebCalendarCell else { return  false }
//                print("flight code ----> " , cell.flightCode.text)
//                 if cell.flightCode.text == "SOLD \nOUT" {
//                            return false
//                }
        if cellState.date > Date() {
            if cellState.dateBelongsTo == .thisMonth {
                   if type  == .oneWay {
                        let retval = !calendarView.selectedDates.contains(date)
                          calendarView.deselectAllDates()
                        return retval
                    }
                }else {
                    return false
                }
        }else {
            return false
        }
     
        return true
        
    }
    
    
    
    
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        if delegate != nil {
            delegate.doneSelected(type: type, date: calendarView.selectedDates)
        }
       
        print("list of selected dates" , calendarView.selectedDates)
        if type  == .twoWay {
            if firstDate != nil  {
                if  firstDate! > date  {
                    calendarView.selectDates(from: date, to:  calendarView.selectedDates.last!,  triggerSelectionDelegate: false, keepSelectionIfMultiSelectionAllowed: true)
                    configureCell(view: cell, cellState: cellState)
                }else {
                    calendarView.selectDates(from: firstDate!, to: date,  triggerSelectionDelegate: false, keepSelectionIfMultiSelectionAllowed: true)
                    configureCell(view: cell, cellState: cellState)
                }
            } else {
                firstDate = date
                configureCell(view: cell, cellState: cellState)
            }
            
        }else if type == .oneWay {
            configureCell(view: cell, cellState: cellState)
        }
        
//        if calendarView.selectedDates.count > maxCity {
//            print("pwedi pa")
//        }else {
//            configureCell(view: cell, cellState: cellState)
//        }
        
        //        dateRange
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        print("list of cell de sleect" , cellState.isSelected)
        if type == .twoWay {
            if calendarView.selectedDates.count > 1 {
                print("Continue")
            }else {
                print("remove all dates already de select")
            }
        }
        configureCell(view: cell, cellState: cellState)
        
    }
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        guard let cell = cell as? CebCalendarCell else { return }
        configureCell(view: cell, cellState: cellState)
        cell.dateLabel.text = cellState.text
    }
    
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "dateCell", for: indexPath) as! CebCalendarCell
        
        cell.dateLabel.text = cellState.text
        cell.selectedView.isHidden = true
        cell.configureCell(value: "WOWOWOEE")
        self.handleBelongThisMonthTextColor(cell: cell, cellState: cellState)
        if cellState.date > Date() {
             if  cellState.text != "1" {
                        
                        cell.flightCode.text = "P \(cell.price)"
                    }else {
                        cell.soldOut = true
                        cell.flightCode.text = "SOLD OUT"
                        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "SOLD \nOUT")
                       
                        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
            //            cell.flightCode.numberOfLines = 2
                        cell.flightCode.lineBreakMode = .byWordWrapping
                        cell.flightCode.attributedText = attributeString
                        cell.flightCode.textColor = UIColor.gray
                        cell.flightCode.textAlignment = .center
                        cell.checkPrice()
                        
                    }
                    cell.frame.size = CGSize(width: 40, height: 40)
                    if cellState.dateBelongsTo == .thisMonth {
                        if calendarView.selectedDates.contains(date) {
                            print("Month : " , cellState.date)
                        }

                    }
                    
                    if calendarView.selectedDates.isEmpty == false{
                        configureCell(view: cell, cellState: cellState)
                    }
        }else {
            cell.disabledDate()
        }
       
        
        return cell
    }
    
    func handleBelongThisMonthTextColor(cell: CebCalendarCell, cellState: CellState) {
        if cellState.dateBelongsTo == .thisMonth {
            cell.dateLabel.alpha = 1
            cell.dateLabel.isHidden = false
            cell.dateLabel.textColor = UIColor.black
            cell.flightCode.isHidden = false
        } else {
            cell.dateLabel.alpha = 0.3
            cell.dateLabel.isHidden = true
            cell.flightCode.isHidden = true
            cell.dateLabel.textColor = UIColor.gray
            
        }
    }
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        let today = Date()
        let oneYear = Calendar.current.date(byAdding: .day, value: 365, to: today)!
        return ConfigurationParameters(startDate: Date(), endDate: oneYear, firstDayOfWeek: .sunday)
    }
    
    func configureCell(view: JTAppleCell?, cellState: CellState) {
        guard let cell = view as? CebCalendarCell  else { return }
        cell.dateLabel.text = cellState.text
        handleBelongThisMonthTextColor(cell: cell, cellState: cellState)
        handleCellSelected(cell: cell as! CebCalendarCell, cellState: cellState)
        
    }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0.0
    }
    
        func handleCellSelected(cell: CebCalendarCell, cellState: CellState) {
            
//            guard let cell = cell as? CebCalendarCell else { return  }
//                        print("flight code ----> " , cell.flightCode.text)
//                         if cell.flightCode.text == "SOLD \nOUT" {
//                                return
//            }
            if cellState.dateBelongsTo == .thisMonth  {
                if type == .twoWay {
                    switch cellState.selectedPosition() {
                    case .left:
                          cell.selectedView.alpha = 1
                        handleFirstLastText(cell: cell, cellState: cellState)
    //                    print("date corner  left or first" , cellState.date )
                        cell.selectedView.layer.cornerRadius = cell.selectedView.frame.width / 2

                    case .middle:
                        handleMiddleText(cell: cell, cellState: cellState)
                        cell.dateLabel.textColor = .black
                        cell.selectedView.alpha = 0.7
                        cell.selectedView.frame  = CGRect(x: cell.selectedView.frame.origin.x, y: cell.selectedView.frame.origin.y, width: cell.selectedView.frame.width * 2, height: cell.selectedView.frame.height)
                        cell.selectedView.layer.cornerRadius = 0
                    case .right:
                         print("type Right" )
                          cell.selectedView.alpha = 1
                        handleFirstLastText(cell: cell, cellState: cellState)
                        cell.selectedView.layer.cornerRadius = cell.selectedView.frame.width / 2
                    case .full:
                        print("type FULL" )
                          cell.selectedView.alpha = 1
                        handleFirstLastText(cell: cell, cellState: cellState)
                        cell.selectedView.layer.cornerRadius = cell.selectedView.frame.width  / 2
                    default:
                        print("opsp")
                        break
                    }
                }else if type == .oneWay {
                    cell.selectedView.layer.cornerRadius = cell.selectedView.layer.frame.width / 2
                    handleFirstLastText(cell: cell, cellState: cellState)
                }
    //
                
                
    //            cell.selectedView.frame = CGRect(x: 0,y: 0,width: 0,height: 0)
                cell.selectedView.isHidden = !cellState.isSelected
            }
            
        }
//    func handleCellSelected(cell: CebCalendarCell, cellState: CellState) {
//           if cellState.dateBelongsTo == .thisMonth {
//               if type == .twoWay {
//                   switch cellState.selectedPosition() {
//                   case .left:
//                       handleFirstLastText(cell: cell, cellState: cellState)
//                       print("date corner  left or first" , cellState.date )
//                       cell.selectedView.layer.cornerRadius = 15
//                       if #available(iOS 11.0, *) {
//                           cell.selectedView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
//                       } else {
//                           // Fallback on earlier versions
//                       }
//                   case .middle:
//                       handleMiddleText(cell: cell, cellState: cellState)
//                       //                                    print("date middle " , cellState.date )
//
//                       cell.dateLabel.textColor = .black
//                       cell.selectedView.layer.cornerRadius = 0
//                       if #available(iOS 11.0, *) {
//                           cell.selectedView.layer.maskedCorners = []
//                       } else {
//                           // Fallback on earlier versions
//                       }
//                   case .right:
//                       handleFirstLastText(cell: cell, cellState: cellState)
//                       print("date right or last  " , cellState.date )
//                       cell.selectedView.layer.cornerRadius = 15
//                       //                            .layerMinXMinYCorner,
//                       if #available(iOS 11.0, *) {
//                           cell.selectedView.layer.maskedCorners =  [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
//                       } else {
//                           // Fallback on earlier versions
//                       }
//                   // [.layerMaxXMaxYCorner,.layerMinXMinYCorner]
//                   case .full:
//                       handleFirstLastText(cell: cell, cellState: cellState)
//                       print("date full first selected " , cellState.date )
//                       if type == .oneWay {
//                           cell.selectedView.layer.cornerRadius = cell.layer.frame.width  / 2
//                       }else {
//                           cell.selectedView.layer.cornerRadius = 15
//
//                           if #available(iOS 11.0, *) {
//                               cell.selectedView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
//                           } else {
//                               // Fallback on earlier versions
//                           }
//                       }
//                   default:
//                       print("opsp")
//                       break
//                   }
//               }else if type == .oneWay {
//                   cell.selectedView.layer.cornerRadius = 10
//                   handleFirstLastText(cell: cell, cellState: cellState)
//               }
//               cell.selectedView.isHidden = !cellState.isSelected
//           }
//
//       }
    
    func handleMiddleText(cell:CebCalendarCell,cellState:CellState){
        //        cell.dateLabel.textColor = .black
        ////        cell.selectedView.alpha = 0.1
        //        cell.selectedView.backgroundColor = UIColor(red: 0.952, green: 0.986, blue: 0.993, alpha: 1)
        //
        //        cell.flightCode.textColor = UIColor(hexString: "#6B9ED0")
        //
        cell.middleTappedEffect()
    }
    
    func handleFirstLastText(cell:CebCalendarCell,cellState:CellState){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM yyyy"
        print("selected", cell.dateLabel.text)
      
        if calendarView.selectedDates.count > 1 {
              dateRange.textFieldViewTo.text = "\(dateFormatter.string(for: calendarView.selectedDates.last)!)"
                  
        }else {

          dateRange.textFieldViewTo.text = ""
                  
        }
        
        if calendarView.selectedDates.count > 0 {
              dateRange.textFieldViewFrom.text = "\(dateFormatter.string(for: calendarView.selectedDates.first)!)"
        }else {
               dateRange.textFieldViewFrom.text = ""
               
        }
    
        if cellState.isSelected {
            UIView.animate(withDuration: 0.3) {
                cell.selectedView.backgroundColor = UIColor(red: 1, green: 0.804, blue: 0, alpha: 1)
                cell.dateLabel.textColor = self.datelabelColorSelected
                cell.flightCode.textColor = self.datelabelColorSelected
            }
        }else{
            UIView.animate(withDuration: 0.3) {
                cell.dateLabel.textColor = .black
                cell.selectedView.alpha = 0
                //Temporary hide
                //                cell.flightCode.textColor = .r//UIColor(hexString: "#6B9ED0")
                //                cell.defaultTextView()
            }
        }
    }
}
