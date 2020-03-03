

/// SeatView configuration class.
open class ALBusSeatViewConfig {
    
    // MARK: - Layout
    
    /// Left drive position status
    open var leftHandDrivePosition: Bool = true
    
    /// Margin between seats
    open var marginBetweenSeats: CGFloat = 5.0
    
    // MARK: - Seat
    
    /// Empty seat color
    open var seatEmptyBGColor: UIColor = .white
    
    /// Seat color purchased by woman or man
    open var seatSoldBGColor: UIColor = .gray
    
    /// Selected seat color
    open var seatSelectedBGColor: UIColor = .green
    
    /// Seat color purchased by woman
    open var seatSoldWomanBGColor: UIColor = .red
    
    /// Seat color purchased by man
    open var seatSoldManBGColor: UIColor = .blue
    
    /// Seat corner radius
    open var seatCornerRadius: CGFloat = 8.0
    
    /// Seat border color
    open var seatBorderColor: UIColor = .clear
    
    /// Seat border width
    open var seatBorderWidth: CGFloat = 0
    
    /// Seat shadow color
    open var seatShadowColor: UIColor = .lightGray
    
    /// Seat shadow radius
    open var seatShadowRadius: CGFloat = 5.0
    
    /// Seat shadow size
    open var seatShadowSize: CGSize = CGSize(width: 1, height: 1)
    
    /// Seat shadow opacity
    open var seatShadowOpacity: Float = 0.7
    
    /// The remove button image for selected seat
    open var seatRemoveImage: UIImage? = nil
    
    /// Seat number label font
    open var seatNumberFont: UIFont = .systemFont(ofSize: 15)
    
    /// Selected seat number label font
    open var seatNumberSelectedFont: UIFont = .boldSystemFont(ofSize: 15)
    
    /// Seat number label color
    open var seatNumberColor: UIColor = .black
    
    /// Selected seat number label color
    open var seatNumberSelectedColor: UIColor = .white
    
    
    // MARK: - Hall
    
    /// Bus hall height
    open var centerHallHeight: CGFloat = 20
    
    /// Hall information label text
    open var centerHallInfoText: String = ""
    
    /// Hall information label text color
    open var centerHallInfoTextColor: UIColor = .black
    
    /// Hall information label text font
    open var centerHallInfoTextFont: UIFont = .systemFont(ofSize: 12)
    
    
    // MARK: - Bus Front Section
    
    /// Bus front image
    open var busFrontImage: UIImage? = nil
    
    /// Bus front image width
    open var busFrontImageWidth: CGFloat = 50
    
    
    // MARK: - Floor Section
    
    /// Floor section width
    open var floorSeperatorWidth: CGFloat = 50
    
    /// Floor section image
    open var floorSeperatorImage: UIImage? = nil
    
    
    // MARK: - Tooltip
    
    /// Gender selection tooltip title
    open var tooltipText: String = "Select Gender"
    
    /// :nodoc:
    public init() { }
}
