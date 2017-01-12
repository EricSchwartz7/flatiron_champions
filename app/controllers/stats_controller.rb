class StatsController < ApplicationController

  def global

    @wins = Battle.where.not(winner_id: nil).group(:winner_id).order(:winner_id).limit(5).count

      #loser is in a batte but not winner_id
    @losses = Battle.where.not(winner_id: nil)

    # @levels = Character.order(:xp).limit(5)

    #wins - losses

    # @kdr = @wins

    @users = User.count

    @characters = Character.count

    @battles_completed = Battle.where.not(winner_id: nil).count

    @battles_in_progress = Battle.where(winner_id: nil).count

    #merge chall and opponent

    def convert_char_to_type

    end


    @most_used_char = {}
    @challenger = Battle.where(accepted: true).group(:challenger_id).order(:challenger_id).count
    @challenger.each do |stat|
      if @most_used_char[Character.find(stat.first).char_type]
        @most_used_char[Character.find(stat.first).char_type] += stat.last
      else
        @most_used_char[Character.find(stat.first).char_type] = stat.last
      end
    end

    @opponent = Battle.where(accepted: true).group(:opponent_id).order(:opponent_id).count
    @opponent.each do |stat|
      if @most_used_char[Character.find(stat.first).char_type]
        @most_used_char[Character.find(stat.first).char_type] += stat.last
      else
        @most_used_char[Character.find(stat.first).char_type] = stat.last
      end
    end

    @most_used_char = @most_used_char.sort_by {|key, value| value}.reverse

    @most_used_ability = Move.group(:character_ability_id).order(:character_ability_id).count
  end

  def user

  end

end
