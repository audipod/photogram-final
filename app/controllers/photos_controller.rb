class PhotosController < ApplicationController
  skip_before_action(:authenticate_user!, { :only => [:index] })

  def index
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_at => :desc })
    render({ :template => "photo_templates/index" })

  end
  def show
    # Parameters: {"path_id" => "777"}

    url_id = params.fetch("path_id")

    matching_photos = Photo.where({ :id => url_id })

    @the_photo = matching_photos.at(0)

    render({ :template => "photo_templates/show" })

  end

  def destroy

    the_id = params.fetch("path_id")

    matching_photos = Photo.where({ :id => the_id })

    the_photo = matching_photos.at(0)

    the_photo.destroy

    #render({ :template => "photo_templates/destroy" })

    redirect_to("/photos")

  end

  def create

    @user.avatar = params.fetch(:avatar)

  input_image = params.fetch("query_image")
  input_caption = params.fetch("query_caption")
  input_owner_id = params.fetch("query_owner_id")

  a_new_photo = Photo.new

  a_new_photo.image = @user.avatar

  a_new_photo.caption = input_caption
  a_new_photo.owner_id = input_owner_id

  a_new_photo.save

    redirect_to("/photos/" + a_new_photo.id.to_s)

  end

  def update
    the_id = params.fetch("modify_id")

    matching_photos = Photo.where({ :id => the_id })

    the_photo = matching_photos.at(0)

    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")  

    the_photo.image = input_image
    the_photo.caption = input_caption

    the_photo.save

    #render({ :template => "photo_templates/update" })

    redirect_to("/photos/" + the_photo.id.to_s)

  end

  def create_comment

    the_id = params.fetch("modify_id")

    matching_photos = Photo.where({ :id => the_id })

    the_photo = matching_photos.at(0)

    input_image_id = params.fetch("query_image")
    input_owner_id = params.fetch("query_owner_id")
    input_comment = params.fetch("query_comment")

    a_new_comment = Comment.new

    a_new_comment.photo_id = input_image_id
    a_new_comment.author_id = input_owner_id
    a_new_comment.body = input_comment

    a_new_comment.save
    
    redirect_to("/photos/" + the_photo.id.to_s)
  end
end
