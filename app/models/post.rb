class Post < ApplicationRecord
  #文字数制限と、空の投稿を禁止するバリデーション
  validates :content, {presence: true,length:{maximum:140}}
end
