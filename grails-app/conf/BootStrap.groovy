import easysuite.*

class BootStrap {

	def grailsApplication

    def init = { servletContext ->
    	// Test data creation if database is empty

    	// Company data
    	if (!Company.count()) {
            new Company(
            		siret: "01010101010101",
            		name: "MyCompany",
            		website: "mycompa.ny",
            		address: "1, rue de la victoire",
            		city: "Lyon",
            		postalCode: "69001",
            		country: "France",
            		phone: "0404040404",
            		email: "contact@mycompa.ny"
            	).save(failOnError: true)
            new Company(
            		siret: "01010101010101",
            		name: "Ma petite entreprise",
            		website: "mapetiteentreprise.fr",
            		address: "200, rue de Bouiche",
            		city: "Paris",
            		postalCode: "75001",
            		country: "France",
            		phone: "0104040404",
            		email: "contact@mapetiteentreprise.fr"
            	).save(failOnError: true)
        }

        // User data
        def userPerCompany = grailsApplication.config.boostrap.userPerCompany
        if (!User.count() && userPerCompany>0) {
        	Company.list().each { company -> 
        		for (i in 1..userPerCompany) {
        			new User(
        					lastname: "user${i}",
        					firstname: "user${i}",
        					address: "1, place Carnot",
        					city: "Lyon",
        					postalCode: "69003",
        					country: "France",
        					phone: "0101010101",
        					email: "user2@email.com",
        					company: company
        			).save(failOnError: true)
        		} 
        	}
        }

        // Module data
        /*if (!Module.count()) {
        	new Module(name: "Planning", description: "").save(failOnError: true)
        	new Module(name: "Annuaire", description: "").save(failOnError: true)
        	new Module(name: "Facturation", description: "").save(failOnError: true)
        	new Module(name: "Todo list", description: "").save(failOnError: true)
        	new Module(name: "Partage de fichier", description: "").save(failOnError: true)
        }*/
	
    }
    def destroy = {
    }
}
