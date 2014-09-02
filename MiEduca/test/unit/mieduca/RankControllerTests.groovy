package mieduca



import org.junit.*
import grails.test.mixin.*

@TestFor(RankController)
@Mock(Rank)
class RankControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/rank/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.rankInstanceList.size() == 0
        assert model.rankInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.rankInstance != null
    }

    void testSave() {
        controller.save()

        assert model.rankInstance != null
        assert view == '/rank/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/rank/show/1'
        assert controller.flash.message != null
        assert Rank.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/rank/list'

        populateValidParams(params)
        def rank = new Rank(params)

        assert rank.save() != null

        params.id = rank.id

        def model = controller.show()

        assert model.rankInstance == rank
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/rank/list'

        populateValidParams(params)
        def rank = new Rank(params)

        assert rank.save() != null

        params.id = rank.id

        def model = controller.edit()

        assert model.rankInstance == rank
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/rank/list'

        response.reset()

        populateValidParams(params)
        def rank = new Rank(params)

        assert rank.save() != null

        // test invalid parameters in update
        params.id = rank.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/rank/edit"
        assert model.rankInstance != null

        rank.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/rank/show/$rank.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        rank.clearErrors()

        populateValidParams(params)
        params.id = rank.id
        params.version = -1
        controller.update()

        assert view == "/rank/edit"
        assert model.rankInstance != null
        assert model.rankInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/rank/list'

        response.reset()

        populateValidParams(params)
        def rank = new Rank(params)

        assert rank.save() != null
        assert Rank.count() == 1

        params.id = rank.id

        controller.delete()

        assert Rank.count() == 0
        assert Rank.get(rank.id) == null
        assert response.redirectedUrl == '/rank/list'
    }
}
