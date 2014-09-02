TM.UserOwnProjectsRoute = Ember.Route.extend
	model: ->	@modelFor('user').get 'projects'
	setupController: (controller, model)->
		@_super()
		controller.set 'content', model
		controller.set 'user', @modelFor('user')