TM.ProjectsRoute = TM.AuthenticatedRoute.extend
	model: (params)->
		self = this
		new Ember.RSVP.Promise (resolve,reject)->
				self.store.find('project').then (result)->
					console.log result
					resolve result
#	setupController: (controller, model)->
#		@_super()
#		controller.set 'model', model
#		controller.set 'user', @modelFor('user')