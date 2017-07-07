class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :members
  has_many :messages
  has_many :users,through: :members

  def show_last_message(group)
    if group.messages.present?
      message = group.messages.order('created_at DESC').find_by('id')
      if message.body.present?
        message.body
      elsif message.image.present?
        "画像が投稿されました。"
      end
    else
      "新着メッセージはありません。"
    end
  end

end
