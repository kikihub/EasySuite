package easysuite

class User {

	String lastname
	String firstname
	String address
	String city
	String postalCode
	String country
	String phone
	String email

	Company company

	static belongsTo = [company: Company]

    static constraints = {
    	company nullable: true
    	phone matches: "[0-9]{10}"
    	email email: true
    }
}
