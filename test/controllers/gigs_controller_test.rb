require 'test_helper'

class GigsControllerTest < ActionController::TestCase
  setup do
    @gig = gigs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gigs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gig" do
    assert_difference('Gig.count') do
      post :create, gig: { chair_id: @gig.chair_id, end_date: @gig.end_date, job_number: @gig.job_number, rank_id: @gig.rank_id, room_id: @gig.room_id, start_date: @gig.start_date }
    end

    assert_redirected_to gig_path(assigns(:gig))
  end

  test "should show gig" do
    get :show, id: @gig
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gig
    assert_response :success
  end

  test "should update gig" do
    patch :update, id: @gig, gig: { chair_id: @gig.chair_id, end_date: @gig.end_date, job_number: @gig.job_number, rank_id: @gig.rank_id, room_id: @gig.room_id, start_date: @gig.start_date }
    assert_redirected_to gig_path(assigns(:gig))
  end

  test "should destroy gig" do
    assert_difference('Gig.count', -1) do
      delete :destroy, id: @gig
    end

    assert_redirected_to gigs_path
  end
end
