TM.TasksRoute = Ember.Route.extend
	model: (params)-> @store.find('task').then (result)->
		console.log result
		result
	setupController: (controller, model)->
		controller.set 'model', model
		controller.set 'loginUser', @modelFor('application')