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
    Level:integer

Adventure

    Belongs_to :user
    Has_many :characters

    Title:string
    requirements:text
    completed:boolean
