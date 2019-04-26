import CoreData
import Sync
import Networking

class UserService {
    private let dataStack: DataStack

    private lazy var networking: Networking = {
        Networking(baseURL: "http://localhost:8080/userAPI")
    }()

    init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.dataStack = appDelegate.dataStack
    }

    func fetchLocalUsers() -> [User] {
        let request: NSFetchRequest<User> = User.fetchRequest()

        return try! self.dataStack.viewContext.fetch(request)
    }
    
    func register(user: [String:Any], completion: @escaping (_ result: VoidResult) -> ()) {
        self.networking.post("/register", parameters: user) { result in
            switch result {
            case .success(let response):
                self.dataStack.sync([response.dictionaryBody], inEntityNamed: User.entity().name!) { error in
                    completion(.success)
                }
            case .failure(let response):
                completion(.failure(response.error))
            }
        }
    }
    
    func login(info: [String:Any], completion: @escaping (_ result: VoidResult) -> ()) {
        self.networking.post("/login", parameters: info) { result in
            switch result {
            case .success(let response):
                self.dataStack.sync([response.dictionaryBody], inEntityNamed: User.entity().name!) { error in
                    completion(.success)
                }
            case .failure(let response):
                completion(.failure(response.error))
            }
        }
    }
}

enum VoidResult {
    case success
    case failure(NSError)
}
