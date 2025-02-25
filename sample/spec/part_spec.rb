require 'spec_helper'
require 'num4partialdiff'

RSpec.describe Num4PartialDiffLib do
    before do
        @y0 = [0.0, 0.0, 0.0]
        @x0 = [0.0, 0.0, 0.0]
        @h = 0.001
        @func = Proc.new do | n, xi |
          f = 2 * xi[0] + 3 * xi[1] + 4 * xi[2] + 5
          next f
        end
    end
    it '#finiteDiffMethod' do
        yi = @y0
        yi_1 = []
        0.step(1, @h) { |x|
            yi_1 = Num4PartialDiffLib.finiteDiffMethod(yi, @x0, @h, @func)
            yi = yi_1
        }
        res = [1506.0045, 1507.5060, 1509.5080]
        expect(
            yi_1
        ).to is_rounds(res, 4)        
    end
end


