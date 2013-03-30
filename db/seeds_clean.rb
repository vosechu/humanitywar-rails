# encoding: UTF-8

# WhiteCard.create!(:text => "")

WhiteCard.create!(:text => "A chicken")
WhiteCard.create!(:text => "Interrupting cow")
WhiteCard.create!(:text => "A man")
WhiteCard.create!(:text => "Nantucket")
WhiteCard.create!(:text => "A priest")
WhiteCard.create!(:text => "An athiest")
WhiteCard.create!(:text => "A rabbi")


# BlackCard.create!(:text => "________", :blanks => 1)

BlackCard.create!(:text => "Why did ________ cross the road?", :blanks => 1)
BlackCard.create!(:text => "Knock, knock. Who's there? ________.", :blanks => 1)
BlackCard.create!(:text => "There once was a ________ from  ________", :blanks => 2)
BlackCard.create!(:text => "________, ________, and ________ walk into a bar.",
                  :blanks => 3)

p = Playa.create!(:user => 'blank@example.com')

b_length = BlackCard.count
w_length = WhiteCard.count

12.times do |i|
  e = Entry.new
  e.playa_id = p.id
  e.black_card_id = rand(b_length) + 1
  BlackCard.find(e.black_card_id).blanks.times do
      e.white_cards << WhiteCard.find(rand(w_length) + 1)
  end
  e.save!
end
