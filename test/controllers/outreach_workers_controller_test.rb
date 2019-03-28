require 'test_helper'

class OutreachWorkersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @outreach_worker = outreach_workers(:one)
  end

  test "should get index" do
    get outreach_workers_url
    assert_response :success
  end

  test "should get new" do
    get new_outreach_worker_url
    assert_response :success
  end

  test "should create outreach_worker" do
    assert_difference('OutreachWorker.count') do
      post outreach_workers_url, params: { outreach_worker: { organization: @outreach_worker.organization, user_id: @outreach_worker.user_id } }
    end

    assert_redirected_to outreach_worker_url(OutreachWorker.last)
  end

  test "should show outreach_worker" do
    get outreach_worker_url(@outreach_worker)
    assert_response :success
  end

  test "should get edit" do
    get edit_outreach_worker_url(@outreach_worker)
    assert_response :success
  end

  test "should update outreach_worker" do
    patch outreach_worker_url(@outreach_worker), params: { outreach_worker: { organization: @outreach_worker.organization, user_id: @outreach_worker.user_id } }
    assert_redirected_to outreach_worker_url(@outreach_worker)
  end

  test "should destroy outreach_worker" do
    assert_difference('OutreachWorker.count', -1) do
      delete outreach_worker_url(@outreach_worker)
    end

    assert_redirected_to outreach_workers_url
  end
end
