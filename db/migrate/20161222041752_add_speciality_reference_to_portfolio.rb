class AddSpecialityReferenceToPortfolio < ActiveRecord::Migration[5.0]
  def change
    add_reference :portfolios, :speciality, index: true
  end
end
