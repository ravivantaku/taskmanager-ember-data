TM.UsersRoute = Ember.Route.extend
	model: -> @store.find 'user'
#	setupController: (controller, model)->
#		@_super()
#		controller.set 'model', model

#TM.UserSerializer = DS.RESTSerializer.extend
#	serializeHasMany: (record, json, relationship)->
#		key = relationship.key
#		if (key == 'tasks')
#			return
#		else
#			this._super.apply(this, arguments)
