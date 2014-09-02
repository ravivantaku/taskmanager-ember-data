TM.TaskEditController = Ember.ObjectController.extend
	needs: ['application']
	loginUser: Ember.computed.alias 'controllers.application.loginUser'
	actions:
		updateTask: ->
			self = this
			task = @get('model')
			task.save().then (result)->
				self.transitionToRoute 'task', task.id
		cancel: ->
			task = @get 'model'
			task.rollback()
			@transitionToRoute 'task', task.id

