// JavaScript Document

var xmlHttp; 
  
// 此函式在建立 XMLHttpRequest 物件 
function createXMLHttpRequest() { 
  if (window.ActiveXObject) { // IE 
    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP"); 
  } 
  else if (window.XMLHttpRequest) { // Other browser 
    xmlHttp = new XMLHttpRequest();                
  } 
} 

// 程式由此執行 (<input> tag 裡設定 onkeyup="chkAccount()") 
function chkPassword() { 
    // 建立XMLHttpRequest物件 
  createXMLHttpRequest(); 
  var user_id = document.getElementById("user_id").value; 
  var user_password = document.getElementById("user_password").value; 
  var url ="password_check.jsp?user_id=" + user_id+"&user_password="+user_password;

  // 將輸入的帳號傳至後端作驗證 
  xmlHttp.onreadystatechange = callback;  
  xmlHttp.open("GET", url, true); 
  xmlHttp.send(null); 
} 
  
/* XMLHttpRequest 物件 open 方法的參數說明：  
   xmlHttp.open(a,b,c) 
   第一個參數 a 是 HTTP request 的方法：GET、POST、HEAD 中選一個使用(全大寫) 
   第二個參數 b 是要呼叫的 url, 不過只能呼叫與本網頁同一個網域內的網頁 
   第三個參數 c 決定此 request 是否採非同步進行 
     如果設定為 true 則即使後端尚未傳回資料也會繼續往下執行後面的程式 
     如果設定為 false 則必須等後端傳回資料後，才會繼續執行後面的程式 
 */      

// 資料回傳之後，使用 callback 這個函數處理後續動作    
function callback() { 
  if ((xmlHttp.readyState == 4) && (xmlHttp.status == 200)) { 
    // 接收後端程式傳回來的網頁(解析成 DOM 格式) 
    var xmldoc = xmlHttp.responseXML; 
    // 取出 Tag 為 <message> 該元素的值 
    var mes = xmldoc.getElementsByTagName("message")[0].firstChild.data; 
    // 取出 Tag 為 <passed> 該元素的值 
    var val = xmldoc.getElementsByTagName("passed")[0].firstChild.data; 
    setMessage(mes, val); 
  } 
} 

/* xmlHttp.readyState 所有可能的值： 
     0 (還沒開始), 
     1 (讀取中), 
     2 (已讀取), 
     3 (資訊交換中), 
     4 (一切完成) 

   xmlHttp.status 常見的值： 
     200 (一切正常), 
     404 (查無此頁), 
     500 (內部錯誤)    
*/      
  
function setMessage(message, isValid) {            
  var messageArea = document.getElementById("divPassword"); 
  var fontColor = "green"; 

  if (isValid == "true" || isValid == "True") { 
    fontColor = "red";                
  } 

  // 隱藏處理中的圖片 
  
  // 顯示是否有重複的帳號 
  messageArea.innerHTML = "<font color=" + fontColor + ">" + message + " </font>"; 
}
