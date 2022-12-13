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
    
    @IBOutlet weak var imgTitle: UIImageView!
    
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
    
    @IBOutlet weak var btnNavigateAddress: UIButton!
    
    @IBOutlet weak var btnNextTour: UIButton!
    
    var DCTouristSitesObjects = [DCTouristSite]()
    
    var seguePassedObject = DCTouristSite()
        
    var globalTouristSite:DCTouristSite = DCTouristSite()
    
    func SetLabels (){
        let selectedTouristSite = seguePassedObject
        globalTouristSite = selectedTouristSite

        lblTouristSiteAddress.numberOfLines = 2
        lblTouristSiteName.text = selectedTouristSite.TouristSiteName
        
        txtTouristSiteDescription.text = selectedTouristSite.TouristSiteDescription
        lblTouristSiteAddress.text = selectedTouristSite.TouristSiteAddress
        lblTouristSitePhone.text = selectedTouristSite.TouristSitePhone
        lblTouristSiteArea.text = selectedTouristSite.TouristSiteArea
        
        let downloadedTouristSitePhoto = convertToimage(urlString: selectedTouristSite.TouristSitePhoto)
        imgTouristSitePhoto.image = downloadedTouristSitePhoto
        
        lblTouristSiteOperationalHours.text = selectedTouristSite.TouristSiteOperationalHours
        lblTouristSiteWebsite.text = selectedTouristSite.TouristSiteWebsite
        txtViewTouristSiteWebsite.text = selectedTouristSite.TouristSiteWebsite
        txtViewTouristSiteWebsite.isEditable = false
        txtViewTouristSiteWebsite.dataDetectorTypes = .link
        
        let favorite = UserDefaults.standard.string(forKey: "Favorite")
        swFavorite.isOn = (selectedTouristSite.TouristSiteName == favorite)
        
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
    func SetImages(){
        let downloadedBackgroundImage = convertToimage(urlString: "https://raw.githubusercontent.com/aeshete2/JSONProjectsIT315/master/background.png")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = downloadedBackgroundImage
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
        
        let downloadedTitleImage = convertToimage(urlString: "https://raw.githubusercontent.com/aeshete2/JSONProjectsIT315/master/dc.png")
        imgTitle.image = downloadedTitleImage
        
        let downloadedPlayAudioImage = convertToimage(urlString: "https://raw.githubusercontent.com/aeshete2/JSONProjectsIT315/master/play.png")
        btnPlayPause.setImage(downloadedPlayAudioImage, for: .normal)
        
        let downloadedCarImage = convertToimage(urlString: "https://raw.githubusercontent.com/aeshete2/JSONProjectsIT315/master/car.png")
        btnNavigateAddress.setImage(downloadedCarImage, for: .normal)
        
        let downloadedMoreImage = convertToimage(urlString: "https://raw.githubusercontent.com/aeshete2/JSONProjectsIT315/master/more.png")
        btnNextTour.setImage(downloadedMoreImage, for: .normal)
        
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
        SetImages()
        SetLabels()
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destController  = segue.destination as! DetailViewController
        destController.passedDCTouristSite = seguePassedObject
    }
    
    func convertToimage(urlString: String) -> UIImage {
        //reach out to the URL and download bytes of data.
        //convert string to a URL type
        let imgURL = URL(string:urlString)!
        //2.call the end point and receive the bytes
        let imgData = try? Data(contentsOf: imgURL)
        print(imgData ?? "Error. Image does not exist at URL \(imgURL)")
        //convert bytes of data to image type
        let img = UIImage(data: imgData!)
        //return UIImage
        return img!
    }
    
    
    
    func GetJSONData() {
        // Use the String address and convert it to a URL type
        let endPointString  = "https://raw.githubusercontent.com/aeshete2/JSONProjectsIT315/master/DCTouristSites.json"
        
        let endPointURL = URL(string: endPointString)
        
        // Pass it to the Data function
        let dataBytes = try? Data(contentsOf:endPointURL!)
        
        // Rreceives the bytes
        print(dataBytes) // just for developers to see what is received. This will help in debugging
        
        if (dataBytes != nil) {
            // get the JSON objects and convert it to a Dictionary
            let dictionary: NSDictionary = (try? JSONSerialization.jsonObject(with: dataBytes!, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSDictionary
            
            print("Dictionary -- : \(dictionary) -- \n") //for debugging purposes
            
            // Split the Dictionary into two parts. Keep the HikingTrails part and discard the other
            let htDictionary = dictionary["DCTouristSites"]! as! [[String: AnyObject]]
            
            for index in 0...htDictionary.count - 1 {
                // Dictionary to Single Object (Tourist Site Object)
                let singleTS = htDictionary[index]
                // Create the Tourist Site Object
                let ts = DCTouristSite()
                // Retrieve each object from the Dictionary
                ts.TouristSiteName = singleTS["TouristSiteName"] as! String
                ts.TouristSiteDescription = singleTS["TouristSiteDescription"] as! String
                ts.TouristSiteAddress = singleTS["TouristSiteAddress"] as! String
                ts.TouristSiteOperationalHours = singleTS["TouristSiteOperationalHours"] as! String
                ts.TouristSitePhone = singleTS["TouristSitePhone"] as! String
                ts.TouristSiteArea = singleTS["TouristSiteArea"] as! String
                ts.TouristSitePhoto = singleTS["TouristSitePhoto"] as! String
                ts.TouristSiteWebsite = singleTS["TouristSiteWebsite"] as! String
                ts.TouristSiteLatitude = singleTS["TouristSiteLatitude"] as! Double
                ts.TouristSiteLongitude = singleTS["TouristSiteLongitude"] as! Double
                DCTouristSitesObjects.append(ts)
                
            }
            
        }
        
        // Take each Dictionary object and convert it to a Swift Object (Dictionary)
        // Split the dictionary into two parts
        // Take each element from the Dictionary create a Hiking Trail Object and then add to the HikingTralsObjects Array
        
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
            let downloadedPlayAudioImage = convertToimage(urlString: "https://raw.githubusercontent.com/aeshete2/JSONProjectsIT315/master/play.png")
            btnPlayPause.setImage(downloadedPlayAudioImage, for: .normal)
            
        }
        else{
            let downloadedPauseAudioImage = convertToimage(urlString: "https://raw.githubusercontent.com/aeshete2/JSONProjectsIT315/master/pause.png")
            btnPlayPause.setImage(downloadedPauseAudioImage, for: .normal)
            PlayUserGuide()
        }
    }
    
    //search a specific tourist site
    @IBAction func btnSearchTouristSite(_ sender: Any) {
        GetJSONData()

        let requiredTouristSite = txtRequiredTouristSite.text ?? "Monument"
        
        var i = 0
        
        while i < DCTouristSitesObjects.count{
            let specificTouristSite = DCTouristSitesObjects[i] // access its attribute
            
            let searchResult = specificTouristSite.TouristSiteName.localizedCaseInsensitiveContains(requiredTouristSite)
            
            if searchResult {
                globalTouristSite = specificTouristSite
                seguePassedObject = specificTouristSite
                
                lblTouristSiteAddress.numberOfLines = 2
                lblTouristSiteName.text = specificTouristSite.TouristSiteName
                
                txtTouristSiteDescription.text = specificTouristSite.TouristSiteDescription
                lblTouristSiteAddress.text = specificTouristSite.TouristSiteAddress
                lblTouristSitePhone.text = specificTouristSite.TouristSitePhone
                lblTouristSiteArea.text = specificTouristSite.TouristSiteArea
                
                let downloadedTouristSitePhoto = convertToimage(urlString: specificTouristSite.TouristSitePhoto)
                imgTouristSitePhoto.image = downloadedTouristSitePhoto
                
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

