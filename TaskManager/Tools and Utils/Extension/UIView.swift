//
//  UIView.swift
//  TaskManager
//
//  Created by shndrs on 6/3/23.
//

import UIKit
import AudioToolbox
import PureLayout

extension UIView {
    
    static func loadFromXib<T>(withOwner: Any? = nil,
                               options: [AnyHashable : Any]? = nil) -> T where T: UIView {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: "\(self)", bundle: bundle)

        guard let view = nib.instantiate(withOwner: withOwner,
                                         options: options as? [UINib.OptionsKey : Any]).first as? T else {
            fatalError("Could not load view from nib file.")
        }
        return view
    }
    
    public class var nibName: String {
        
        let name = "\(self)".components(separatedBy: ".").first ?? ""
        return name
    }
    
    public class var nib: UINib? {
        if let _ = Bundle.main.path(forResource: nibName, ofType: "nib") {
            return UINib(nibName: nibName, bundle: nil)
        } else {
            return nil
        }
    }
    
    public class func fromNib(nibNameOrNil: String? = nil) -> Self {
        return fromNib(nibNameOrNil: nibNameOrNil, type: self)
    }

    public class func fromNib<T : UIView>(nibNameOrNil: String? = nil, type: T.Type) -> T {
        let v :T? = fromNib(nibNameOrNil: nibNameOrNil, type: T.self)
        return v!
    }

    public class func fromNib<T : UIView>(nibNameOrNil: String? = nil, type: T.Type) -> T? {
        var view: T?
        let name: String
        if let nibName = nibNameOrNil {
            name = nibName
        } else {
            name = nibName
        }
        let nibViews = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
        for v in nibViews! {
            if let tog = v as? T {
                view = tog
            }
        }
        return view
    }
    
    public func addCornerRadius(radius: CGFloat) {
        self.clipsToBounds = true;
        self.layer.cornerRadius = CGFloat(radius)
    }
    
    public func addCornerRadius(radius: CGFloat, inset: UIEdgeInsets) {
        let padding = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        self.layer.frame = bounds.inset(by: padding)
        self.layer.cornerRadius = CGFloat(radius)
    }
    
    public func addBorder(color: UIColor = UIColor.white,
                          thickness: CGFloat = 1.0) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = thickness
    }
    
    func fade(duration: TimeInterval,
              delay: TimeInterval,
              isIn: Bool = true) {
        self.alpha = isIn ? 0 : 1
        UIView.animate(withDuration: duration, delay: delay,
                       options: .curveEaseInOut, animations: { [weak self] in
            guard self != nil else { return }
            self?.alpha = isIn ? 1 : 0
        })
    }
    
    func addBorder(edges: UIRectEdge,
                   color: UIColor = UIColor.white,
                   thickness: CGFloat = 1.0) -> [UIView] {
        var borders = [UIView]()
        func border() -> UIView {
            let border = UIView(frame: CGRect.zero)
            border.backgroundColor = color
            border.translatesAutoresizingMaskIntoConstraints = false
            return border
        }
        if edges.contains(.top) || edges.contains(.all) {
            let top = border()
            addSubview(top)
            addConstraints(
                NSLayoutConstraint.constraints(withVisualFormat: "V:|-(0)-[top(==thickness)]",
                                               options: [],
                                               metrics: ["thickness": thickness],
                                               views: ["top": top]))
            addConstraints(
                NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0)-[top]-(0)-|",
                                               options: [],
                                               metrics: nil,
                                               views: ["top": top]))
            borders.append(top)
        }
        if edges.contains(.left) || edges.contains(.all) {
            let left = border()
            addSubview(left)
            addConstraints(
                NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0)-[left(==thickness)]",
                                               options: [],
                                               metrics: ["thickness": thickness],
                                               views: ["left": left]))
            addConstraints(
                NSLayoutConstraint.constraints(withVisualFormat: "V:|-(0)-[left]-(0)-|",
                                               options: [],
                                               metrics: nil,
                                               views: ["left": left]))
            borders.append(left)
        }
        if edges.contains(.right) || edges.contains(.all) {
            let right = border()
            addSubview(right)
            addConstraints(
                NSLayoutConstraint.constraints(withVisualFormat: "H:[right(==thickness)]-(0)-|",
                                               options: [],
                                               metrics: ["thickness": thickness],
                                               views: ["right": right]))
            addConstraints(
                NSLayoutConstraint.constraints(withVisualFormat: "V:|-(0)-[right]-(0)-|",
                                               options: [],
                                               metrics: nil,
                                               views: ["right": right]))
            borders.append(right)
        }
        if edges.contains(.bottom) || edges.contains(.all) {
            let bottom = border()
            addSubview(bottom)
            addConstraints(
                NSLayoutConstraint.constraints(withVisualFormat: "V:[bottom(==thickness)]-(0)-|",
                                               options: [],
                                               metrics: ["thickness": thickness],
                                               views: ["bottom": bottom]))
            addConstraints(
                NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0)-[bottom]-(0)-|",
                                               options: [],
                                               metrics: nil,
                                               views: ["bottom": bottom]))
            borders.append(bottom)
        }
        return borders
    }
    
    func lock() {
        if let _ = viewWithTag(10) {
            //View is already locked
        } else {
            let lockView = UIView()
            lockView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
            lockView.tag = 10
            lockView.alpha = 0.0
            addSubview(lockView)
            lockView.autoPinEdgesToSuperviewEdges()
            let activity = UIActivityIndicatorView(style: .medium)
            activity.color = .white
            activity.hidesWhenStopped = true
            lockView.addSubview(activity)
            activity.autoCenterInSuperview()
            activity.startAnimating()
            UIView.animate(withDuration: 0.2) {
                lockView.alpha = 1.0
            }
        }
    }

    func unlock() {
        if let lockView = viewWithTag(10) {
            UIView.animate(withDuration: 0.2, animations: {
                lockView.alpha = 0.0
            }) { _ in
                lockView.removeFromSuperview()
            }
        }
    }
    
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = Colors.label.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowRadius = 3
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func shake(ratio: CGFloat? = 10) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.1
        animation.repeatCount = 1
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint.init(x:self.center.x - ratio!,
                                                            y:self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint.init(x:self.center.x + ratio!,
                                                          y:self.center.y))
        self.layer.add(animation, forKey: "position")
//        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
    
    func rotate() {
        let rotation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.duration = 0.3
        rotation.autoreverses = true
        rotation.fromValue = (-Double.pi / 9)
        rotation.toValue = (Double.pi / 9)
        rotation.repeatCount = Float.infinity
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
    
    func rotateY() {
        let rotation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.y")
        rotation.duration = 0.9
        rotation.autoreverses = true
        rotation.fromValue = (-Double.pi / 5)
        rotation.toValue = (Double.pi / 5)
        rotation.repeatCount = Float.infinity
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }

}

