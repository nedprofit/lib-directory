# frozen_string_literal: true

require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get books_show_url
    assert_response :success
  end

  test "should get characters" do
    get books_characters_url
    assert_response :success
  end

  test "should get staff" do
    get books_staff_url
    assert_response :success
  end

  test "should get screenshots" do
    get books_screenshots_url
    assert_response :success
  end

  test "should get videos" do
    get books_videos_url
    assert_response :success
  end

  test "should get related" do
    get books_related_url
    assert_response :success
  end

  test "should get chronology" do
    get books_chronology_url
    assert_response :success
  end

  test "should get art" do
    get books_art_url
    assert_response :success
  end
end
