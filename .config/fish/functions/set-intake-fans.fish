function set-intake-fans
    for i in (seq 1 6)
        liquidctl -m "Commander Pro" set fan$i speed $argv;
    end
end
