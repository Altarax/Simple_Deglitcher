# Simple_Deglitcher
Simple deglitcher in VHDL. Used in professional project, I keep this in my github for futur needs.

## How to use it
To create the component in your projet, you can use this example :
```vhdl
    deglitching_signal: Deglitcher
        generic map (
            O_active => 
        )
        port map (
            input =>  ,
            clk => ,
            reset => ,
            output => ,
            n_output => 
        );
```

## Doxygen
