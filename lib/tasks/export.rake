namespace :export do
    desc "Prints Genre.all in a seeds.rb way."
    task :seeds_format => :environment do
      Genre.order(:id).all.each do |country|
        puts "Genre.create(#{genre.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
      end
    end
  end