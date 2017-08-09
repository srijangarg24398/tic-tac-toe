puts "Enter value of n for n x n matrix"
$r=gets.to_i
ox="o"
arr=Array.new(10) {Array.new(10) {}  }
def square a
	a*a
end
def set arr
	for i in 0...$r
		for j in 0...$r
			arr[i][j]=" "
		end
	end
end
#arr[3][3]='x'

def display arr
	for i in 0...$r
		print "  "
		for j in 0...$r
			print arr[i][j]
			print "  |  "
		end
		puts
		for i in 0...$r
		print "------"
		end
		puts
	end
end

def input val,arr
	puts "Enter the location"
	a=gets.chomp.to_i
	while a<1||a>$r
		puts "Invalid value try again"
		a=gets.chomp.to_i
	end
	b=gets.chomp.to_i
	while b<1||b>$r
		puts "Invalid value try again"
		b=gets.chomp.to_i
	end
	unless arr[a-1][b-1]==" "
		puts "! ! ! Already used"
		input val,arr
	else
		arr[a-1][b-1]=val
		display arr
	end
end

set arr

def check ox,arr
	#diagonals
	if arr[0][0]==ox
		ctr=0
		for i in 0...$r
			if arr[i][i]==ox
				ctr+=1
			end
		end
		if ctr==$r
			return true
		end
	end
	if arr[0][$r-1]==ox
		ctr=0
		for i in 0...$r
			if arr[i][$r-i-1]==ox
				ctr+=1
			end
		end
		if ctr==$r
			return true
		end
	end
	
	#rows
	for i in 0...$r
		if arr[i][0]==ox
			ctr=0
			for j in 0...$r
				if arr[i][j]==ox
					ctr+=1
				end
			end
			if ctr==$r
				return true
			end
		end
	end
	
	#columns
	for i in 0...$r
		if arr[0][i]==ox
			ctr=0
			for j in 0...$r
				if arr[j][i]==ox
					ctr+=1
				end
			end
			if ctr==$r
				return true
			end
		end
	end
	return false
end
hash={}
hash.default=0
winner=nil.to_s
kaku=square($r)
kaku.times do
	input ox,arr
	if check(ox,arr)==true
		winner=ox
		break
	else
		if ox=="o"
			ox="x"
		elsif ox=="x"
			ox="o"
		end
	end
end

unless winner==nil
player=nil.to_s
if winner=="o"
	player="Player 1"
elsif winner=="x"
	player="Player 2"
end

puts "The winner is #{winner.upcase} :=> #{player}"
puts winner.upcase
else 
puts "Draw"
end