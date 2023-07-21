#[starknet::interface]
trait simpleStorage<T> {
    fn store(ref self: T, value: u32);
    fn retrieve(self: @T) -> u32;
}

#[starknet::contract]
mod Storage {

    #[storage]
    struct Storage {
        val: u32,
    }

    #[external(v0)]
    impl simpleStorageImpl of super::simpleStorage<ContractState> {
        fn store(ref self: ContractState, value: u32){
            self.val.write(value);
        }

        fn retrieve(self: @ContractState) -> u32 {
            self.val.read()
        }
    }

}