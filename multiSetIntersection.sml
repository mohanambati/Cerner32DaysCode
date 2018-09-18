(* cerner_2^5_2018 *)
fun multiSetIntersection(xs) = 
	let
		fun member(x,[]) = false
		 |member(x,b::y) =
			if x=b then true
			else member(x,y)

		fun intersection(nil,nil) = nil
		|intersection(nil,ys) = nil
		|intersection(xs,nil) = nil
		|intersection(x::xs,y::ys) = if member(x,y::ys) then x::intersection(xs,y::ys) else intersection(xs,y::ys)

		fun multisets[] = nil
		|multisets(l::[]) = nil
		|multisets([]::l) = nil
		|multisets(x::l::ls) = intersection(x,l)

	in
		multisets(xs)
end;