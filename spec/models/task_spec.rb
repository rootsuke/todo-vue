require 'rails_helper'

RSpec.describe Task, type: :model do
  let!(:task) { create(:task) }

  it "is invalid without a name" do
    task.name = nil
    task.valid?
    expect(task.errors[:name]).to include "can't be blank"
  end
end
