package easysuite

import org.springframework.dao.DataIntegrityViolationException

class ModuleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [moduleInstanceList: Module.list(params), moduleInstanceTotal: Module.count()]
    }

    def create() {
        [moduleInstance: new Module(params)]
    }

    def save() {
        def moduleInstance = new Module(params)
        if (!moduleInstance.save(flush: true)) {
            render(view: "create", model: [moduleInstance: moduleInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'module.label', default: 'Module'), moduleInstance.id])
        redirect(action: "show", id: moduleInstance.id)
    }

    def show(Long id) {
        def moduleInstance = Module.get(id)
        if (!moduleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'module.label', default: 'Module'), id])
            redirect(action: "list")
            return
        }

        [moduleInstance: moduleInstance]
    }

    def edit(Long id) {
        def moduleInstance = Module.get(id)
        if (!moduleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'module.label', default: 'Module'), id])
            redirect(action: "list")
            return
        }

        [moduleInstance: moduleInstance]
    }

    def update(Long id, Long version) {
        def moduleInstance = Module.get(id)
        if (!moduleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'module.label', default: 'Module'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (moduleInstance.version > version) {
                moduleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'module.label', default: 'Module')] as Object[],
                          "Another user has updated this Module while you were editing")
                render(view: "edit", model: [moduleInstance: moduleInstance])
                return
            }
        }

        moduleInstance.properties = params

        if (!moduleInstance.save(flush: true)) {
            render(view: "edit", model: [moduleInstance: moduleInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'module.label', default: 'Module'), moduleInstance.id])
        redirect(action: "show", id: moduleInstance.id)
    }

    def delete(Long id) {
        def moduleInstance = Module.get(id)
        if (!moduleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'module.label', default: 'Module'), id])
            redirect(action: "list")
            return
        }

        try {
            moduleInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'module.label', default: 'Module'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'module.label', default: 'Module'), id])
            redirect(action: "show", id: id)
        }
    }
}
