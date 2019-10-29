# require 'csv'

# # rake import:users
# namespace :import do
#   desc "Import posts from csv"

#   task users: :environment do
#     @path = File.join Rails.root, "db/csv/posts_data.csv"
#     puts "path: #{@path}"
#     list = []
#     CSV.foreach(path, headers: true) do |row|
#       list << {
#           id: row["id"],
#           title: row["title"],
#           user_image: row["user_image"],
#           title: row["title"],
#           genre: row["genre"],
#           content: row["content"],
#           user_id: row["user_id"],
#       }
#     end
#     puts "start to create posts data"
#     begin
#       Post.create!(list)
#       puts "completed!!"
#     rescue ActiveModel::UnknownAttributeError => invalid
#       puts "raised error : unKnown attribute "
#     end
#   end
# end