class Post
    attr_accessor :username, :content, :comments, :likes
  
    def initialize(username, content)
      @username = username
      @content = content
      @comments = []
      @likes = 0
    end
  
    def add_comment(comment)
      @comments << comment
    end
  
    def like
      @likes += 1
    end
  
    def display
      puts "#{@username}: #{@content} (Likes: #{@likes})"
      @comments.each do |comment|
        puts "   Comment: #{comment}"
      end
    end
  end
  
  class Timeline
    def initialize
      @posts = []
    end
  
    def add_post(username, content)
      post = Post.new(username, content)
      @posts << post
    end
  
    def display_timeline
      @posts.reverse.each(&:display) # Tampilkan postingan terbaru terlebih dahulu
    end
  end
  
  # Simulasi penggunaan
  def main
    timeline = Timeline.new
  
    loop do
      puts "\nMenu:"
      puts "1. Buat Postingan"
      puts "2. Lihat Timeline"
      puts "3. Tambah Komentar"
      puts "4. Like Postingan"
      puts "5. Keluar"
  
      print "Pilih opsi (1-5): "
      choice = gets.chomp
  
      case choice
      when '1'
        print "Masukkan nama pengguna: "
        username = gets.chomp
        print "Masukkan konten postingan: "
        content = gets.chomp
        timeline.add_post(username, content)
        puts "Postingan berhasil ditambahkan!"
  
      when '2'
        puts "\nTimeline:"
        timeline.display_timeline
  
      when '3'
        print "Masukkan nomor postingan yang ingin dikomentari (1 - #{timeline.instance_variable_get(:@posts).size}): "
        index = gets.chomp.to_i - 1
        print "Masukkan komentar: "
        comment = gets.chomp
        if index.between?(0, timeline.instance_variable_get(:@posts).size - 1)
          timeline.instance_variable_get(:@posts)[index].add_comment(comment)
          puts "Komentar berhasil ditambahkan!"
        else
          puts "Nomor postingan tidak valid!"
        end
  
      when '4'
        print "Masukkan nomor postingan yang ingin disukai (1 - #{timeline.instance_variable_get(:@posts).size}): "
        index = gets.chomp.to_i - 1
        if index.between?(0, timeline.instance_variable_get(:@posts).size - 1)
          timeline.instance_variable_get(:@posts)[index].like
          puts "Postingan berhasil disukai!"
        else
          puts "Nomor postingan tidak valid!"
        end
  
      when '5'
        puts "Keluar dari program."
        break
  
      else
        puts "Pilihan tidak valid! Silakan pilih opsi yang benar."
      end
    end
  end
  
  main
