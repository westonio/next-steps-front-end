require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe '#session_expired?' do
    controller(SessionsController) do
      def index
        render plain: 'Home Page'
      end
    end
    
    context 'when session is active' do
      it 'returns false' do
        subject.session[:last_activity] = Time.now - 10.minutes
        expect(subject.send(:session_expired?)).to be false
      end
    end

    context 'when session is inactive' do
      it 'returns true' do
        subject.session[:last_activity] = Time.now - 30.minutes
        expect(subject.send(:session_expired?)).to be true
      end
    end

    context 'when session is not set' do
      it 'returns false' do
        subject.session[:last_activity] = nil
        expect(subject.send(:session_expired?)).to be false
      end
    end
  end
end



