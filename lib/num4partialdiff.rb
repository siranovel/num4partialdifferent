require 'ffi'
require 'ffi-compiler/loader'
require 'fiddle'


#
# 数値計算によ一次偏微分方程式の解法するライブラリ
module Num4PartialDiffLib
    extend FFI::Library

    ffi_lib FFI::Compiler::Loader.find('num4partialdiff')
    attach_function :finiteDiffMethodFFI,
        :CNum4PartialDiff_finiteDiffMethod,[:int, :buffer_in, :double, :buffer_in], :pointer
    class << self
        #
        # @private
        class Counter
            @idx = 0
            def self.getIdx
                return @idx
            end
            def self.countup
               @idx = @idx + 1
            end
        end
        # 有限差分法による数値計算
        #
        # @overload finiteDiffMethod(yi, x0, h, func)
        #   @param [double[]] yi 各変数の値
        #   @param [double[]] x0 各変数の初期値
        #   @param [double] h  刻み幅
        #   @param [callback] func xiに対する傾きを計算する関数
        #   @return [double[]] x0+nhに対するfi_1の値(配列)
        # @example
        #   yi = [0.0, 0.0, 0.0]
        #   x0 = [0.0, 0.0, 0.0]
        #   h = 0.001
        #   func = Proc.new do | n, xi |
        #     f = 2 * xi[0] + 3 * xi[1] + 4 * xi[2] + 5
        #     next f
        #   end
        #   yi_1 = Num4PartialDiffLib.finiteDiffMethod(yi, x0, h, func)
        # @note 各変数の刻み幅は、一定です。
        # 
        def finiteDiffMethod(yi, x0, h, func)
            n = yi.size
            fi_ptr = calcVectFi(n, x0, h, func)
            yi_ptr = cnvRbAry2pt(n, yi)
            yi_1_ptr = finiteDiffMethodFFI(n, yi_ptr, h, fi_ptr)
            yi_1 = cnvPt2RbAry(n, yi_1_ptr)
            return yi_1
        end
        #
        # @private
        def cnvRbAry2pt(n, ary)
            yi_ptr = FFI::MemoryPointer.new(:double, n)
            n.times.map { |i|
                yi_ptr.put_double(i * Fiddle::SIZEOF_DOUBLE, ary[i].to_f)
            }
            return yi_ptr   
        end
        #
        # @private
        def cnvPt2RbAry(n, pt)
          rbAry = n.times.map { |i|
             pt.get_double(i * Fiddle::SIZEOF_DOUBLE)
          }
          return rbAry  
        end
        #
        # @private
        def calcVectFi(n, x0, h, func)
            xi = []
            fi_ptr = FFI::MemoryPointer.new(:double, n)
            idx = Counter.getIdx()
            n.times.map { |i|
                xi = x0
                xi[i] = x0[i] + idx * h
                fi_ptr.put_double(i * Fiddle::SIZEOF_DOUBLE, func.call(n, xi))
            }
            Counter.countup
            return fi_ptr
        end

        private :cnvRbAry2pt
        private :cnvPt2RbAry
        private :calcVectFi
        private :finiteDiffMethodFFI
    end
end

