TM.LoginController = Ember.Controller.extend
	token: localStorage.getItem 'token'
	loginUser: JSON.parse localStorage.getItem('loginUser')
	previousTransition: null
	tokenChanged: ( ()->
		if Ember.isEmpty(@get('token'))
			localStorage.setItem 'token', ''
			localStorage.setItem 'loginUser', null
		else
			localStorage.setItem 'token', @get 'token'
			localStorage.setItem 'loginUser', JSON.stringify @get('loginUser')
		).observes('token')
	reset: ->
		@setProperties
			userName: ''
			password: ''
			token:    ''
			loginUser: null
	actions:{
		login: () ->
			self = this
			user = @getProperties 'userName', 'password'
			self.set 'errorMessage', null
			Ember.$.post('http://202.153.45.8/taskmanagement/account/Login', user).then ((result)->
				self.setProperties
					token : result.token
					loginUser : result.user
				previousTransition = self.get 'previousTransition'
				if previousTransition
					previousTransition.retry()
				else
					self.transitionToRoute 'projects', result.user.userName
				), (error) ->
					self.set 'errorMessage', ' Invalid username/password. please try again.'
	}