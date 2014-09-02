TM.ProjectEditController = Ember.ObjectController.extend
	actions: {
		updateProject: ->
			self = this
			project = @get('content')
			project.set 'name', @get('name')
			project.save().then (result)->
				self.transitionToRoute 'project', project.id
	}