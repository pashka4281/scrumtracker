class Api::BaseController < ApplicationController
  wrap_parameters format: [:json]
  before_filter :authorize
end
