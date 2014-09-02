TM.UserCollaborateProjectsRoute = Ember.Route.extend
	model: ()-> @modelFor('user').get 'collaborateProjects'
	setupController: (controller,model)->
		@_super()
		controller.set 'content', model
		controller.set 'user', @modelFor('user')