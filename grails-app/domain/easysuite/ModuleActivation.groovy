package easysuite

class ModuleActivation {

	Module module
	Company company

	static belongsTo = [module: Module, company: Company]

    static constraints = { }
}
