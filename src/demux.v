module demux (
    input wire selec,
    input wire a,
    output wire x,
    output wire y
);

assign {x,y} = selec? {a,1'b0}:{1'b0,a};

endmodule

