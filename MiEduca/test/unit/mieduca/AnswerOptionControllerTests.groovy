package mieduca



import org.junit.*
import grails.test.mixin.*

@TestFor(AnswerOptionController)
@Mock(AnswerOption)
class AnswerOptionControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/answerOption/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.answerOptionInstanceList.size() == 0
        assert model.answerOptionInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.answerOptionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.answerOptionInstance != null
        assert view == '/answerOption/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/answerOption/show/1'
        assert controller.flash.message != null
        assert AnswerOption.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/answerOption/list'

        populateValidParams(params)
        def answerOption = new AnswerOption(params)

        assert answerOption.save() != null

        params.id = answerOption.id

        def model = controller.show()

        assert model.answerOptionInstance == answerOption
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/answerOption/list'

        populateValidParams(params)
        def answerOption = new AnswerOption(params)

        assert answerOption.save() != null

        params.id = answerOption.id

        def model = controller.edit()

        assert model.answerOptionInstance == answerOption
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/answerOption/list'

        response.reset()

        populateValidParams(params)
        def answerOption = new AnswerOption(params)

        assert answerOption.save() != null

        // test invalid parameters in update
        params.id = answerOption.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/answerOption/edit"
        assert model.answerOptionInstance != null

        answerOption.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/answerOption/show/$answerOption.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        answerOption.clearErrors()

        populateValidParams(params)
        params.id = answerOption.id
        params.version = -1
        controller.update()

        assert view == "/answerOption/edit"
        assert model.answerOptionInstance != null
        assert model.answerOptionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/answerOption/list'

        response.reset()

        populateValidParams(params)
        def answerOption = new AnswerOption(params)

        assert answerOption.save() != null
        assert AnswerOption.count() == 1

        params.id = answerOption.id

        controller.delete()

        assert AnswerOption.count() == 0
        assert AnswerOption.get(answerOption.id) == null
        assert response.redirectedUrl == '/answerOption/list'
    }
}
