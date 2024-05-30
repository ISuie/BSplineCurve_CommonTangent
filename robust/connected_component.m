function [B2] = connected_component(B1)
    [result] = scan_connectedblock(B1);
    [B2] = merge_block(B1,result);
