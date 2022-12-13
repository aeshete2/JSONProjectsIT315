//
//  MasterListController.swift
//  DCTouristSite-AE
//
//  Created by user227538 on 12/5/22.
//

import Foundation
import UIKit
class MasterListController : UITableViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        GetJSONData()
        SetBackgroundImage()
        
    }
    
    var DCTouristSiteObjects = [DCTouristSite]()
    
    //set the background image
    func SetBackgroundImage(){
        let downloadedBackgroundImage = convertToimage(urlString: "https://raw.githubusercontent.com/aeshete2/JSONProjectsIT315/master/masterbackground.png")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = downloadedBackgroundImage
        imageView.center = view.center
        imageView.alpha = 0.2
        view.addSubview(imageView)
        self.view.bringSubviewToFront(imageView)
        
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
                DCTouristSiteObjects.append(ts)
                
            }
            
        }
        
        // Take each Dictionary object and convert it to a Swift Object (Dictionary)
        // Split the dictionary into two parts
        // Take each element from the Dictionary create a Hiking Trail Object and then add to the HikingTralsObjects Array
        
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DCTouristSiteObjects.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let rowNum = indexPath.row
        
        let ts = DCTouristSiteObjects[rowNum]
        
        let cellSite = tableView.dequeueReusableCell(withIdentifier: "cellSite")
        
        cellSite?.textLabel!.text = ts.TouristSiteName
        
        let downloadedImage = convertToimage(urlString: ts.TouristSitePhoto)
        
        //call a resize method to make all the title image equal
        let resizedImage = resizeImage(image: downloadedImage, targetSize: CGSizeMake(50.0, 50.0))

        cellSite?.imageView!.image = resizedImage
        
        cellSite?.layer.borderWidth = 1
        cellSite?.layer.masksToBounds = false
        cellSite?.layer.borderColor = UIColor.lightGray.cgColor
        cellSite?.layer.cornerRadius = 25
        cellSite?.clipsToBounds = true
        
        cellSite?.detailTextLabel!.text = ts.TouristSiteAddress
        
        return cellSite!
        
    }
    
    //resize the image with a given target size (NOTE: I researched the code and modified it to fit with my need)
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //find the selected row from the tableview
        //get the corresponding object from the array
        //find the destination controller
        //find the selected HT to the selected destination controller
        if (segue.identifier == "showDetail") // please check the identifier in the inspector/proporty pane/name/set the segue
        {
            let selectedRowIndex = tableView.indexPathForSelectedRow!.row
            let selectedTS = DCTouristSiteObjects[selectedRowIndex]
            
            let destinationController = segue.destination as! ViewController
            destinationController.seguePassedObject = selectedTS
        }
        
    }
    
}
