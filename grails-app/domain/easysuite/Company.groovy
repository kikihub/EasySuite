package easysuite

class Company {

    String siret
    String name
    String website
    String address
    String city
    String postalCode
    String country
    String phone
    String email

    static hasMany = [users: User, moduleActivates: ModuleActivation]

    static constraints = {
    	siret matches: "[0-9]{14}"
    	phone matches: "[0-9]{10}"
    	email email: true
    }
}
