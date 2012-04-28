task :integrate do
	require 'colored'
	APP = 'staging-app-name'

	def run(*cmd)
		system(*cmd)
		raise "Command #{cmd.inspect} failed!" unless $?.success?
	end

	puts '-----> Deploying to Staging'.green.bold
	run "git push git@heroku.com:#{APP}.git HEAD:master -f"

	puts '-----> Migrating'.green.bold
	run "heroku run rake db:migrate --app #{APP}"

	run "heroku run rake companies:push --app #{APP}"

	puts '-----> Restarting'.green.bold
	run "heroku restart --app #{APP}"
end