TM.IndexRoute = Ember.Route.extend
	model: ()->
		user = @modelFor 'application'
		@transitionTo 'projects', user.id