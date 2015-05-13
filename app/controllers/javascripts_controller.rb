class JavascriptsController < ApplicationController
    def dynamic_states
        @states = State.all
    end
end
