class AngularStaticController < ApplicationController
  layout 'angular'

  def template
    render template: "angular/templates/#{params[:template]}"
  end
end
