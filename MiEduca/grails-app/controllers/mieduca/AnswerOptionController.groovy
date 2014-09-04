package mieduca

import org.springframework.dao.DataIntegrityViolationException

class AnswerOptionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [answerOptionInstanceList: AnswerOption.list(params), answerOptionInstanceTotal: AnswerOption.count()]
    }

    def create() {
        [answerOptionInstance: new AnswerOption(params)]
    }

    def save() {
        def answerOptionInstance = new AnswerOption(params)
        if (!answerOptionInstance.save(flush: true)) {
            render(view: "create", model: [answerOptionInstance: answerOptionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'answerOption.label', default: 'AnswerOption'), answerOptionInstance.id])
        redirect(action: "show", id: answerOptionInstance.id)
    }

    def show(Long id) {
        def answerOptionInstance = AnswerOption.get(id)
        if (!answerOptionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'answerOption.label', default: 'AnswerOption'), id])
            redirect(action: "list")
            return
        }

        [answerOptionInstance: answerOptionInstance]
    }

    def edit(Long id) {
        def answerOptionInstance = AnswerOption.get(id)
        if (!answerOptionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'answerOption.label', default: 'AnswerOption'), id])
            redirect(action: "list")
            return
        }

        [answerOptionInstance: answerOptionInstance]
    }

    def update(Long id, Long version) {
        def answerOptionInstance = AnswerOption.get(id)
        if (!answerOptionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'answerOption.label', default: 'AnswerOption'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (answerOptionInstance.version > version) {
                answerOptionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'answerOption.label', default: 'AnswerOption')] as Object[],
                          "Another user has updated this AnswerOption while you were editing")
                render(view: "edit", model: [answerOptionInstance: answerOptionInstance])
                return
            }
        }

        answerOptionInstance.properties = params

        if (!answerOptionInstance.save(flush: true)) {
            render(view: "edit", model: [answerOptionInstance: answerOptionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'answerOption.label', default: 'AnswerOption'), answerOptionInstance.id])
        redirect(action: "show", id: answerOptionInstance.id)
    }

    def delete(Long id) {
        def answerOptionInstance = AnswerOption.get(id)
        if (!answerOptionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'answerOption.label', default: 'AnswerOption'), id])
            redirect(action: "list")
            return
        }

        try {
            answerOptionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'answerOption.label', default: 'AnswerOption'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'answerOption.label', default: 'AnswerOption'), id])
            redirect(action: "show", id: id)
        }
    }
}
