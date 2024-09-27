class User
    attr_accessor :name, :email, :password
  
    def initialize(name, email, password)
      @name = name
      @email = email
      @password = password
      @rooms = []  
    end
  
    
    def enter_room(room)
      @rooms << room unless @rooms.include?(room)
      room.add_user(self)
      puts "#{@name} has entered the room: #{room.name}"
    end
  
    
    def send_message(room, content)
      message = Message.new(self, room, content)
      room.broadcast(message)
    end
  
    
    def acknowledge_message(room, message)
      puts "#{@name} acknowledges the message: '#{message.content}' from #{room.name}"
    end
  end
  
  
class Room
    attr_accessor :name, :description, :users
  
    def initialize(name, description)
      @name = name
      @description = description
      @users = []  
    end
  
    
    def add_user(user)
      @users << user unless @users.include?(user)
    end
  
    
    def broadcast(message)
      puts "Broadcasting message in room #{name}: '#{message.content}'"
      @users.each do |user|
        user.acknowledge_message(self, message)
      end
    end
  end
  
  
class Message
    attr_accessor :user, :room, :content
  
    def initialize(user, room, content)
      @user = user
      @room = room
      @content = content
    end
  end
  
  
user1 = User.new("Alice", "alice@gmail.com", "123")
user2 = User.new("Bob", "bob@gmail.com", "456")
room1 = Room.new("General", "This is general room.")
user1.enter_room(room1)
user2.enter_room(room1)
user1.send_message(room1, "Hello everyone!")



  
