
     
basediv = 1e7
minbet  = 0.00000001
basebet = balance / basediv
multi   = (1/3)+1
ct_lose = 0
mt_incr = 0
fn_strk = 0
profitc = 0
nextbet = basebet
chance  = 99/4
boost   = 0
 
resetstats()
function dobet()
    if bets%300==0 then resetseed() end
    profitc = profitc + currentprofit
    if profitc >= 0 then
        profitc = 0
        fn_strk = 0
    end
    if win then
        ct_lose = 0
        mt_incr = 0
        nextbet = basebet
        boost   = 0
    else
        ct_lose = ct_lose + 1
        mt_incr = mt_incr + 1
        iflose  = (multi + (mt_incr / 100))
        fn_strk = math.log((balance/basebet)*(iflose-1)+1)/math.log(iflose)
 
        if fn_strk > 40 then
            nextbet = previousbet * iflose
        else
            if ct_lose%3==0 then
                boost += 1
                nextbet = math.abs(profitc)/(23-boost) 
            end
        end
    end
    chance = 99/24
    print(fn_strk)
    if nextbet < minbet then nextbet = minbet end
end
