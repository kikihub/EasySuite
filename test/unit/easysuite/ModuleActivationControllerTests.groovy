package easysuite



import org.junit.*
import grails.test.mixin.*

@TestFor(ModuleActivationController)
@Mock(ModuleActivation)
class ModuleActivationControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/moduleActivation/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.moduleActivationInstanceList.size() == 0
        assert model.moduleActivationInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.moduleActivationInstance != null
    }

    void testSave() {
        controller.save()

        assert model.moduleActivationInstance != null
        assert view == '/moduleActivation/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/moduleActivation/show/1'
        assert controller.flash.message != null
        assert ModuleActivation.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/moduleActivation/list'

        populateValidParams(params)
        def moduleActivation = new ModuleActivation(params)

        assert moduleActivation.save() != null

        params.id = moduleActivation.id

        def model = controller.show()

        assert model.moduleActivationInstance == moduleActivation
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/moduleActivation/list'

        populateValidParams(params)
        def moduleActivation = new ModuleActivation(params)

        assert moduleActivation.save() != null

        params.id = moduleActivation.id

        def model = controller.edit()

        assert model.moduleActivationInstance == moduleActivation
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/moduleActivation/list'

        response.reset()

        populateValidParams(params)
        def moduleActivation = new ModuleActivation(params)

        assert moduleActivation.save() != null

        // test invalid parameters in update
        params.id = moduleActivation.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/moduleActivation/edit"
        assert model.moduleActivationInstance != null

        moduleActivation.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/moduleActivation/show/$moduleActivation.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        moduleActivation.clearErrors()

        populateValidParams(params)
        params.id = moduleActivation.id
        params.version = -1
        controller.update()

        assert view == "/moduleActivation/edit"
        assert model.moduleActivationInstance != null
        assert model.moduleActivationInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/moduleActivation/list'

        response.reset()

        populateValidParams(params)
        def moduleActivation = new ModuleActivation(params)

        assert moduleActivation.save() != null
        assert ModuleActivation.count() == 1

        params.id = moduleActivation.id

        controller.delete()

        assert ModuleActivation.count() == 0
        assert ModuleActivation.get(moduleActivation.id) == null
        assert response.redirectedUrl == '/moduleActivation/list'
    }
}
