<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	* {
		box-sizing: border-box;
		
	}
	
	body {
		background: silver;
		text-align: center;
	}
	
	h1 {
		margin-bottom: 30px;
		text-align: center;
	}
	
	input:focus, textarea:focus {
		outline:none;
	}
	
	.wrap {
		display: inline-block;
		background: white;
	}
	
	.main {
		margin: 50px 65px;
		text-align:left;
	}
	
	.ca_txt {
		font-size: 16px;
		margin-top: 10px;
	}
	
	.top_inp[type="text"] {
		width: 443px;
		height: 50px;
		border: 0px;
		border-bottom: 2px solid #ddd;
		margin: 0px;
		font-size: 16px;
		padding: 0px 0px 0px 10px;
	}
	.top_inp[type="password"] {
		width: 443px;
		height: 50px;
		border: 0px;
		border-bottom: 2px solid #ddd;
		margin: 0px;
		font-size: 16px;
		padding: 0px 0px 0px 10px;
	}
	input::placeholder {
		color: #ccc;
	}
	.top_inp[type="text"]:focus {
		border: 0px;
		border-bottom: 2px solid black;
	}
	.top_inp[type="password"]:focus {
		border: 0px;
		border-bottom: 2px solid black;
	}
	
	.mid_inp {
		width:147px;
		height: 50px;
		border: 0px;
		font-size: 16px;
	}
	
	.main_mid {
		border: 0px;
		border-bottom: 2px solid #ddd;
	}
	
	select[class="top_inp"] {
		width: 443px;
		height: 50px;
		border: 0px;
		font-size: 16px;
		paddin: 0px;
	}
	.ca_phone {
		width: 343px;
		height: 50px;
		border: 0px;
		border-bottom: 2px solid #ddd;
		margin: 0px;
		font-size: 16px;
		padding: 0px 0px 0px 10px;
	}
	.ca_phone:focus {
		border: 0px;
		border-bottom: 2px solid black;
	}
	
	.ca_phone_btn:active {
		background: silver;
	}
	
	.ca_phone_btn {
		border: 1px solid #ddd;
		border-radius: 30px;
		font-size: 14px;
		height: 50px;
		background: white;
	}
	
	.main_bot {
		margin-bottom: 30px;
	}
	
	textarea {
		resize: none;
		text-align: justify;
	}
	
	.ca_btn {
		text-align: center;
		margin: 40px 0px 0px 0px;
	}
	
	#go_btn, #back_btn {
		width: 16pt;
	}
	
</style>
</head>
<body>
	<h1>발자국</h1>
	<form method="post">
		<div class="wrap">
			<div class="main">
				<div class="main_top">
					<div class="ca_txt"><label for="ca_email">이메일</label></div>
					<input type="text" id="ca_email" class="top_inp" placeholder="이메일 입력"/><br/>
					<div class="ca_txt"><label for="ca_pw">비밀번호</label></div>
					<input type="password" id="ca_pw" class="top_inp" placeholder="비밀번호 입력"/><br/>
					<input type="password" id="ca_pw_check" class="top_inp" placeholder="비밀번호 재입력"/><br/>
					<div class="ca_txt"><label for="ca_name">이름</label></div>
					<input type="text" id="ca_name" class="top_inp" placeholder="이름을 입력해주세요."/><br/>
					<div class="ca_txt"><label for="ca_nickname">닉네임</label></div>
					<input type="text" id="ca_nickname" class="top_inp" placeholder="닉네임을 입력해주세요." /><br/>
				</div>
				<div class="ca_txt"><label for="ca_year">생년월일</label></div>
				<div class="main_mid">
					<input type="text" id="ca_year" name="ca_year" class="mid_inp"  placeholder="연도(ex : 1996)" />
					<select class="mid_inp" name="ca_month">
						<option value="" selected>월</option>
						<option value="1">1</option>
	                    <option value="2">2</option>
	                    <option value="3">3</option>
	                    <option value="4">4</option>
	                    <option value="5">5</option>
	                    <option value="6">6</option>
	                    <option value="7">7</option>
	                    <option value="8">8</option>
	                    <option value="9">9</option>
	                    <option value="10">10</option>
	                    <option value="11">11</option>
	                    <option value="12">12</option>
					</select>
					<select class="mid_inp" name="ca_date">
						<option value="" selected>일</option>
						<option value="1">1</option>
	                    <option value="2">2</option>
	                    <option value="3">3</option>
	                    <option value="4">4</option>
	                    <option value="5">5</option>
	                    <option value="6">6</option>
	                    <option value="7">7</option>
	                    <option value="8">8</option>
	                    <option value="9">9</option>
	                    <option value="10">10</option>
	                    <option value="11">11</option>
	                    <option value="12">12</option>
	                    <option value="13">13</option>
	                    <option value="14">14</option>
	                    <option value="15">15</option>
	                    <option value="16">16</option>
	                    <option value="17">17</option>
	                    <option value="18">18</option>
	                    <option value="19">19</option>
	                    <option value="20">20</option>
	                    <option value="21">21</option>
	                    <option value="22">22</option>
	                    <option value="23">23</option>
	                    <option value="24">24</option>
	                    <option value="25">25</option>
	                    <option value="26">26</option>
	                    <option value="27">27</option>
	                    <option value="28">28</option>
	                    <option value="29">29</option>
	                    <option value="30">30</option>
	                    <option value="31">31</option>
					</select>
				</div>
				<br/>
				<select class="top_inp" name="nationNo" id="nationNo">
					<option value="233">가나 +233</option>
	                <option value="241">가봉 +241</option>
	                <option value="592">가이아나 +592</option>
	                <option value="220">감비아 +220</option>
	                <option value="502">과테말라 +502</option>
	                <option value="1671">괌 +1 671</option>
	                <option value="1473">그레나다 +1 473</option>
	                <option value="30">그리스 +30</option>
	                <option value="224">기니 +224</option>
	                <option value="245">기니비사우 +245</option>
	                <option value="264">나미비아 +264</option>
	                <option value="674">나우루 +674</option>
	                <option value="234">나이지리아 +234</option>
	                <option value="672">남극,오스트레일리아의외 +672</option>
	                <option value="27">남아프리카공화국 +27</option>
	                <option value="31">네덜란드 +31</option>
	                <option value="599">네덜란드령보네르 +599</option>
	                <option value="297">네덜란드령아루바 +297</option>
	                <option value="977">네팔 +977</option>
	                <option value="47">노르웨이 +47</option>
	                <option value="64">뉴질랜드 +64</option>
	                <option value="683">뉴질랜드령니우에 +683</option>
	                <option value="690">뉴질랜드령토켈라우제도 +690</option>
	                <option value="227">니제르 +227</option>
	                <option value="505">니카라과 +505</option>
	                <option value="82" selected>대한민국 +82</option>
	                <option value="45">덴마크 +45</option>
	                <option value="299">덴마크령그린란드 +299</option>
	                <option value="298">덴마크령페로제도 +298</option>
	                <option value="1809">도미니카공화국 +1 809</option>
	                <option value="1829">도미니카공화국 2 +1 829</option>
	                <option value="1849">도미니카공화국 3 +1 849</option>
	                <option value="49">독일 +49</option>
	                <option value="670">동티모르 +670</option>
	                <option value="856">라오스 +856</option>
	                <option value="231">라이베리아 +231</option>
	                <option value="371">라트비아 +371</option>
	                <option value="7">러시아/카자흐스탄 +7</option>
	                <option value="961">레바논 +961</option>
	                <option value="266">레소토 +266</option>
	                <option value="40">루마니아 +40</option>
	                <option value="352">룩셈부르크 +352</option>
	                <option value="250">르완다 +250</option>
	                <option value="218">리비아 +218</option>
	                <option value="370">리투아니아 +370</option>
	                <option value="423">리히텐슈타인 +423</option>
	                <option value="261">마다가스카르 +261</option>
	                <option value="692">마셜제도공화국 +692</option>
	                <option value="691">마이크로네시아연방 +691</option>
	                <option value="853">마카오 +853</option>
	                <option value="389">마케도니아공화국 +389</option>
	                <option value="265">말라위 +265</option>
	                <option value="60">말레이시아 +60</option>
	                <option value="223">말리 +223</option>
	                <option value="52">멕시코 +52</option>
	                <option value="377">모나코 +377</option>
	                <option value="212">모로코 +212</option>
	                <option value="230">모리셔스 +230</option>
	                <option value="222">모리타니아 +222</option>
	                <option value="258">모잠비크 +258</option>
	                <option value="382">몬테네그로 +382</option>
	                <option value="373">몰도바 +373</option>
	                <option value="960">몰디브 +960</option>
	                <option value="356">몰타 +356</option>
	                <option value="976">몽골 +976</option>
	                <option value="1">미국/캐나다 +1</option>
	                <option value="1670">미국령북마리아나제도 +1 670</option>
	                <option value="95">미얀마 +95</option>
	                <option value="678">바누아투 +678</option>
	                <option value="973">바레인 +973</option>
	                <option value="1246">바베이도스 +1 246</option>
	                <option value="1242">바하마 +1 242</option>
	                <option value="880">방글라데시 +880</option>
	                <option value="229">베냉 +229</option>
	                <option value="58">베네수엘라 +58</option>
	                <option value="84">베트남 +84</option>
	                <option value="32">벨기에 +32</option>
	                <option value="375">벨라루스 +375</option>
	                <option value="501">벨리즈 +501</option>
	                <option value="387">보스니아헤르체고비나 +387</option>
	                <option value="267">보츠와나 +267</option>
	                <option value="591">볼리비아 +591</option>
	                <option value="257">부룬디 +257</option>
	                <option value="226">부르키나파소 +226</option>
	                <option value="975">부탄 +975</option>
	                <option value="359">불가리아 +359</option>
	                <option value="55">브라질 +55</option>
	                <option value="673">브루나이 +673</option>
	                <option value="685">사모아 +685</option>
	                <option value="966">사우디아라비아 +966</option>
	                <option value="378">산마리노 +378</option>
	                <option value="239">상투메프린시페 +239</option>
	                <option value="221">세네갈 +221</option>
	                <option value="381">세르비아 +381</option>
	                <option value="248">세이셀 +248</option>
	                <option value="1784">세인트빈센트그레나딘 +1 784</option>
	                <option value="252">소말리아 +252</option>
	                <option value="677">솔로몬제도 +677</option>
	                <option value="249">수단 +249</option>
	                <option value="597">수리남 +597</option>
	                <option value="94">스리랑카 +94</option>
	                <option value="268">스와질랜드 +268</option>
	                <option value="46">스웨덴 +46</option>
	                <option value="41">스위스 +41</option>
	                <option value="34">스페인 +34</option>
	                <option value="421">슬로바키아 +421</option>
	                <option value="386">슬로베니아 +386</option>
	                <option value="963">시리아 +963</option>
	                <option value="232">시에라리온 +232</option>
	                <option value="65">싱가포르 +65</option>
	                <option value="971">아랍에미리트 +971</option>
	                <option value="374">아르메니아 +374</option>
	                <option value="54">아르헨티나 +54</option>
	                <option value="1684">아메리칸사모아 +1 684</option>
	                <option value="354">아이슬란드 +354</option>
	                <option value="509">아이티 +509</option>
	                <option value="353">아일랜드 +353</option>
	                <option value="994">아제르바이잔 +994</option>
	                <option value="93">아프가니스탄 +93</option>
	                <option value="376">안도라 +376</option>
	                <option value="355">알바니아 +355</option>
	                <option value="213">알제리 +213</option>
	                <option value="244">앙골라 +244</option>
	                <option value="251">에디오피아 +251</option>
	                <option value="291">에리트레아 +291</option>
	                <option value="372">에스토니아 +372</option>
	                <option value="593">에콰도르 +593</option>
	                <option value="503">엘살바도르 +503</option>
	                <option value="44">영국 +44</option>
	                <option value="290">영국령세인트헬레나 +290</option>
	                <option value="246">영국령인도양지역 +246</option>
	                <option value="350">국령지브롤터 +350</option>
	                <option value="500">영국령포클랜드제도 +500</option>
	                <option value="967">예멘 +967</option>
	                <option value="968">오만 +968</option>
	                <option value="43">오스트리아 +43</option>
	                <option value="504">온두라스 +504</option>
	                <option value="962">요르단 +962</option>
	                <option value="256">우간다 +256</option>
	                <option value="598">우루과이 +598</option>
	                <option value="998">우즈베키스탄 +998</option>
	                <option value="380">우크라이나 +380</option>
	                <option value="964">이라크 +964</option>
	                <option value="98">이란 +98</option>
	                <option value="972">이스라엘 +972</option>
	                <option value="20">이집트 +20</option>
	                <option value="39">이탈리아 +39</option>
	                <option value="91">인도 +91</option>
	                <option value="62">인도네시아 +62</option>
	                <option value="81">일본 +81</option>
	                <option value="1876">자메이카 +1 876</option>
	                <option value="260">잠비아 +260</option>
	                <option value="240">적도기니 +240</option>
	                <option value="995">조지아 +995</option>
	                <option value="86">중국 +86</option>
	                <option value="236">중앙아프리카공화국 +236</option>
	                <option value="253">지부티 +253</option>
	                <option value="263">짐바브웨 +263</option>
	                <option value="235">차드 +235</option>
	                <option value="420">체코 +420</option>
	                <option value="56">칠레 +56</option>
	                <option value="237">카메룬 +237</option>
	                <option value="238">카보베르데 +238</option>
	                <option value="974">카타르 +974</option>
	                <option value="855">캄보디아왕국 +855</option>
	                <option value="254">케냐 +254</option>
	                <option value="269">코모로,마요트 +269</option>
	                <option value="506">코스타리카 +506</option>
	                <option value="225">코트디부아르 +225</option>
	                <option value="57">콜롬비아 +57</option>
	                <option value="242">콩고 +242</option>
	                <option value="243">콩고민주공화국 +243</option>
	                <option value="53">쿠바 +53</option>
	                <option value="965">쿠웨이트 +965</option>
	                <option value="682">쿡제도 +682</option>
	                <option value="385">크로아티아 +385</option>
	                <option value="996">키르기스스탄 +996</option>
	                <option value="686">키리바시 +686</option>
	                <option value="357">키프로스 +357</option>
	                <option value="886">타이완 +886</option>
	                <option value="992">타지키스탄 +992</option>
	                <option value="255">탄자니아 +255</option>
	                <option value="66">태국 +66</option>
	                <option value="90">터키 +90</option>
	                <option value="228">토고 +228</option>
	                <option value="676">통가 +676</option>
	                <option value="993">투르크메니스탄 +993</option>
	                <option value="216">튀니지 +216</option>
	                <option value="1868">트리니다드토바고 +1 868</option>
	                <option value="507">파나마 +507</option>
	                <option value="595">파라과이 +595</option>
	                <option value="92">파키스탄 +92</option>
	                <option value="675">파푸아뉴기니 +675</option>
	                <option value="680">팔라우 +680</option>
	                <option value="970">팔레스타인 +970</option>
	                <option value="51">페루 +51</option>
	                <option value="351">포르투갈 +351</option>
	                <option value="48">폴란드 +48</option>
	                <option value="1787">푸에르토리코 +1 787</option>
	                <option value="33">프랑스 +33</option>
	                <option value="590">프랑스령과들루프 +590</option>
	                <option value="594">프랑스령기아나 +594</option>
	                <option value="687">프랑스령뉴칼레도니아 +687</option>
	                <option value="262">프랑스령레위니옹 +262</option>
	                <option value="596">프랑스령마르티니크 +596</option>
	                <option value="508">프랑스령생피에르미클롱 +508</option>
	                <option value="681">프랑스령월리스푸투나제 +681</option>
	                <option value="689">프랑스령폴리네시아 +689</option>
	                <option value="679">피지 +679</option>
	                <option value="358">핀란드 +358</option>
	                <option value="63">필리핀 +63</option>
	                <option value="36">헝가리 +36</option>
	                <option value="61">호주 +61</option>
	                <option value="852">홍콩 +852</option>
				</select>
				<div class="main_bot">
					<div class="ca_txt"><label for="ca_phone">휴대전화</label></div>
					<input type="text" id="ca_phone" class="ca_phone" placeholder="휴대전화 번호를 입력하세요." />
					<input type="button" value="인증번호 전송" class="ca_phone_btn" onclick="" />
					<br/>
					<input type="text" id="chk_no" class="top_inp" placeholder="인증번호를 입력하세요."/>
				</div>
				<div class="agree_txt">
					<textarea rows="10" cols="60" readonly>(주)발자국 이용약관 동의(필수)
					
무엇인지 것은 그러나 불러 이름과, 이런 듯합니다. 이름과, 속의 새겨지는 라이너 있습니다. 이름자를 어머니 청춘이 하나에 별이 이름과, 듯합니다. 마리아 지나가는 아스라히 가을로 프랑시스 가득 위에도 어머님, 듯합니다. 무엇인지 그리고 못 듯합니다.멀리 하나에 동경과 멀듯이, 하나에 우는 까닭입니다. 마리아 가득 이름과 이런 별 부끄러운 어머님, 이 듯합니다. 노루, 나는 불러 계십니다. 다하지 써 어머니 멀듯이, 때 봅니다.못 내일 언덕 흙으로 마디씩 때 프랑시스 듯합니다. 너무나 애기 것은 잠, 멀리 나는 나의 경, 어머니 버리었습니다. 덮어 별 없이 까닭이요, 있습니다. 밤이 쉬이 잠, 별 멀듯이, 무엇인지 계절이 무성할 봅니다. 보고, 소녀들의 딴은 별빛이 나는 새겨지는 버리었습니다. 토끼, 봄이 않은 하나에 하늘에는 써 다하지 많은 프랑시스 있습니다. 보고, 시와 이제 책상을 노루, 버리었습니다. 이 위에도 이름을 차 자랑처럼 잔디가 흙으로 어머니 봅니다. 하나 이웃 피어나듯이 풀이 소학교 계집애들의 다 새워 가슴속에 계십니다. 새워 오는 보고, 쉬이 언덕 잔디가 별 까닭입니다. 벌써 이제 슬퍼하는 보고, 까닭입니다.별을 언덕 토끼, 사랑과 내린 까닭입니다. 밤이 청춘이 하늘에는 계십니다. 봄이 이네들은 가을 나는 내 별 있습니다. 못 책상을 별 있습니다. 우는 때 오는 남은 계십니다. 속의 덮어 불러 헤는 내일 시인의 이름과, 남은 있습니다. 다하지 것은 이름자 별 패, 까닭입니다. 걱정도 겨울이 벌써 그리고 것은 이국 거외다. 흙으로 보고, 책상을 거외다. 나는 이웃 까닭이요, 어머니 부끄러운 이름자 흙으로 동경과 있습니다.
	                </textarea><br/>
	                <div class="radio_box">
	                    <input type="radio" value="agree" name="agree_radio_up" id="agree_radio_up"/> <label for="agree_radio_up">동의</label>
	                    <input type="radio" value="disagree" name="agree_radio_up" id="disagree_radio_up"/> <label for="disagree_radio_up">동의 안 함</label>
	                </div>
	                <br/>
	                <textarea rows="10" cols="60" readonly>개인정보 수집 및 이용 동의(필수)
	                
무엇인지 것은 그러나 불러 이름과, 이런 듯합니다. 이름과, 속의 새겨지는 라이너 있습니다. 이름자를 어머니 청춘이 하나에 별이 이름과, 듯합니다. 마리아 지나가는 아스라히 가을로 프랑시스 가득 위에도 어머님, 듯합니다. 무엇인지 그리고 못 듯합니다.멀리 하나에 동경과 멀듯이, 하나에 우는 까닭입니다. 마리아 가득 이름과 이런 별 부끄러운 어머님, 이 듯합니다. 노루, 나는 불러 계십니다. 다하지 써 어머니 멀듯이, 때 봅니다.못 내일 언덕 흙으로 마디씩 때 프랑시스 듯합니다. 너무나 애기 것은 잠, 멀리 나는 나의 경, 어머니 버리었습니다. 덮어 별 없이 까닭이요, 있습니다. 밤이 쉬이 잠, 별 멀듯이, 무엇인지 계절이 무성할 봅니다. 보고, 소녀들의 딴은 별빛이 나는 새겨지는 버리었습니다. 토끼, 봄이 않은 하나에 하늘에는 써 다하지 많은 프랑시스 있습니다. 보고, 시와 이제 책상을 노루, 버리었습니다. 이 위에도 이름을 차 자랑처럼 잔디가 흙으로 어머니 봅니다. 하나 이웃 피어나듯이 풀이 소학교 계집애들의 다 새워 가슴속에 계십니다. 새워 오는 보고, 쉬이 언덕 잔디가 별 까닭입니다. 벌써 이제 슬퍼하는 보고, 까닭입니다.별을 언덕 토끼, 사랑과 내린 까닭입니다. 밤이 청춘이 하늘에는 계십니다. 봄이 이네들은 가을 나는 내 별 있습니다. 못 책상을 별 있습니다. 우는 때 오는 남은 계십니다. 속의 덮어 불러 헤는 내일 시인의 이름과, 남은 있습니다. 다하지 것은 이름자 별 패, 까닭입니다. 걱정도 겨울이 벌써 그리고 것은 이국 거외다. 흙으로 보고, 책상을 거외다. 나는 이웃 까닭이요, 어머니 부끄러운 이름자 흙으로 동경과 있습니다.
	                </textarea>
	                <br/>
	                <div class="radio_box">
	                    <input type="radio" value="agree" name="agree_radio_down" id="agree_radio_down"/> <label for="agree_radio_down">동의</label>
	                    <input type="radio" value="disagree" name="agree_radio_down" id="disagree_radio_down"/> <label for="disagree_radio_down">동의 안 함</label>
	                </div>
				</div>
				<div class="ca_btn">
						<input type="button" value="돌아가기" name="back_btn" onclick="" />
						<input type="button" value="여행떠나기" name="go_btn" onclick="" />
				</div>
			</div>
		</div>
	</form>
</body>
</html>