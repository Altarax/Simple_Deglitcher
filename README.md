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
I'm using Doxygen for professionnal purposes and I'm trying to be more performant with this tool.  
It's not perfect, but I let you an example of doxygen comments. I didn't create  
a main file but you can use markdown : https://www.doxygen.nl/manual/markdown.html  
and in some times I'll create a repo to show how really we can use Doxygen for VHDL code.  

During my research to learn about Doxygen for VHDL code, I didn't find a lot of information  
about it and I'll do my best to fix it.  

For a nicer CSS on your Doxygen files : https://jothepro.github.io/doxygen-awesome-css/

## Improvments
If you can help me to be better and improve my VHDL codes or my comment, please don't hesitate to contact me.
