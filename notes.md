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
    avatar:text
    #Tribe dictates (all speed), physical strength, magical strength, defense)

Adventure

    Belongs_to :user
    Has_many :characters

    Title:string
    Flavor:text
    completed:boolean

user_character GET users/:id/characters = index
get users/:id/characters/new =

get adventure/
