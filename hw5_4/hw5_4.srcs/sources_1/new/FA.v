`timescale 1ps/1ps

module FA (
    input iA,
    input iB,
    input iC,
    output oS,
    output oC
);
    assign oS=iA^iB^iC;
    assign oC=iA&iB|iA&iC|iB&iC;


endmodule