class CreateZipCodes < ActiveRecord::Migration
  def change
    create_table :zip_codes do |t|

      t.timestamps
    end
  end
end
