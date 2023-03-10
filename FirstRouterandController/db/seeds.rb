# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ApplicationRecord.transaction do

  puts "destroying table"
  User.destroy_all
  ArtWork.destroy_all
  ArtworkShare.destroy_all
  Comment.destroy_all

  puts "resetting ID sequences"
  %w(users art_works artwork_shares comments).each do |table|
    ApplicationRecord.connection.reset_pk_sequence!(table)
  end

  puts "creating seed data"
  u1 = User.create(:username => 'PabloPicaso')
  u2 = User.create(:username => 'MichaelAngelo')
  art1 = ArtWork.create(:title => 'La Vie', :image_url => 'https://www.pablopicasso.org/images/la-vie-photo.jpg', :artist_id => u1.id )
  art2 = ArtWork.create(:title => 'The creation of adam', :image_url => 'https://th-thumbnailer.cdn-si-edu.com/zvrroTVd9q3H_KQtNMAS9lGPayU=/fit-in/1600x0/https://tf-cmsv2-smithsonianmag-media.s3.amazonaws.com/filer/The-Creation-of-Adam-Michelangelo-631.jpg', :artist_id => u2.id )
  share1 = ArtworkShare.create(:art_work_id => art1.id, :viewer_id => u2.id )
  share2 = ArtworkShare.create(:art_work_id => art2.id, :viewer_id => u1.id )
  comment1 = Comment.create(:author_id => u1.id, :art_work_id => art2.id, :body => 'This stinks!!!')
  comment2 = Comment.create(:author_id => u2.id, :art_work_id => art1.id, :body => 'This is so beautiful!')
  like1 = Like.create(:user_id => u1.id, :art_work_id => art2.id)
end