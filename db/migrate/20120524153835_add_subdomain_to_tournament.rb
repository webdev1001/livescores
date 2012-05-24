class AddSubdomainToTournament < ActiveRecord::Migration
  def change
    add_column :tournaments, :subdomain, :string
  end
end
