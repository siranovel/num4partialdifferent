require 'num4partialdiff'

class Num4PartialDiffTest
    def initialize
        @y0 = [0.0, 0.0, 0.0]
        @x0 = [0.0, 0.0, 0.0]
        @h = 0.001
        @func = Proc.new do | n, xi |
          f = 2 * xi[0] + 3 * xi[1] + 4 * xi[2] + 5
          next f
        end
    end
    #
    # 有限差分法テスト
    def finiteDiffMethodTest
        yi = @y0
        yi_1 = []
        0.step(1, @h) { |x|
            yi_1 = Num4PartialDiffLib.finiteDiffMethod(yi, @x0, @h, @func)
            yi = yi_1
        }
        print "x=", yi_1[0]            # x=1506.0045
        print ","
        print "y=", yi_1[1]            # y=1507.5059999999994
        print ","
        print "z=", yi_1[2]            # z=1509.5079999999998
        puts
    end
end
tst = Num4PartialDiffTest.new
tst.finiteDiffMethodTest()
