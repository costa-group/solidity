contract C {
    bytes s = "abcdefghabcdefghabcdefghabcdefgha";

    function fromMemory(bytes memory m) public returns (bytes32) {
        return bytes32(m);
    }
    function fromCalldata(bytes calldata c) external returns (bytes32) {
        return bytes32(c);
    }
    function fromStorage() external returns (bytes32) {
        return bytes32(s);
    }
    function fromSlice(bytes calldata c) external returns (bytes32) {
        return bytes32(c[0:33]);
    }
}
// ====
// compileViaYul: also
// ----
// fromMemory(bytes): 0x20, 33, "abcdefghabcdefghabcdefghabcdefgh", "a" -> FAILURE, hex"4e487b71", 0x23
// fromCalldata(bytes): 0x20, 33, "abcdefghabcdefghabcdefghabcdefgh", "a" -> FAILURE, hex"4e487b71", 0x23
// fromStorage() -> FAILURE, hex"4e487b71", 0x23
// fromSlice(bytes): 0x20, 33, "abcdefghabcdefghabcdefghabcdefgh", "a" -> FAILURE, hex"4e487b71", 0x23
