TM.IndexRoute = Ember.Route.extend
	model: ()->
#		user = @modelFor 'application'
		@transitionTo 'login'