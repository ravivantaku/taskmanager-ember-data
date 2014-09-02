TM.UserTasksRoute = Ember.Route.extend
	model: ->	@modelFor('user').get 'tasks'
	setupController: (controller,model)->
		@_super()
		controller.set 'content', model
		controller.set 'user', @modelFor('user')
