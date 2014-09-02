TM.TaskIndexController = Ember.ObjectController.extend
	needs: ['application']
	loginUser: Ember.computed.alias 'controllers.application.loginUser'
	actions:
		resolveTask: ->
			self = this
			task = @get('model')
			task.set 'isResolved', true
			task.set 'status', 'Resolved'
			console.log task
			task.save().then (result)->
				self.transitionToRoute 'tasks', self.get('loginUser').id
