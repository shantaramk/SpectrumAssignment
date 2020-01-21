
import Foundation
class CompanyModel : Codable {
    let _id : String?
    let name : String?
    let website : String?
    let logo : String?
    let about : String?
    var isfavorite : Bool = false
    var isfollwing : Bool = false
    let members : [Members]?

    enum CodingKeys: String, CodingKey {

        case _id = "_id"
        case name = "company"
        case website = "website"
        case logo = "logo"
        case about = "about"
        case members = "members"
    }

   required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        _id = try values.decodeIfPresent(String.self, forKey: ._id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        website = try values.decodeIfPresent(String.self, forKey: .website)
        logo = try values.decodeIfPresent(String.self, forKey: .logo)
        about = try values.decodeIfPresent(String.self, forKey: .about)
        members = try values.decodeIfPresent([Members].self, forKey: .members)
    }

}

class Members : Codable {
    let _id : String?
    let age : Int?
    let name : Name?
    let email : String?
    let phone : String?

    enum CodingKeys: String, CodingKey {

        case _id = "_id"
        case age = "age"
        case name = "name"
        case email = "email"
        case phone = "phone"
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        _id = try values.decodeIfPresent(String.self, forKey: ._id)
        age = try values.decodeIfPresent(Int.self, forKey: .age)
        name = try values.decodeIfPresent(Name.self, forKey: .name)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
    }

}

struct Name : Codable {
    let first : String?
    let last : String?

    enum CodingKeys: String, CodingKey {

        case first = "first"
        case last = "last"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        first = try values.decodeIfPresent(String.self, forKey: .first)
        last = try values.decodeIfPresent(String.self, forKey: .last)
    }

}
