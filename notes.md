User

    Has_many :characters
    Has_many :adventures
    Has_many :undertook_adventures, through: :characters

    email:string
    password_digest:string
    admin:boolean

Character

    Belongs_to :user
    Belongs_to :adventure

    Name:string
    Tribe:string
    Image:string
    Level:integer

Adventure
Belongs_to :user
Has_many :characters
Has_many users, through:characters
  
 Title:string
Image:string
completed:boolean
