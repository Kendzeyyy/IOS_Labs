import UIKit

class ViewController: UIViewController,
    UIImagePickerControllerDelegate,
    UINavigationControllerDelegate
{
    let picker = UIImagePickerController()
    
    
    @IBOutlet weak var myImageView: UIImageView!
    
    var uploadImg = UploadImage()
   
    /*
    @IBAction func imageUpload(_ sender: UIBarButtonItem) {
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        picker.modalPresentationStyle = .popover
        present(picker, animated: true, completion: nil)
        picker.popoverPresentationController?.barButtonItem = sender
    }
     */
    
    // Choose image from library
    @IBAction func imageUpload(_ sender: UIButton) {
        
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        picker.modalPresentationStyle = .popover
        present(picker, animated: true, completion: nil)
        
    }
    
    // Send image to the server
    @IBAction func send(_ sender: UIButton) {
        uploadImg.upload(image: myImageView.image!)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
    }
    
    //MARK: - Delegates
    internal func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]){
        
        var  chosenImage = UIImage()
        chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //2
        myImageView.contentMode = .scaleAspectFit //3
        myImageView.image = chosenImage //4
        dismiss(animated:true, completion: nil) //5
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}
