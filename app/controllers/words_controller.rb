class WordsController < ApplicationController
    before_action :logged_in_user
      def create
        @word = current_user.words.build(word_params)
            if @word.save
              redirect_to root_url
              #link_to URI.escape("http://ejje.weblio.jp/content/#{@word.keyword}"), 
              #:onclick=>"window.open(this.href, 'height=400, width=800');return false;"
              #redirect_to URI.escape("http://ejje.weblio.jp/content/#{@word.keyword}"), target:"_blank"
            else
              @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc)
              render 'static_pages/home'
            end
      end
      
      private
      def word_params
        params.require(:word).permit(:keyword)
      end
end
