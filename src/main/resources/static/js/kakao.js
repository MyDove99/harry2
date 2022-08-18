window.Kakao.init('91c65085a5882f9df8bb2a63670092d2');
var nickname="";
var email="";
var usernum="";
let values;
        function kakaoLogin() {
            window.Kakao.Auth.login({
                scope: 'profile_nickname, account_email', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
                success: function(response) {
                    console.log(response) // 로그인 성공하면 받아오는 데이터
                    window.Kakao.API.request({ // 사용자 정보 가져오기 
                        url: '/v2/user/me',
                        success: (res) => {
                            const kakao_account = res.kakao_account;
                            console.log(kakao_account);
                            values = Object.values(kakao_account);
                            nickname = Object.values(values[1]);
                            nickname = Object.values(nickname);
                            nickname = nickname[0];
                            email = values[6];
                            window.location.href='/kakaosignin?name='+nickname+"&email="+email //리다이렉트 되는 코드
                        }
                    });
                },
                fail: function(error) {
                    console.log(error);
                }
            });
        }
        	function kakaoLogout() {
            	if (!Kakao.Auth.getAccessToken()) {
        		    return;
        	    }
        	    Kakao.Auth.logout(function(response) {
        		    window.location.href='/logout'
        	    });
        }

        function secession() {
            usernum = document.getElementById('usernum').value;
            console.log(usernum);
        	Kakao.API.request({
            	url: '/v1/user/unlink',
            	success: function(response) {
            		console.log(response);
            		//callback(); //연결끊기(탈퇴)성공시 서버에서 처리할 함수
            		window.location.href='deleteuser?usernum='+usernum;
            	},
            	fail: function(error) {
            		console.log('탈퇴 미완료');
            		console.log(error);
            	},
        	});
        };