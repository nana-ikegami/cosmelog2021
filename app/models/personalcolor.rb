class Personalcolor < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'イエベ春' },
    { id: 3, name: 'ブルベ夏' },
    { id: 4, name: 'イエベ秋' },
    { id: 5, name: 'ブルベ冬' },
    { id: 6, name: 'どなたにも似合う' },
  ]

  include ActiveHash::Associations
  has_many :cosmes
  end