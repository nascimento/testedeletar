class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable, :confirmable, :lockable, :timeoutable, :registerable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :nickname, :customer_id, :group_ids, :cpf, :cnpj
  
  validates_presence_of :nickname, :email, :name
  validates_presence_of :cpf, :unless => :cnpj?

  # Relations
  belongs_to :customer
  has_and_belongs_to_many :groups
  
  # Brazilian Rails
  usar_como_cpf :cpf
  usar_como_cnpj :cnpj
  
end
