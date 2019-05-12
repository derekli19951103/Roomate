import CoreData
import Sync
import Networking

class UserService {
    private let dataStack: DataStack

    private lazy var networking: Networking = {
        Networking(baseURL: "http://localhost:8080/user")
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
    
    func getRooms(completion: @escaping (_ result: VoidResult) -> ()) {
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
    
    func register(info: [String:Any], completion: @escaping (_ result: VoidResult) -> ()) {
        self.networking.post("/register", parameters: info) { result in
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
                let user = response.dictionaryBody
                if(user.count != 0){
                    self.dataStack.sync([response.dictionaryBody], inEntityNamed: User.entity().name!) { error in
                        completion(.success)
                    }
                }else{
                    completion(.failure(NSError(domain: "Email and password doesn't match", code: 0, userInfo: nil)))
                }
            case .failure(let response):
                completion(.failure(response.error))
            }
        }
    }
    
    func createRoom(info: [String:Any], completion: @escaping (_ result: VoidResult) -> ()) {
        let user_id = fetchLocalUsers()[0].id
        self.networking.post("/\(user_id)/room", parameters: info) { result in
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
    
    func createExpense(info:[String:Any], room_id: Int64, all_users: [Int64], completion: @escaping (_ result: VoidResult) -> ()) {
        let user_id = 1
        let all_user_list = all_users.map{ String($0)}
        let all_user_str = all_user_list.joined(separator: ",")
        self.networking.post("/\(user_id)/expense?room_id=\(room_id)&user_ids=\(all_user_str)", parameters: info) { result in
            switch result {
            case .success(let response):
                self.dataStack.sync(response.arrayBody, inEntityNamed: Expense.entity().name!) {
                    error in completion(.success)
                }
            case .failure(let response):
                completion(.failure(response.error))
            }
        }
        
    }
    
    func requestRoom(room_id: Int64, completion: @escaping (_ result: VoidResult) -> ()) {
        let user_id = fetchLocalUsers()[0].id
        self.networking.post("/\(user_id)/request_room?room_id=\(room_id)") { result in
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
