module AngularController
  extend ActiveSupport::Concern

  included do
    respond_to :html, :json
    around_filter :without_root_in_json
  end

  def without_root_in_json
    # ActiveRecord::Base.include_root_in_json = false
    Mongoid.include_root_in_json = false
    yield
    Mongoid.include_root_in_json = true
  end
end
