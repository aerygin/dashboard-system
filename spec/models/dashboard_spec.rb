require 'rails_helper'

RSpec.describe Dashboard, type: :model do
  context 'validation tests' do
    it 'ensures body is presence' do
      db = Dashboard.new(title: 'Some title').save
      expect(db).to eq(false)
    end
    it 'ensures title is presence' do
      db = Dashboard.new(body: 'Some body').save
      expect(db).to eq(false)
    end
    it 'ensures title is not shorter than 3' do
      db = Dashboard.new(body: 'Some body', title: '12').save
      expect(db).to eq(false)
    end
    it 'ensures title is not longer than 15' do
      db = Dashboard.new(body: 'Some body', title: '123456789123456789').save
      expect(db).to eq(false)
    end
    it 'ensures body is not longer than 3' do
      db = Dashboard.new(body: 'S', title: 'Title!').save
      expect(db).to eq(false)
    end
  end
end
