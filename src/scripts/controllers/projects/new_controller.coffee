TM.ProjectsNewController = Ember.ObjectController.extend
	needs: ['login']
	loginUser: Ember.computed.alias 'controllers.login.loginUser'
	actions: {
		createProject: ->
			self = this
			user = @get 'loginUser'
			console.log user
			project = @getProperties 'name','key','description'
			newProject =
				name: project.name
				owner:null
				description: project.description
				projectId: null
#				createdAt: moment(faker.Date.recent(1)).format('L')
			console.log newProject
			record = @store.createRecord 'project', newProject
#			project.set 'ownerId', user.userId
#			project.save().then (result)->
#					self.transitionToRoute 'projects', user.userName
#			project.save().then (result)->
#					self.transitionToRoute 'projects', user.userName
			@store.find('user', user.userId).then (user)->
				console.log user
				record.set 'ownerId', user
				record.save().then ((result)->
					console.log result
					self.transitionToRoute 'projects', user.userName), (error)->
						console.log error
		cancel: ->
			user = @get 'loginUser.user'
			@transitionToRoute 'projects', user.userName
	}
