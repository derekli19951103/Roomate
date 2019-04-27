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
    
    func fetchLocalRooms() -> [Room] {
        let request: NSFetchRequest<Room> = Room.fetchRequest()
        
        return try! self.dataStack.viewContext.fetch(request)
    }
    
    func fetchLocalRequestedRooms() -> [Request_Room] {
        let request: NSFetchRequest<Request_Room> = Request_Room.fetchRequest()
        
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
    
    func get_rooms(completion: @escaping (_ result: VoidResult) -> ()) {
        let user_id = fetchLocalUsers()[0].id
        self.networking.get("/\(user_id)/rooms") { result in
            switch result {
            case .success(let response):
                self.dataStack.sync(response.arrayBody, inEntityNamed: Room.entity().name!) { error in
                    completion(.success)
                }
            case .failure(let response):
                completion(.failure(response.error))
            }
        }
    }
    
    func get_requested_rooms(completion: @escaping (_ result: VoidResult) -> ()) {
        let user_id = fetchLocalUsers()[0].id
        self.networking.get("/\(user_id)/requested_rooms") { result in
            switch result {
            case .success(let response):
                self.dataStack.sync(response.arrayBody, inEntityNamed: Request_Room.entity().name!) { error in
                    completion(.success)
                }
            case .failure(let response):
                completion(.failure(response.error))
            }
        }
    }
    
    func updateUser(user: User, completion: @escaping (_ result: VoidResult) -> ()) {
        let user_id = fetchLocalUsers()[0].id
        self.networking.put("/\(user_id)/update", parameters: user.export()) { result in
            switch result {
            case .success(let response):
                self.dataStack.sync(response.arrayBody, inEntityNamed: User.entity().name!) { error in
                    completion(.success)
                }
            case .failure(let response):
                completion(.failure(response.error))
            }
        }
    }
    
    func create_room(info: [String:Any], completion: @escaping (_ result: VoidResult) -> ()) {
        let user_id = fetchLocalUsers()[0].id
        self.networking.put("/\(user_id)/create_room", parameters: info) { result in
            switch result {
            case .success(let response):
                self.dataStack.sync(response.arrayBody, inEntityNamed: Room.entity().name!) { error in
                    completion(.success)
                }
            case .failure(let response):
                completion(.failure(response.error))
            }
        }
    }
    
    func request_room(room_id: Int64, completion: @escaping (_ result: VoidResult) -> ()) {
        let user_id = fetchLocalUsers()[0].id
        self.networking.put("/\(user_id)/request_room/\(room_id)") { result in
            switch result {
            case .success(let response):
                self.dataStack.sync(response.arrayBody, inEntityNamed: Request_Room.entity().name!) { error in
                    completion(.success)
                }
            case .failure(let response):
                completion(.failure(response.error))
            }
        }
    }
    
    func exit_room(room_id: Int64, completion: @escaping (_ result: VoidResult) -> ()) {
        let user_id = fetchLocalUsers()[0].id
        self.networking.put("/\(user_id)/exit_room/\(room_id)") { result in
            switch result {
            case .success(let response):
                self.dataStack.sync(response.arrayBody, inEntityNamed: Room.entity().name!) { error in
                    completion(.success)
                }
            case .failure(let response):
                completion(.failure(response.error))
            }
        }
    }
    
    func derequest_room(room_id: Int64, completion: @escaping (_ result: VoidResult) -> ()) {
        let user_id = fetchLocalUsers()[0].id
        self.networking.put("/\(user_id)/derequest_room/\(room_id)") { result in
            switch result {
            case .success(let response):
                self.dataStack.sync(response.arrayBody, inEntityNamed: Request_Room.entity().name!) { error in
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
