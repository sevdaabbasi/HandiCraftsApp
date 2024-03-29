
import Foundation
import Firebase

class FirebaseManager: NSObject, ObservableObject {
    let auth: Auth

    // Use a static property to hold the shared instance
    static let shared: FirebaseManager = {
        let instance = FirebaseManager()
        return instance
    }()
    

    // Private initializer to prevent additional instances
    private override init() {
        // Check if Firebase has been configured before
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }

        self.auth = Auth.auth()
        super.init()
    }
}

