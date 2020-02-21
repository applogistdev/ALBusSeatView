public class ALBusSeatViewConfig {
    
    // Layout
    open var leftHandDrivePosition: Bool = true
    open var marginBetweenSeats: CGFloat = 5.0
    
    // Seat
    open var seatEmptyBGColor: UIColor = .white
    open var seatSelectedBGColor: UIColor = .green
    open var seatSoldWomanBGColor: UIColor = .red
    open var seatSoldManBGColor: UIColor = .blue
    open var seatCornerRadius: CGFloat = 8.0
    open var seatBorderColor: UIColor = .clear
    open var seatBorderWidth: CGFloat = 0
    open var seatShadowColor: UIColor = .lightGray
    open var seatShadowRadius: CGFloat = 5.0
    open var seatShadowSize: CGSize = CGSize(width: 1, height: 1)
    open var seatShadowOpacity: Float = 0.7
    open var seatRemoveImage: UIImage? = nil
    open var seatNumberFont: UIFont = .systemFont(ofSize: 15)
    open var seatNumberSelectedFont: UIFont = .boldSystemFont(ofSize: 15)
    open var seatNumberColor: UIColor = .black
    open var seatNumberSelectedColor: UIColor = .white
    
    // Hall
    open var centerHallHeight: CGFloat = 20
    open var centerHallInfoText: String = ""
    open var centerHallInfoTextColor: UIColor = .black
    open var centerHallInfoTextFont: UIFont = .systemFont(ofSize: 12)
    
    // Bus Front Section
    open var busFrontImage: UIImage? = nil
    open var busFrontImageWidth: CGFloat = 50
    
    // Floor Section
    open var floorSeperatorWidth: CGFloat = 50
    open var floorSeperatorImage: UIImage? = nil
    
    // Tooltip
    open var tooltipText: String = "Select Gender"
    
    public init() { }
}
