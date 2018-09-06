class AddEmployerToListing < ActiveRecord::Migration[5.2]
  def change
    add_reference :listings, :employer_profile, foreign_key: true
  end
end
