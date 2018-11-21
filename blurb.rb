# Yeah
class Blurb
  attr_accessor :content, :time, :mood

  def initialize(mood, content = '')
    @time    = Time.now
    @content = content[0..39]
    @mood    = mood
  end
end

class Blurbalizer
  def initialize(title)
    @title  = title
    @blurbs = [] # A fresh clean array for storing Blurbs
  end

  def add_a_blurb(mood, content)
    # The << means add to the end of the array
    @blurbs << Blurb.new(mood, content)
  end

  def show_timeline
    puts "Blurbify: #{@title} has #{@blurbs.count} Blurbs"

    @blurbs.sort_by(&:time).reverse_each { |t|
      puts "#{t.content.ljust(40)} #{t.time}"
    }
  end
end

myapp = Blurbalizer.new "The Big Blurb"
myapp.add_a_blurb(:kinky, "Noice")
myapp.show_timeline()