require 'test_helper'

class JobPostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @job_post = JobPost.new(job_title: "Example",
                         job_location: "User",
                         job_description: "exampleuser",
                         company_name: "ABC Inc",
                         company_description: "ABC Inc is a company",
                         company_website: "www.abc.com",
                         rates: 50000,
                         user_id: 1,
                         city_id: 1)
  end

  test "should be valid" do
    assert @job_post.valid?
  end

  test "job title should be present" do
    @job_post.job_title = ""
    assert_not @job_post.valid?
  end

  test "job location should be present" do
    @job_post.job_location = ""
    assert_not @job_post.valid?
  end

  test "company name should be present" do
    @job_post.company_name = ""
    assert_not @job_post.valid?
  end

  test "rates should be present and not less than 0" do
    @job_post.rates = ""
    assert_not @job_post.valid?
    @job_post.rates = -1
    assert_not @job_post.valid?
  end

  test "order should be most recent first" do
    assert_equal job_posts(:most_recent), JobPost.first
  end



end
