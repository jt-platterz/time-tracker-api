class AddUserToEvents < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :user, foreign_key: true
  end

  def up
    Event.all.update_all(user_id: User.first.id)
  end
end
