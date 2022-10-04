module top_module(
    input clk,
    input areset,   
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right);
    
    reg present_state , next_state; // checks for left
    
    // present_state == 1 means he is moving left 
    // present_state == 0 means he is moving right 
    
    always @(posedge areset or posedge clk)begin
        if(areset) present_state<=1;
        else present_state<=next_state;
    end
    
    always@(*)begin
        case(present_state)
            1'b1 : next_state = (bump_left) ? 0 : 1;
            1'b0 : next_state = (bump_right) ? 1 : 0;
        endcase
    end
    
    
    assign walk_left = present_state;
    assign walk_right = ~present_state;
    
endmodule

