public class ALBusSeatViewConfig {
    open var leftHandDrivePosition: Bool = true
    
    open var emptySeatBGColor: UIColor = .white
    open var selectedSeatBGColor: UIColor = .green
    open var soldWomanBGColor: UIColor = .red
    open var soldManBGColor: UIColor = .blue
    
    open var marginBetweenSeats: CGFloat = 5.0
    open var seatCornerRadius: CGFloat = 8.0
    open var seatBorderColor: UIColor = .clear
    open var seatBorderWidth: CGFloat = 0
    open var seatShadowColor: UIColor = UIColor(red: 146.0 / 255.0, green: 184.0 / 255.0, blue: 202.0 / 255.0, alpha: 1)
    open var seatShadowRadius: CGFloat = 5.0
    open var seatShadowSize: CGSize = CGSize(width: 1, height: 1)
    open var seatShadowOpacity: Float = 0.7
    open var seatRemoveImage: UIImage? = nil
    open var seatNumberFont: UIFont = .systemFont(ofSize: 15)
    open var seatNumberSelectedFont: UIFont = .boldSystemFont(ofSize: 15)
    open var seatNumberColor: UIColor = .black
    open var seatNumberSelectedColor: UIColor = .white
    
    open var centerHallHeight: CGFloat = 20
    open var centerHallInfoText: String = ""
    open var centerHallInfoTextColor: UIColor = .black
    open var centerHallInfoTextFont: UIFont = .systemFont(ofSize: 12)
    
    open var busFrontImage: UIImage? = nil
    open var busFrontImageWidth: CGFloat = 50
    
    open var floorSeperatorWidth: CGFloat = 50
    open var floorSeperatorImage: UIImage? = nil
    
    open var tooltipText: String = "Select Gender"
    
    public init() { }
}
