TM.AuthenticatedRoute = Ember.Route.extend
	beforeModel: (transition)->
		if !@controllerFor('login').get('token')
			@redirectToLogin(transition)
	redirectToLogin: (transition)->
		loginController = @controllerFor 'login'
		loginController.set 'previousTransition', transition
		@transitionTo 'login'
	actions: {
		error: (error, transition) ->
			console.log error
			if error.status == 401
				@redirectToLogin(transition)
	}