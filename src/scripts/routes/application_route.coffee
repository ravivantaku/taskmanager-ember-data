TM.ApplicationRoute = Ember.Route.extend
	model: -> new Ember.RSVP.Promise (resolve,reject)->
		Ember.$.post('http://192.168.0.105/taskmanagement/Users/Login', {userName: 'rajesh', password: 'Design_20'}).then (result)->
			console.log result
			window.localStorage.setItem('token', result.token)
			resolve result
	setupController: (controller, model)->
		@_super()
		controller.set 'model', model
		controller.set 'loginUser', model
