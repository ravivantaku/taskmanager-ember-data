TM.ApplicationController = Ember.Controller.extend
	needs: ['login']
	user: ( ()->
		console.log @get('controllers.login.loginUser')
		@get('controllers.login.loginUser')
	).property('controllers.login.loginUser')
	isAuthenticated: ( ()-> !Ember.isEmpty(@get('controllers.login.loginUser')) ).property('controllers.login.loginUser')
	actions:
		logout: ->
			user = @get 'controllers.login'
			user.reset()
			@transitionToRoute 'login'
