User Character

    has_many :characters                             belongs_to :user
                                                     has_many :battles
    has_many :adventures                             has_many :adventures, through: :battles

    email:string                                     name:string
    password_digest:string                           tribe:string
    admin:boolean                                    lv:integer
                                                     (Tribe and Lvl dictates likelihood of winning)

Adventure Battle

    belongs_to :user                                 belongs_to :charcter
    has_many :battles
    has_many :characters, through: :battles          belongs_to :adventure

    title:string
    boss
    flavor:text

    (hidden_fields)

    boss_lv:integer (2)
    clavat_difficulty:integer (2)
    lilty_difficulty:integer   (2)
    selkie_difficulty:integer   (2)
    yuke_difficulty:integer     (4)

battle instance methods:

    def dice_roll
        self.character.lv + rand(0..5)
    end

    def results
        if self.character.tribe == "Clavat"
            dice_roll >= self.adventure.clavat_difficulty ? level_up : game_over

        elsif self.character.tribe == "Lilty"
            dice_roll >= self.adventure.lilty_difficulty ? level_up : game_over

        elsif self.character.tribe == "Selkie"
            dice_roll >= self.adventure.selkie_difficulty ? level_up : game_over

        elsif self.character.tribe == "Yuke"
            dice_roll >= self.adventure.yuke_difficulty ? level_up : game_over
        end
    end

    def level_up
        if self.adventure.boss_lv >= self.character.lv
            new_lv = self.character.lv += 1
            self.character.update(:lv => new_lv)
            #message "You leveled up!"
        else
            #message "This adventure is no match for you now. Onward!"
        end
    end

    def game_over
        self.character.destroy
        redirect_to root_path
        #message "Game Over"
    end




    def update #for character controller
        @battle = Battle.new(:character_id => current_user.id, :adventure_id => params[:adventure_id])
        redirect_to root_path, :flash => @battle.results
    end
