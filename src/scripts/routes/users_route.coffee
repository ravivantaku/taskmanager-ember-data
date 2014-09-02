TM.UsersRoute = TM.AuthenticatedRoute.extend
	model: ->
		self = this
		new Ember.RSVP.Promise (resolve,reject)->
			self.store.find('user').then (result)->
				console.log result
				resolve result
#	setupController: (controller, model)->
#		@_super()
#		controller.set 'model', model

