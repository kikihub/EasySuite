package easysuite

class Module {

	String name
	String description

	static hasMany = [moduleActives: ModuleActivation]

    static constraints = { }
}
