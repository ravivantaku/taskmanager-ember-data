TM.UsersNewController = Ember.ObjectController.extend
	actions: {
		createUser: ->
			self = this
			newUser = @getProperties('userName', 'location', 'phoneNumber','email')
			newUser.createdAt = moment(faker.Date.recent(1)).format('L')
			newUser.isAdmin = 'false'
			newUser.collaborateProjects = ''
			newUser.projects = ''
			newUser.tasks = ''
			user = @store.createRecord 'user', newUser
			user.save().then (result)->
				self.transitionToRoute 'users'
		cancel: ->
			console.log 'canceled'
	}