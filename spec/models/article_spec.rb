require 'rails_helper'

RSpec.describe Article, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:likes) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
