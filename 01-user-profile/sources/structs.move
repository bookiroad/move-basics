module move_basics::structs {
    use std::string::{String, utf8};
    use std::debug::{print};
    use std::signer;

    /// 사용자 프로필을 저장하는 구조체
    struct UserProfile has key {
        username: String,
        id: u64,
        is_verified: bool
    }

    /// 새로운 프로필을 생성하는 함수
    public entry fun initialize_profile(
        account: &signer,
        username: String,
        id: u64,
        is_verified: bool
    ) {
        let profile = UserProfile {
            username,
            id,
            is_verified
        };
        move_to(account, profile);
    }

    /// 기존 프로필을 업데이트하는 함수
    public entry fun update_profile(
        account: &signer,
        new_username: String,
        new_id: u64,
        new_is_verified: bool
    ) acquires UserProfile {
        let account_addr = signer::address_of(account);
        let profile = borrow_global_mut<UserProfile>(account_addr);
        profile.username = new_username;
        profile.id = new_id;
        profile.is_verified = new_is_verified;
    }

    /// 프로필 정보를 조회하는 함수
    #[view]
    public fun get_profile_details(addr: address): (String, u64, bool) acquires UserProfile {
        let profile = borrow_global<UserProfile>(addr);
        (profile.username, profile.id, profile.is_verified)
    }

    /// 테스트 함수 - 위 기능들이 제대로 작동하는지 확인
    #[test(account = @0x1)]
    public fun test_profile_storage(account: &signer) acquires UserProfile {
        print(&utf8(b"=== Testing Profile Storage ==="));
        
        // 프로필 초기화
        initialize_profile(
            account,
            utf8(b"Bookiroad"),
            1001,
            false 
        ); 

        print(&utf8(b"Profile initialized successfully!")); 

        let (username, id, verified) = get_profile_details(@0x1); 
        print(&utf8(b"Retrieved profile details:")); 
        print(&utf8(b"Username: ")); 
        print(&username); 
        print(&utf8(b"ID: ")); 
        print(&id); 
        print(&utf8(b"Verified: ")); 
        print(&verified); 

        print(&utf8(b"=== Updating Profile Storage ==="));
        
        // 프로필 업데이트
        update_profile( 
            account,
            utf8(b"Updated_Bookiroad"), 
            2002, 
            true 
        );

        print(&utf8(b"Profile updated successfully!"));

        let (new_username, new_id, new_verified) = get_profile_details(@0x1);

        print(&utf8(b"Updated profile details:"));
        print(&utf8(b"Username: "));
        print(&new_username);
        print(&utf8(b"ID: "));
        print(&new_id);
        print(&utf8(b"Verified: "));
        print(&new_verified);

        print(&utf8(b"Test completed successfully!"));
    }
}
