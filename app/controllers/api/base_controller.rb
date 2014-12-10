class Api::BaseController < ApplicationController
  before_filter :authorize
end
