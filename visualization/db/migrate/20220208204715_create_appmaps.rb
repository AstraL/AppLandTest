class CreateAppmaps < ActiveRecord::Migration[7.0]
  def change
    create_table :appmaps do |t|
      t.string :path

      t.timestamps
    end
  end
end
