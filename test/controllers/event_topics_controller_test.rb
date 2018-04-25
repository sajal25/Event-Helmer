require 'test_helper'

class EventTopicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_topic = event_topics(:one)
  end

  test "should get index" do
    get event_topics_url
    assert_response :success
  end

  test "should get new" do
    get new_event_topic_url
    assert_response :success
  end

  test "should create event_topic" do
    assert_difference('EventTopic.count') do
      post event_topics_url, params: { event_topic: { description: @event_topic.description, name: @event_topic.name } }
    end

    assert_redirected_to event_topic_url(EventTopic.last)
  end

  test "should show event_topic" do
    get event_topic_url(@event_topic)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_topic_url(@event_topic)
    assert_response :success
  end

  test "should update event_topic" do
    patch event_topic_url(@event_topic), params: { event_topic: { description: @event_topic.description, name: @event_topic.name } }
    assert_redirected_to event_topic_url(@event_topic)
  end

  test "should destroy event_topic" do
    assert_difference('EventTopic.count', -1) do
      delete event_topic_url(@event_topic)
    end

    assert_redirected_to event_topics_url
  end
end
