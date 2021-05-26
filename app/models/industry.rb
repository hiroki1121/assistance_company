class Industry < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '農林水産' },
    { id: 3, name: '製造' },
    { id: 4, name: '建設、インフラ' },
    { id: 5, name: '情報通信' },
    { id: 6, name: '卸売、小売' },
    { id: 7, name: '金融、保険、不動産' },
    { id: 8, name: '専門・技術サービス' },
    { id: 9, name: '宿泊、飲食' },
    { id: 10, name: '生活関連サービス、娯楽' },
    { id: 11, name: '教育、学習支援' },
    { id: 12, name: '医療、福祉' },
    { id: 13, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :posts
end
