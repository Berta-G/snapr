# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


	Dir.glob(File.join(Rails.root, '/tmp/img', '*')).each do |path|
 		s = Snap.new(description: "This is #{path}", image: File.open(path), user_id: 1).save!
 	end
