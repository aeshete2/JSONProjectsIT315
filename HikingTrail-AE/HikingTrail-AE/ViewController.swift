//
//  ViewController.swift
//  HikingTrail-AE
//
//  Created by user227538 on 9/25/22.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    var mySoundFile:AVAudioPlayer! // Declaration of the Audio Player object
   
    @IBOutlet weak var swFavorite: UISwitch!
    
    @IBOutlet weak var imgTrailImage: UIImageView!
    @IBOutlet weak var lblDifficulty: UILabel!
    
    @IBOutlet weak var lblTime: UILabel!
    
    @IBOutlet weak var lblElevation: UILabel!
    @IBOutlet weak var lblLength: UILabel!
    
    @IBOutlet weak var txtDescription: UITextView!
    
    @IBOutlet weak var lblTrailName: UILabel!
    var HikingTrails = ["Bull Run", "Old Rag", "Raven's Rock", "Great Falls", "Natural Bridge", "Appalachain Trail"]
    
    var HikingTrailsObjects = [HikingTrail]()
    
    var seguePassedObject = HikingTrail()
    
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
    
    func InitializeHikingTrails(){
        let h1 = HikingTrail()
        h1.TrailName = "Bull Run"
        h1.TrailDescription = "Bull Run was the first full-scale battle of the Civil War. The fierce fight there forced both the North and South to face the sobering reality that the war would be long and bloody."
        h1.TrailDistance = "19.6"
        h1.TrailElevation = "1387"
        h1.TrailTime = "6 hr 21 min"
        h1.TrailDifficulty = "Difficult"
        h1.TrailImage = "bullrun.jpg"
        h1.TrailWebSite = "https://www.novaparks.com/parks/bull-run-regional-park"
        HikingTrailsObjects.append(h1)
        
        let h2 = HikingTrail()
        h2.TrailName = "Old Rag"
        h2.TrailDescription = "Old Rag Mountain is a 3,284 feet mountain near Sperryville in Madison County, Virginia. A part of the Blue Ridge Mountains, the peak is located within Shenandoah National Park and is the most popular hiking destination within the park. In contrast to most mountains of the Blue Ridge, Old Rag has an exposed summit."
        h2.TrailDistance = "9.8"
        h2.TrailElevation = "2608"
        h2.TrailTime = "5 hr 25 min"
        h2.TrailDifficulty = "Difficult"
        h2.TrailImage = "oldrag.jpg"
        h2.TrailWebSite = "https://www.nps.gov/places/old-rag.htm"
        HikingTrailsObjects.append(h2)
        
        let h3 = HikingTrail()
        h3.TrailName = "Raven's Rock"
        h3.TrailDescription = "Raven Rocks is spur of Blue Ridge Mountain in Jefferson County, West Virginia. The peak is located just north of Jefferson County's border with Clarke County, Virginia and west of its border with Loudoun County, Virginia."
        h3.TrailDistance = "5.7"
        h3.TrailElevation = "1509"
        h3.TrailTime = "3 hr 14 min"
        h3.TrailDifficulty = "Moderate"
        h3.TrailImage = "ravensrock.jpg"
        h3.TrailWebSite = "http://www.raven-rocks.org/"
        HikingTrailsObjects.append(h3)
        
        let h4 = HikingTrail()
        h4.TrailName = "Great Falls"
        h4.TrailDescription = "Great Falls is a series of rapids and waterfalls on the Potomac River, 14 miles upstream from Washington, D.C., on the border of Montgomery County, Maryland and Fairfax County, Virginia."
        h4.TrailDistance = "14"
        h4.TrailElevation = "239.4"
        h4.TrailTime = "0 hr 27 min"
        h4.TrailDifficulty = "Easy"
        h4.TrailImage = "greatfalls.jpg"
        h4.TrailWebSite = "https://www.nps.gov/grfa/index.htm"
        HikingTrailsObjects.append(h4)
        
        let h5 = HikingTrail()
        h5.TrailName = "Natural Bridge"
        h5.TrailDescription = "Natural Bridge is an unincorporated community in Rockbridge County, Virginia, United States. The community is the site of Natural Bridge, a natural arch which gives the town its name. Natural Bridge is located at the junction of U.S. Route 11 and State Route 130."
        h5.TrailDistance = "1.8"
        h5.TrailElevation = "1076"
        h5.TrailTime = "0 hr 44 min"
        h5.TrailDifficulty = "Easy"
        h5.TrailImage = "naturalbridge.jpeg"
        h5.TrailWebSite = "https://www.dcr.virginia.gov/state-parks/natural-bridge"
        HikingTrailsObjects.append(h5)
        
        let h6 = HikingTrail()
        h6.TrailName = "Appalachain Trail"
        h6.TrailDescription = "The Appalachian Trail (the A.T.), is a hiking trail in the Eastern United States, extending almost 2,200 miles (3,540 km) between Springer Mountain in Georgia and Mount Katahdin in Maine, and passing through 14 states.[2] The Appalachian Trail Conservancy claims the Appalachian Trail to be the longest hiking-only trail in the world.[3] More than three million people hike segments of the trail each year."
        h6.TrailDistance = "2200"
        h6.TrailElevation = "6684"
        h6.TrailTime = "7 hr 25 min"
        h6.TrailDifficulty = "Difficult"
        h6.TrailImage = "appalachiantrail.jpeg"
        h6.TrailWebSite = "https://appalachiantrail.com/"
        HikingTrailsObjects.append(h6)
    }
    
    var globalHT:HikingTrail = HikingTrail()
    
    func SetLabels(){
        //let randomHT = HikingTrailsObjects.randomElement()
        let randomHT = seguePassedObject
        globalHT = randomHT
        lblTrailName.text = randomHT.TrailName
        txtDescription.text = randomHT.TrailDescription
        lblLength.text = String(format: "%.2f", randomHT.TrailDistance)
        lblElevation.text = String(format: "%.2f", randomHT.TrailElevation)
        lblTime.text = randomHT.TrailTime
        lblDifficulty.text = randomHT.TrailDifficulty
        
        switch randomHT.TrailDifficulty{
        case "Difficult":
            lblDifficulty.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
            break
        case "Easy":
            lblDifficulty.backgroundColor = UIColor(red: 219, green: 253, blue: 190, alpha: 0)
            break
        case "Moderate":
            lblDifficulty.backgroundColor = UIColor(red: 219, green: 253, blue: 190, alpha: 0)
            break
        default:
            lblDifficulty.backgroundColor = UIColor(red: 219, green: 253, blue: 190, alpha: 0)
            break
        }
        
        //imgTrailImage.image = UIImage(named: randomHT.TrailImage)
        imgTrailImage.image = convertToimage(urlString: randomHT.TrailImage)
        
        let favorite = UserDefaults.standard.string(forKey: "Favorite")
        swFavorite.isOn = (randomHT.TrailName == favorite)
        
        mySoundFile.play()
        
        imgTrailImage.contentMode = UIView.ContentMode.scaleToFill
        imgTrailImage.frame.size.width = 390
        imgTrailImage.frame.size.height = 350
        //imgTrailImage.center = self.view.center
        
        //Make image Corners rounded
        imgTrailImage.layer.cornerRadius = 100
        imgTrailImage.clipsToBounds = true
        imgTrailImage.layer.borderWidth = 2
        imgTrailImage.layer.borderColor = UIColor.lightGray.cgColor
        
        txtDescription.layer.cornerRadius = 25
        txtDescription.layer.borderWidth = 2
        txtDescription.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let urlObject = URL(fileURLWithPath: Bundle.main.path(forResource: "cannon_fire", ofType: "wav")!)
                            
        mySoundFile = try?AVAudioPlayer(contentsOf: urlObject)
        
        InitializeHikingTrails()
        SetLabels()
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        imgTrailImage.alpha = 0
        lblTrailName.alpha = 0
        txtDescription.alpha = 0
        lblTime.alpha = 0
        lblElevation.alpha = 0
        lblLength.alpha = 0
        lblDifficulty.alpha = 0
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        UIView.animate(withDuration: 4.0, animations: {
            self.imgTrailImage.alpha = 1
            self.lblTrailName.alpha = 1
            self.txtDescription.alpha = 1
            self.lblTime.alpha = 1
            self.lblElevation.alpha = 1
            self.lblLength.alpha = 1
            self.lblDifficulty.alpha = 1
        })

        SetLabels()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destController  = segue.destination as! DetailViewController
        destController.passedHikingTrail = seguePassedObject
    }
    
    //Touch Event for the next Trail Button
    @IBAction func tchNextTrail(_ sender: Any) {
        SetLabels()
    }
    
    @IBAction func btnSite(_ sender: Any) {
        let browserApp = UIApplication.shared
        let url = URL(string: globalHT.TrailWebSite)
        browserApp.open(url!)
        
    }
    
    @IBAction func FavoriteChange(_ sender: Any) {
        if (swFavorite.isOn){
            UserDefaults.standard.set(lblTrailName.text, forKey: "Favorite")
        }
        else{
            UserDefaults.standard.set("", forKey: "Favorite")
            
        }
    }
    

}

