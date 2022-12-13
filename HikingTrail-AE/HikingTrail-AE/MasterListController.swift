//
//  MasterListController.swift
//  HikingTrail-AE
//
//  Created by user227538 on 10/30/22.
//

import Foundation
import UIKit
class MasterListController : UITableViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        GetJSONData()
        //InitializeHikingTrails()
        
    }
    
    var HikingTrailsObjects = [HikingTrail]()
    
    func GetJSONData() {
        // Use the String address and convert it to a URL type
        let endPointString  = "https://raw.githubusercontent.com/aeshete2/JSONProjectsIT315/master/HikingTrails.json"
        
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
            let htDictionary = dictionary["HikingTrails"]! as! [[String: AnyObject]]
            
            for index in 0...htDictionary.count - 1 {
                // Dictionary to Single Object (Hiking Object)
                let singleHT = htDictionary[index]
                // Create the Hiking Trail Object
                let ht = HikingTrail()
                // Retrieve each object from the Dictionary
                ht.TrailName = singleHT["TrailName"] as! String
                ht.TrailDescription = singleHT["TrailDescription"] as! String
                ht.TrailDistance = singleHT["TrailDescription"] as! String
                ht.TrailElevation = singleHT["TrailElevation"] as! String
                ht.TrailTime = singleHT["TrailTime"] as! String
                ht.TrailDifficulty = singleHT["TrailDifficulty"] as! String
                ht.TrailImage = singleHT["TrailImage"] as! String
                ht.TrailWebSite = singleHT["TrailWebsite"] as! String
                HikingTrailsObjects.append(ht)
                
            }
            
        }
        
        // Take each Dictionary object and convert it to a Swift Object (Dictionary)
        // Split the dictionary into two parts
        // Take each element from the Dictionary create a Hiking Trail Object and then add to the HikingTralsObjects Array
        
        
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
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HikingTrailsObjects.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let rowNum = indexPath.row
        
        let ht = HikingTrailsObjects[rowNum]
        
        let cellA = tableView.dequeueReusableCell(withIdentifier: "cellA")
        
        cellA?.textLabel!.text = ht.TrailName
        
        let downloadedImage = convertToimage(urlString: "https://raw.githubusercontent.com/aeshete2/JSONProjectsIT315/master/OldRag.jpg")
        cellA?.imageView!.image = downloadedImage
        
        cellA?.imageView!.contentMode = UIView.ContentMode.scaleAspectFill
        cellA?.imageView!.frame.size.width = 150
        cellA?.imageView!.frame.size.height = 150
        
        //Make image Corners rounded
        cellA?.imageView!.layer.cornerRadius = 15
        cellA?.imageView!.clipsToBounds = true
        cellA?.imageView!.layer.borderWidth = 2
        cellA?.imageView!.layer.borderColor = UIColor.lightGray.cgColor
        
        cellA?.detailTextLabel!.text = ht.TrailDescription
    
        return cellA!
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //find the selected row from the tableview
        //get the corresponding object from the array
        //find the destination controller
        //find the selected HT to the selected destination controller
        if (segue.identifier == "showDetail") // please check the identifier in the inspector/proporty pane/name/set the segue
        {
            let selectedRowIndex = tableView.indexPathForSelectedRow!.row
            let selectedHT = HikingTrailsObjects[selectedRowIndex]
            
            let destinationController = segue.destination as! ViewController
            destinationController.seguePassedObject = selectedHT
        }
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
}
