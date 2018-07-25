require_relative '../views/session_view.rb'
require_relative '../models/employee.rb'

class SessionsController
  def initialize(repo)
    @repo = repo
    @view = SessionView.new
  end

  def sign_in
    username = @view.ask_for('username')
    employee = @repo.find_by_username(username)

    password = @view.ask_for('password')
    if employee && employee.password?(password)
      @view.succesful_sign_in(username)
      employee
    else
      @view.incorrect_password
      sign_in
    end
  end
end
