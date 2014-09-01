TM.ProjectsRoute = Ember.Route.extend
	model: (params)-> @store.find('project').then (result)->
		console.log result
		result
#	setupController: (controller, model)->
#		@_super()
#		controller.set 'model', model
#		controller.set 'user', @modelFor('user')