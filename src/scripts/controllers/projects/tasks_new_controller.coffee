TM.ProjectNewTaskController = Ember.ObjectController.extend
	needs:['application']
	resetInputs: ->
		@setProperties
			title : ''
			priority : 'Major'
			description : ''
			estimatedTime: ''
			completionDate : moment(Faker.Date.recent(1)).format('L')
	actions:
		createTask: ->
			self = this
			task = @get 'content'
			id = @get('project').content.id
			task.set 'isResolved', false
			task.set 'creationDate', moment(faker.Date.recent(1)).format('L')
			task.save().then (result)->
				self.transitionToRoute 'project', id
#			ts = @store.createRecord 'task', newtask
#			@store.find('user', task.loginUser.id).then (user)->
#				ts.set 'userId', user
#				ts.set 'project', task.project
#				ts.save().then (result)->
#					console.log result
#					self.transitionToRoute 'project', task.project.id
		cancel: ->
			task = @get 'content'
			@transitionToRoute 'projectTasks', task.project