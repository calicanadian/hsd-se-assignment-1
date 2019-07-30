class UsersController < ApplicationController
  before_action :get_user, only: [:show, :update, :destroy, :add_friend, :add_rider, :remove_rider]
  before_action :show_riders, only: [:show, :add_rider, :remove_rider]
  before_action :show_rides, only: [:show]
  before_action :get_ride_history, only: [:show]
  before_action :get_repeating_rides, only: [:show]
  before_action :get_friends, only: [:show, :add_friend, :remove_friend]
  before_action :get_photo, only: [:show, :update]

  def index
    @users = User.order(:id).all
    render json: { users: @users }, status: :ok
  end

  # GET /users/:id
  def show
    if @user.blank?
      render json: {}, status: 404
    else
      render json: { user: @user }, status: :ok
    end
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save!
      render json: { user: @user }, status: :success
    else
      render json: { message: "Unable to create new user", errors: @user.errors }, status: 422
    end
  end

  # PATCH /users/:id
  def update
    if @user.update_attributes(user_params)
      render json: { user: @user }, status: :success
    else
      render json: { message: "Unable to update user", errors: @user.errors }, status: 422
    end
  end

  # DELETE /users/:id
  def destroy
    if @user.destroy
      render json: { message: "User destroyed" }, status: :ok
    else
      render json: { message: "Unable to destroy user" }, status: 422
    end
  end

  # POST /users/:id/friendships
  def add_friend
    @user = User.find(params[:id])
    @friend = User.find(params[:friend_id])
    if @user && @friend
      if Friendship.create!(user_id: @user.id, friend_id: @friend.id)
        render json: { message: "Friendship created", data: { user: @user, friend: @friend } }, status: :created
      else
        render json: { message: "There was a problem creating User Friendship", errors: Friendship.errors }, status: 422
      end
    else
      render json: { message: "User or Friend not found!" }, status: 404
    end
  end

  # DELETE /users/:id/friendships/:friend_id
  def remove_friend
    @user = User.find(params[:id])
    @friend = User.find(params[:friend_id])
    @friendship = Friendship.where(user_id: @user.id, friend_id: @friend.id).first
    if @friendship.blank?
      render json: { message: "Friendship not found, unable to remove friend" }, status: 422
    else
      if @friendship.destroy
        render json: { message: "Friendship destroyed" }, status: :ok
      else
        render json: { message: "Unable to destroy friendship", errors: @friendship.errors }, status: 422
      end
    end
  end

  # POST /users/:id/riders
  def add_rider
    @rider = Rider.new(rider_params)
    if @rider.save!
      if UserRider.create(user_id: @user.id, rider_id: @rider.id)
        render json: {
          user_rider: {
            user_id: @user.id,
            rider: {
              first_name: @rider.first_name,
              last_name: @rider.last_name,
              secret_word: @rider.secret_word,
              gender: @rider.gender,
              age: @rider.age
            }
          }
        }, status: :created
      else
        render json: { message: "Unable to set up rider association", errors: UserRider.errors }, status: 422
      end
    else
      render json: { message: "Unable to add Rider to account", errors: @rider.errors }, status: 422
    end
  end

  # DELETE /users/:id/riders/:rider_id
  def remove_rider
    @rider = Rider.find(params[:rider_id])
    if @rider.blank?
      render json: { message: "Unable to locate rider" }, status: 404
    else
      @user_rider = UserRider.where(user_id: @user.id, rider_id: @rider.id).first
      if @user_rider.blank?
        render json: { message: "Unable to locate that rider" }, status: 404
      else
        if @user_rider.destroy
          @rider.destroy
          render json: { message: "Rider Removed from Account" }, status: :ok
        else
          render json: { message: "Unable to remove rider at this time", error: @user_rider.errors }, status: 422
        end
      end
    end
  end

  private

  def get_user
    @user = User.find(params[:id])
  end

  def show_riders
    # @riders = @user.riders.all
  end

  def show_rides
    # @rides = @user.rides.all
  end

  def get_photo
    # @photo = @user.user_photo.last
  end

  def get_ride_history

  end

  def get_repeating_rides
    # @repeating_rides = @user.ride_repeater_frequencies.all
  end

  def get_friends
    # @friends = Friendship.where("user_id = #{@user.id} AND friend_id != #{@user.id}").all
  end

  def user_params
    params.require(:user).permit(:username, :email, :phone_number, :first_name, :last_name, :password, :password_confirmation)
  end

  def rider_params
    params.require(:rider).permit(:first_name, :last_name, :secret_word, :gender, :age, :photo_id)
  end

  def friend_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end
end
