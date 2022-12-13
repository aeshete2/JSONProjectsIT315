//
//  ViewController.swift
//  DCTouristSite-AE
//
//  Created by user227538 on 10/3/22.
//

import UIKit
import MapKit
import AVKit
import AVFoundation
import CoreLocation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var lblDisclaimer: UILabel!
    
    @IBOutlet weak var swFavorite: UISwitch!
    
    var avAudioPlayer:AVAudioPlayer! // Declaration of the Audio Player object
    
    @IBOutlet weak var imgTouristSitePhoto: UIImageView!
    
    @IBOutlet weak var lblTouristSiteName: UILabel!
    
    @IBOutlet weak var txtTouristSiteDescription: UITextView!
    
    @IBOutlet weak var lblTouristSiteAddress: UILabel!
    
    @IBOutlet weak var lblTouristSiteOperationalHours: UILabel!
    
    @IBOutlet weak var lblTouristSitePhone: UILabel!
    
    @IBOutlet weak var lblTouristSiteArea: UILabel!
    
    @IBOutlet weak var lblTouristSiteWebsite: UILabel!
    
    @IBOutlet weak var txtViewTouristSiteWebsite: UITextView!
    
    @IBOutlet weak var txtRequiredTouristSite: UITextField!
    
    @IBOutlet weak var btnPlayPause: UIButton!
    
    //var DCTouristSites = ["The White House", "The United States Capitol", "Library of //Congress", "Lincoln Memorial", "Washington Monument", "Smithonian Institution"]
    
    var DCTouristSitesObjects = [DCTouristSite]()
    
    func InitializeDCTouristSites () {
        let a1 = DCTouristSite()
        a1.TouristSiteName = "The White House"
        a1.TouristSiteDescription = "The White House is the official residence and workplace of the president of the United States. It is located at 1600 Pennsylvania Avenue NW in Washington, D.C., and has been the residence of every U.S. president since John Adams in 1800."
        a1.TouristSiteAddress = "1600 Pennsylvania Avenue NW, Washington, DC 20500"
        a1.TouristSiteOperationalHours = "8:30AM - 4:30PM Except Sunday"
        a1.TouristSitePhone = "(202) 456-1111"
        a1.TouristSiteArea = "54,900 ft²"
        a1.TouristSitePhoto = "whitehouse.png"
        a1.TouristSiteWebsite = "https://www.whitehousegov/"
        a1.TouristSiteLatitude = 38.8977
        a1.TouristSiteLongitude = -77.0365
        DCTouristSitesObjects.append(a1)
        
        let a2 = DCTouristSite()
        a2.TouristSiteName = "The United States Capitol"
        a2.TouristSiteDescription = "The United States Capitol, often called The Capitol or the Capitol Building, is the meeting place of the United States Congress and the seat of the legislative branch of the U.S. federal government. It is located on Capitol Hill at the eastern end of the National Mall in Washington, D.C."
        a2.TouristSiteAddress = "First St SE, Washington, DC 20004"
        a2.TouristSiteOperationalHours = "8:30AM - 4:30PM Except Sunday"
        a2.TouristSitePhone = "(202) 226-8000"
        a2.TouristSiteArea = "16.5 acres"
        a2.TouristSitePhoto = "unitedstatescapitol.png"
        a2.TouristSiteWebsite = "https://www.visitthecapitol.gov/"
        a2.TouristSiteLatitude = 38.8899
        a2.TouristSiteLongitude = -77.0091
        DCTouristSitesObjects.append(a2)
        
        let a3 = DCTouristSite()
        a3.TouristSiteName = "Library of Congress"
        a3.TouristSiteDescription = "The Library of Congress is the research library that officially serves the United States Congress and is the de facto national library of the United States. It is the oldest federal cultural institution in the country."
        a3.TouristSiteAddress = "101 Independence Ave SE, Washington, DC 20540"
        a3.TouristSiteOperationalHours = "10AM - 5PM Except Sunday and Monday"
        a3.TouristSitePhone = "(202) 707-5000"
        a3.TouristSiteArea = "20 acres"
        a3.TouristSitePhoto = "libraryofcongress.png"
        a3.TouristSiteWebsite = "https://www.loc.gov/"
        a3.TouristSiteLatitude = 38.8887
        a3.TouristSiteLongitude = -77.0047
        DCTouristSitesObjects.append(a3)
        
        let a4 = DCTouristSite()
        a4.TouristSiteName = "Lincoln Memorial"
        a4.TouristSiteDescription = "The Lincoln Memorial is a U.S. national memorial built to honor the 16th president of the United States, Abraham Lincoln. It is on the western end of the National Mall in Washington, D.C., across from the Washington Monument, and is in the form of a neoclassical temple. The memorial's architect was Henry Bacon."
        a4.TouristSiteAddress = "2 Lincoln Memorial Cir NW, Washington, DC 20002"
        a4.TouristSiteOperationalHours = "Open 24 Hours"
        a4.TouristSitePhone = "(202) 426-6841"
        a4.TouristSiteArea = "27,340 ft²"
        a4.TouristSitePhoto = "lincolnmemorial.png"
        a4.TouristSiteWebsite = "https://www.nps.gov/linc/index.htm"
        a4.TouristSiteLatitude = 38.8893
        a4.TouristSiteLongitude = -77.0502
        DCTouristSitesObjects.append(a4)
        
        let a5 = DCTouristSite()
        a5.TouristSiteName = "Washington Monument"
        a5.TouristSiteDescription = "The Washington Monument is an obelisk shaped building within the National Mall in Washington, D.C., built to commemorate George Washington, once commander-in-chief of the Continental Army in the American Revolutionary War and the first President of the United States."
        a5.TouristSiteAddress = "2 15th St NW, Washington, DC 20024"
        a5.TouristSiteOperationalHours = "Monday - Friday 9AM - 10PM"
        a5.TouristSitePhone = "(202) 426-6841"
        a5.TouristSiteArea = "106 acres"
        a5.TouristSitePhoto = "washingtonmonument.png"
        a5.TouristSiteWebsite = "https://www.nps.gov/wamo/index.htm"
        a5.TouristSiteLatitude = 38.8895
        a5.TouristSiteLongitude = -77.0353
        DCTouristSitesObjects.append(a5)
        
        let a6 = DCTouristSite()
        a6.TouristSiteName = "Jefferson Memorial"
        a6.TouristSiteDescription = "The Jefferson Memorial is a presidential memorial built in Washington, D.C. between 1939 and 1943 in honor of Thomas Jefferson, the principal author of the United States Declaration of Independence, a central intellectual force behind the American Revolution, founder of the Democratic-Republican Party, and the nation's third president."
        a6.TouristSiteAddress = "16 E Basin Dr SW, Washington, DC 20242"
        a6.TouristSiteOperationalHours = "Sunday - Saturday 8:30AM - 5:30PM"
        a6.TouristSitePhone = "(202) 426-6841"
        a6.TouristSiteArea = "79,758 square feet"
        a6.TouristSitePhoto = "jeffersonmemorial.png"
        a6.TouristSiteWebsite = "https://www.nps.gov/thje/index.htm"
        a6.TouristSiteLatitude = 38.8814
        a6.TouristSiteLongitude = -77.0365
        DCTouristSitesObjects.append(a6)
        
        let a7 = DCTouristSite()
        a7.TouristSiteName = "African American History and Culture"
        a7.TouristSiteDescription = "The National Museum of African American History and Culture is a Smithsonian Institution museum located on the National Mall in Washington, D.C., in the United States. It was established in December 2003 and opened its permanent home in September 2016 with a ceremony led by President Barack Obama."
        a7.TouristSiteAddress = "1400 Constitution Ave. NW, Washington, DC 20560"
        a7.TouristSiteOperationalHours = "Sunday - Saturday 10:00AM - 5:30PM"
        a7.TouristSitePhone = "(844) 750-3012"
        a7.TouristSiteArea = "400,000-square-foot"
        a7.TouristSitePhoto = "africanamericanmuseum.png"
        a7.TouristSiteWebsite = "https://www.si.edu/museums/african-american-museum"
        a7.TouristSiteLatitude = 38.8911
        a7.TouristSiteLongitude = -77.0326
        DCTouristSitesObjects.append(a7)
        
        let a8 = DCTouristSite()
        a8.TouristSiteName = "World War II Memorial"
        a8.TouristSiteDescription = "The District of Columbia War Memorial commemorates the citizens of the District of Columbia who served in World War I. Located on the National Mall, it was constructed in 1931 as a domed, peristyle Doric temple."
        a8.TouristSiteAddress = "1750 Independence Ave SW, Washington, DC 20024"
        a8.TouristSiteOperationalHours = "Open 24 Hours"
        a8.TouristSitePhone = " (202) 426-6841"
        a8.TouristSiteArea = "7.4-acre"
        a8.TouristSitePhoto = "worldwar2memorial.png"
        a8.TouristSiteWebsite = "https://www.nps.gov/wwii/index.htm"
        a8.TouristSiteLatitude = 38.8911
        a8.TouristSiteLongitude = -77.040361
        DCTouristSitesObjects.append(a8)
        
        let a9 = DCTouristSite()
        a9.TouristSiteName = "National Aquarium"
        a9.TouristSiteDescription = "The National Aquarium, Washington, D.C., was an aquarium in Washington D.C. It was located in the Herbert C. Hoover Building, which is bounded by 14th Street NW on the east, 15th Street NW on the west, Pennsylvania Avenue NW on the north, and Constitution Avenue NW on the south. Although the National Aquarium in Washington, D.C. was smaller than its Baltimore counterpart, with the experience taking around 45 minutes, it was the nation's first free and public aquarium. It closed on September 30, 2013, after 140 years."
        a9.TouristSiteAddress = "1401 Constitution Ave. NW, Washington, DC 20230"
        a9.TouristSiteOperationalHours = "Closed on September 30, 2013"
        a9.TouristSitePhone = "(202) 482-2824"
        a9.TouristSiteArea = "3,800 acres-acre"
        a9.TouristSitePhoto = "nationalaquarium.png"
        a9.TouristSiteWebsite = "https://aqua.org/"
        a9.TouristSiteLatitude = 38.8936
        a9.TouristSiteLongitude = -77.0328
        DCTouristSitesObjects.append(a9)
        
        let a10 = DCTouristSite()
        a10.TouristSiteName = "Washington National Cathedral"
        a10.TouristSiteDescription = "With the very fast acceleration of artificial intelligence, we are approaching what may be an inflection point in human history—the moment when A.I. is so advanced that it is impossible to know whether you are talking in a chat, say, with a human or a computer. Before we take this next step in human-machine evolution, we need to think very carefully. Henry Kissinger, among others, has asked – Is the Age of Artificial Intelligence the end of the Age of Reason? These issues in technology may sound recondite, but they go to the heart of what it is to be “human.” What are the essential values that should guide our human interaction with each other, the planet, and the infinity beyond?"
        a10.TouristSiteAddress = "3101 Wisconsin Ave NW, Washington, DC 20016"
        a10.TouristSiteOperationalHours = "Open 24 Hours"
        a10.TouristSitePhone = "(202) 537-6200"
        a10.TouristSiteArea = "57 acres"
        a10.TouristSitePhoto = "nationalcathedral.png"
        a10.TouristSiteWebsite = "https://cathedral.org/"
        a10.TouristSiteLatitude = 38.930176
        a10.TouristSiteLongitude = -77.070503
        DCTouristSitesObjects.append(a10)
        
        let a11 = DCTouristSite()
        a11.TouristSiteName = "National Archives"
        a11.TouristSiteDescription = "The National Archives and Records Administration is an independent federal agency of the United States government within the executive branch, charged with the preservation and documentation of government and historical records."
        a11.TouristSiteAddress = "701 Constitution Avenue, NW Washington, DC 20408"
        a11.TouristSiteOperationalHours = "10:00 a.m. to 5:30 p.m"
        a11.TouristSitePhone = "(202) 537-6200"
        a11.TouristSiteArea = "757,000 square feet"
        a11.TouristSitePhoto = "nationalarchives.png"
        a11.TouristSiteWebsite = "https://www.archives.gov/"
        a11.TouristSiteLatitude = 38.8925
        a11.TouristSiteLongitude = -77.0229
        DCTouristSitesObjects.append(a11)
        
    }
    
    var globalTouristSite:DCTouristSite = DCTouristSite()
    
    func SetLabels (){
        let randomTouristSite = DCTouristSitesObjects.randomElement()
        globalTouristSite = randomTouristSite!

        lblTouristSiteAddress.numberOfLines = 2
        lblTouristSiteName.text = randomTouristSite?.TouristSiteName
        
        txtTouristSiteDescription.text = randomTouristSite?.TouristSiteDescription
        lblTouristSiteAddress.text = randomTouristSite?.TouristSiteAddress
        lblTouristSitePhone.text = randomTouristSite?.TouristSitePhone
        lblTouristSiteArea.text = randomTouristSite?.TouristSiteArea
        imgTouristSitePhoto.image = UIImage(named: randomTouristSite!.TouristSitePhoto)
        lblTouristSiteOperationalHours.text = randomTouristSite?.TouristSiteOperationalHours
        lblTouristSiteWebsite.text = randomTouristSite?.TouristSiteWebsite
        txtViewTouristSiteWebsite.text = randomTouristSite?.TouristSiteWebsite
        txtViewTouristSiteWebsite.isEditable = false
        txtViewTouristSiteWebsite.dataDetectorTypes = .link
        
        let favorite = UserDefaults.standard.string(forKey: "Favorite")
        swFavorite.isOn = (randomTouristSite!.TouristSiteName == favorite)
        
        imgTouristSitePhoto.contentMode = UIView.ContentMode.scaleAspectFill
        imgTouristSitePhoto.frame.size.width = 349
        imgTouristSitePhoto.frame.size.height = 214
        //imgTouristSitePhoto.alpha = 0.5
        
        // Make image Corners rounded
        imgTouristSitePhoto.layer.cornerRadius = 25
        imgTouristSitePhoto.clipsToBounds = true
        imgTouristSitePhoto.layer.borderWidth = 2
        imgTouristSitePhoto.layer.borderColor = UIColor.lightGray.cgColor
        
        txtTouristSiteDescription.layer.cornerRadius = 25
        txtTouristSiteDescription.layer.borderWidth = 2
        txtTouristSiteDescription.layer.borderColor = UIColor.lightGray.cgColor
        
        txtTouristSiteDescription.textColor = UIColor(white: 0, alpha: 1)
        txtTouristSiteDescription.isScrollEnabled = true
        txtTouristSiteDescription.isEditable = false
        
    }
    
    //set the background image
    func SetBackgroundImage(){
        let background = UIImage(named: "background.png")

        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
        
    }
    
    //triggers when the play button clicked
    func PlayUserGuide(){
        let url = Bundle.main.url(forResource: "user_guide", withExtension: "mp3")
        avAudioPlayer = try! AVAudioPlayer(contentsOf: url!)
        avAudioPlayer.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        SetBackgroundImage()
        InitializeDCTouristSites()
        SetLabels()
        
        btnPlayPause.setImage(UIImage(named: "playAudio.png"), for: .normal)
        
        txtRequiredTouristSite.text = "Enter Site Name (partial name search works)"
        txtRequiredTouristSite.textColor = UIColor.lightGray
        
        lblDisclaimer.text = "This App is developed as an educational project. Certain materials are included under the fair use exemption of the U.S. Copyright Law and have been prepared according to the multimedia fair use guidelines and are restricted from further use."
        lblDisclaimer.numberOfLines = 4
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        imgTouristSitePhoto.alpha = 0
        lblTouristSiteName.alpha = 0
        txtTouristSiteDescription.alpha = 0
        lblTouristSiteAddress.alpha = 0
        lblTouristSiteOperationalHours.alpha = 0
        lblTouristSitePhone.alpha = 0
        lblTouristSiteArea.alpha = 0
        txtViewTouristSiteWebsite.alpha = 0
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        UIView.animate(withDuration: 4.0, animations: {
            self.imgTouristSitePhoto.alpha = 1
            self.lblTouristSiteName.alpha = 1
            self.txtTouristSiteDescription.alpha = 1
            self.lblTouristSiteAddress.alpha = 1
            self.lblTouristSiteOperationalHours.alpha = 1
            self.lblTouristSitePhone.alpha = 1
            self.lblTouristSiteArea.alpha = 1
            self.txtViewTouristSiteWebsite.alpha = 1
        })

        SetLabels()
    }
    
    @IBAction func btnNextTour(_ sender: Any) {
        SetLabels()
        
    }
    
    //navigates to the tourist site using the site latitude and longitude
    @IBAction func btnNavigateAddress(_ sender: Any) {
        let latitude = globalTouristSite.TouristSiteLatitude
        let longitude = globalTouristSite.TouristSiteLongitude
        
        let url = URL(string: "comgooglemaps://?saddr=&daddr=\(latitude),\(longitude)&directionsmode=driving")
        
        if UIApplication.shared.canOpenURL(url!) {
              UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        }
        else{
              let urlBrowser = URL(string: "https://www.google.co.in/maps/dir/??saddr=&daddr=\(latitude),\(longitude)&directionsmode=driving")
                        
               UIApplication.shared.open(urlBrowser!, options: [:], completionHandler: nil)
        }
    }
    
    //trigger when search button click
    @IBAction func btnPlayPause(_ sender: Any) {
        if avAudioPlayer != nil {
            avAudioPlayer.stop()
            avAudioPlayer = nil
            btnPlayPause.setImage(UIImage(named: "playAudio.png"), for: .normal)
            
        }
        else{
            btnPlayPause.setImage(UIImage(named: "pauseAudio.png"), for: .normal)
            PlayUserGuide()
            
        }
    }
    
    //search a specific tourist site
    @IBAction func btnSearchTouristSite(_ sender: Any) {
        let requiredTouristSite = txtRequiredTouristSite.text ?? "Monument"
        
        var i = 0
        while i < DCTouristSitesObjects.count{
            let specificTouristSite = DCTouristSitesObjects[i] // access its attribute
            let searchResult = specificTouristSite.TouristSiteName.localizedCaseInsensitiveContains(requiredTouristSite)
            
            if searchResult {
                globalTouristSite = specificTouristSite

                lblTouristSiteAddress.numberOfLines = 2
                lblTouristSiteName.text = specificTouristSite.TouristSiteName
                
                txtTouristSiteDescription.text = specificTouristSite.TouristSiteDescription
                lblTouristSiteAddress.text = specificTouristSite.TouristSiteAddress
                lblTouristSitePhone.text = specificTouristSite.TouristSitePhone
                lblTouristSiteArea.text = specificTouristSite.TouristSiteArea
                imgTouristSitePhoto.image = UIImage(named: specificTouristSite.TouristSitePhoto)
                lblTouristSiteOperationalHours.text = specificTouristSite.TouristSiteOperationalHours
                lblTouristSiteWebsite.text = specificTouristSite.TouristSiteWebsite
                txtViewTouristSiteWebsite.text = specificTouristSite.TouristSiteWebsite
                txtViewTouristSiteWebsite.isEditable = false
                txtViewTouristSiteWebsite.dataDetectorTypes = .link
                
                let favorite = UserDefaults.standard.string(forKey: "Favorite")
                swFavorite.isOn = (specificTouristSite.TouristSiteName == favorite)
                
                imgTouristSitePhoto.contentMode = UIView.ContentMode.scaleAspectFill
                imgTouristSitePhoto.frame.size.width = 349
                imgTouristSitePhoto.frame.size.height = 214
                //imgTouristSitePhoto.alpha = 0.5
                
                // Make image Corners rounded
                imgTouristSitePhoto.layer.cornerRadius = 25
                //imgTouristSitePhoto.clipsToBounds = true
                imgTouristSitePhoto.layer.borderWidth = 2
                imgTouristSitePhoto.layer.borderColor = UIColor.lightGray.cgColor
                
                txtTouristSiteDescription.layer.cornerRadius = 25
                txtTouristSiteDescription.layer.borderWidth = 2
                txtTouristSiteDescription.layer.borderColor = UIColor.lightGray.cgColor
                
                txtTouristSiteDescription.textColor = UIColor(white: 0, alpha: 1)
                txtTouristSiteDescription.isScrollEnabled = true
                txtTouristSiteDescription.isEditable = false
                
            }
            
            i += 1
        }
        
    }
    
    //triggers when a user begin editign in the search text box
    @IBAction func txtRequiredTouristSiteDidBeginEditing(_ sender: Any) {
        if txtRequiredTouristSite.textColor == UIColor.lightGray{
            txtRequiredTouristSite.text = nil
            txtRequiredTouristSite.textColor = UIColor.black
        }
    }
    
    //triggers when a user end editing in the search text box
    @IBAction func txtRequiredTouristSiteDidEndEditing(_ sender: Any) {
        if txtRequiredTouristSite.text!.isEmpty{
            txtRequiredTouristSite.text = "Enter site name (partial name search works)"
            txtRequiredTouristSite.textColor = UIColor.lightGray
        }
    }
    
    //triggers when a user select his/her favorite tourist site
    @IBAction func FavoriteChanged(_ sender: Any) {
        if (swFavorite.isOn){
            UserDefaults.standard.set(lblTouristSiteName.text, forKey: "Favorite")
        }
        else{
            UserDefaults.standard.set("", forKey: "Favorite")
            
        }
        
    }
    
    
}

