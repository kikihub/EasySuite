package easysuite

import org.springframework.dao.DataIntegrityViolationException

class ModuleActivationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [moduleActivationInstanceList: ModuleActivation.list(params), moduleActivationInstanceTotal: ModuleActivation.count()]
    }

    def create() {
        [moduleActivationInstance: new ModuleActivation(params)]
    }

    def save() {
        def moduleActivationInstance = new ModuleActivation(params)
        if (!moduleActivationInstance.save(flush: true)) {
            render(view: "create", model: [moduleActivationInstance: moduleActivationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'moduleActivation.label', default: 'ModuleActivation'), moduleActivationInstance.id])
        redirect(action: "show", id: moduleActivationInstance.id)
    }

    def show(Long id) {
        def moduleActivationInstance = ModuleActivation.get(id)
        if (!moduleActivationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'moduleActivation.label', default: 'ModuleActivation'), id])
            redirect(action: "list")
            return
        }

        [moduleActivationInstance: moduleActivationInstance]
    }

    def edit(Long id) {
        def moduleActivationInstance = ModuleActivation.get(id)
        if (!moduleActivationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'moduleActivation.label', default: 'ModuleActivation'), id])
            redirect(action: "list")
            return
        }

        [moduleActivationInstance: moduleActivationInstance]
    }

    def update(Long id, Long version) {
        def moduleActivationInstance = ModuleActivation.get(id)
        if (!moduleActivationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'moduleActivation.label', default: 'ModuleActivation'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (moduleActivationInstance.version > version) {
                moduleActivationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'moduleActivation.label', default: 'ModuleActivation')] as Object[],
                          "Another user has updated this ModuleActivation while you were editing")
                render(view: "edit", model: [moduleActivationInstance: moduleActivationInstance])
                return
            }
        }

        moduleActivationInstance.properties = params

        if (!moduleActivationInstance.save(flush: true)) {
            render(view: "edit", model: [moduleActivationInstance: moduleActivationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'moduleActivation.label', default: 'ModuleActivation'), moduleActivationInstance.id])
        redirect(action: "show", id: moduleActivationInstance.id)
    }

    def delete(Long id) {
        def moduleActivationInstance = ModuleActivation.get(id)
        if (!moduleActivationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'moduleActivation.label', default: 'ModuleActivation'), id])
            redirect(action: "list")
            return
        }

        try {
            moduleActivationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'moduleActivation.label', default: 'ModuleActivation'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'moduleActivation.label', default: 'ModuleActivation'), id])
            redirect(action: "show", id: id)
        }
    }
}
