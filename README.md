num4partialdifferent
====================
数値計算による偏微分微分方程式を解くFFI

## decscription ##

詳細は、https://siranovel.github.io/mydocs/num4partidifferent  

## Demo ##

## VS. ##

## Requirement ##

ruby FFI-compilerライブラリ

## Usage ##

sample/spec内の各ファイル参照

## install ##

From rubygems:  
~~~
    [sudo] gem install num4partialdiff
~~~

Install via Gemfile:  
~~~
source "https://rubygems.pkg.github.com/siranovel" do
    gem "num4partialdiff"
end
~~~

or from the git repository on github:  
~~~
    git clone https://github.com/siranovel/num4partialdifferent.git  
    cd num4partialdifferent  
    jruby -S gem build num4partialdiff.gemspec
    jruby -S gem install num4partialdiff
~~~

## Contribution ##

## Licence ##
[MIT](LICENSE)

## Author ##

[siranovel](https://github.com/siranovel)
