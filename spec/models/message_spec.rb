require 'rails_helper'

describe Message do
  describe '#create' do
    it "is valid with both a body and a image" do
      message = build(:message)
      expect(message).to be_valid
    end

    it "is valid with a body" do
      message = build(:message, image:"")
      expect(message).to be_valid
    end

    it "is valid with a image" do
      message = build(:message, body: "")
      expect(message).to be_valid
    end

    it "is invalid without a body and a image" do
      message = build(:message, body: "",image: "")
      expect(message).to be_invalid
    end

    it "is invalid without a user_id" do
      message = build(:message, user_id: "")
      expect(message).to be_invalid
    end

    it "is invalid without a group_id" do
      message = build(:message, group_id: "")
      expect(message).to be_invalid
    end
  end
end
