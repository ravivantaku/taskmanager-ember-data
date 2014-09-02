TM.TaskEditRoute  = Ember.Route.extend
	model: (params) -> @modelFor 'task'
	setupController: (controller, model) ->
		controller.set 'model', model

#		controller.set 'users', @store.find('user')

