<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<%@include file="opendata.jsp"%>
<%@include file="counter_member.jsp"%>
<%@include file="web_url.jsp"%><!--抓母頁面網址-->
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<!--這裡用的css-->
<link href="../CSSfile/member_page.css"rel="stylesheet" type="text/css" />
<!--jump window-->
	<script type="text/javascript" src="box sample1/javascripts/prototype.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/effects.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/window.js"> </script>
	<script type="text/javascript" src="box sample1/javascripts/debug.js"> </script>
	<link href="box sample1/themes/default.css" rel="stylesheet" type="text/css"/>
	<link href="box sample1/themes/alert.css" rel="stylesheet" type="text/css"/>
	<link href="box sample1/themes/alphacube.css" rel="stylesheet" type="text/css"/>
<!--jump window end-->
<style type="text/css">
<!--
.style18 {font-size: 9pt}
-->
</style>
</head>
<script src="js/prototype.js"></script>
<script src="js/member_page.js"></script>
<script src="js/Login.js"></script>
<% //會員資料
	String user_id = request.getParameter("user");//抓會員空間的會員帳號
	String login_user=(String)session.getAttribute("user_id");//抓登入的使用者資料
	if(user_id==null){//如果抓不到會員空間網址後?user=xxx的話 表示是本人登入 則登入者id=會員id
		user_id=login_user;
	}
	Statement user=con.createStatement();//抓會員空間的會員資料
	String user_sql = "SELECT *, (YEAR(CURDATE())-YEAR(user_birth)) - (RIGHT(CURDATE(),5) < RIGHT(user_birth,5)) AS user_age FROM users where user_id ='"+user_id+"'";
	ResultSet user_data;
	user_data=user.executeQuery(user_sql);
	
%>

<body class="oneColFixCtrHdr" >
<div id="header">
<div style="padding-left:30px" align="left"><div style="width:320px" class="info_index"><a href="index.jsp"><img src="../music3.jpg" width="320" /></a>
<span class="font10">回首頁</span>
</div>
<%
	if (login_user == null)
	{
%>
<div class="font10 style4" style="position:absolute; left: 879px; top:9px; width: 89px; height: 14px;">   
    <table >
     <tr>
         <td><a href="#" onclick="openConfirm('<%=web_url%>')">登入</a></td>        
         <td><div style="margin-right:2px">|</div></td>  
         <td><a href="index_welcome.jsp">註冊</a></td>
     </tr>
    </table></div>
	
<%
	}
	else
	{
%>
	<div class="font10 info_mail" style="position:absolute; left: 790px; top: 36px; width: 37px; height: 34px;"><a href="#"onclick="feedback()"><img src="../images/mail.png" alt="" width="40" height="40" /></a>
    
    <span >我要檢舉</span>
    </div>
		<div class="font10 info_man" style="position:absolute; left: 832px; top: 33px; width: 35px; height: 38px"><a href="member_page.jsp"><img src="../images/Login.png" width="40" height="36" /></a> 
    
    <span>我的空間</span>
    </div>
	<div id="user_status" class="font10 style4 " align="right" style="position:absolute; left: 753px; top: 7px; width: 208px; height: 20px;"><%=login_user%>會員您好</div>
	<div class="font10  info_house" style="position:absolute; left: 877px; top: 33px; width: 35px; height: 38px"><a href="member_manage.jsp"><img src="../images/House.png" width="40" height="40" /></a>
    <span>我的管理頁面</span>
    </div>
    <div class="font10 info_door" style="position:absolute; left: 920px; top: 33px; width: 35px; height: 38px;"><a href="logout.jsp"><img src="../images/Door.png" alt="" width="40" height="36" /></a>
    
    <span>登出</span>
    </div>
    <%
	}
%>
<form action="search_website.jsp" method="post" name="search_form" onsubmit="return check_search()" >
   <div   style="position:absolute; left: 688px; top: 224px; width: 35px; height: 30px;" class="info_search">
   <span class="font10 style4">請輸入搜尋字串</span>  
<table width="290" border="0">
      <tr>
        <td width="138"><input type="text" name="search_text" id="search_text" class=" search-style"></td>
        <td width="82">
          <select name="search_type" id="search_type" class="font10 search-style">
          <option value="song_name" selected>歌名</option>
          <option value="member_name">會員</option>
          </select></td>        
        <td width="82"><input type="submit" value="搜尋" class="search-style"/></td>
      </tr>
    </table></div>
    </form>
  
  </div>
  <!-- end #header -->
  <div class="font10 style4 manubar link" >
    <table width="972">
      <tr>
        <td width="162" align="center" class="font10"><a href="member_page.jsp?user=<%=user_id%>">個人空間</a> </td>
        <td width="162" align="center" class="font10"><a href="member_page_info.jsp?user=<%=user_id%>">最新訊息</a></td>
        <td width="162" align="center" class="font10"><a href="member_page_music.jsp?user=<%=user_id%>">音樂作品</a> </td>
        <td width="162" align="center" class="font10"><a href="member_page_song-loved.jsp?user=<%=user_id%>"> 音樂收藏 </a></td> 
        <td width="162" align="center" class="font10"><a href="member_page_friend.jsp?user=<%=user_id%>">我的朋友</a></td>
        <td width="162" align="center" class="font10"><a href="member_page_message.jsp?user=<%=user_id%>">留言版</a> </td>
      </tr>
    </table>
  </div>
</div>
<div id="container" align="left">
<div class="font 10" id="mainContent" align="right">
  <!--會員標頭-->
  <div id="showid" class="font10 style4" align="left"> <a href="member_page.jsp?user=<%=user_id%>">首頁 </a><span class="style12">&gt;&nbsp;</span><a href="member_page.jsp?user=<%=user_id%>"><%=user_id%></a>
      <!--這裡需要抓id自動產生帳號名稱--></div>
  <!---------------------bigleft--------------------->
  <div id="bigleft" class="font10 style4">
    <!--About me title-->
    <div class="title style17 style7" align="left" style="position:relative"><strong>關於我</strong>
        <div class="roundedCorners style4 style14 bar_left1"></div>
      <!--About me title end-->
    </div>
    <%while(user_data.next()){ //資料庫中會員資料的結果%>
    <title><%=user_data.getString("user_nkname")%>的個人空間</title>
    <!--aboutme-block-->
    <div id="aboutme-block" align="left">
      <div id="aboutme-block-pic" align="center" > <img src="user/<%=user_id%>/<%=user_data.getString("user_pic")%>" alt="" width="100" height="100"/> </div>
      <div align="left" class="style4 detail-block">暱稱:<%=user_data.getString("user_nkname")%></div>
      <div align="left" class="style4 detail-block">年齡:<%=user_data.getInt("user_age")%></div>
      <div align="left" class="style4 detail-block">所在城市:<%=user_data.getString("user_city")%></div>
      <div align="left" class="style4 detail-block">點閱數:<strong><%=user_data.getInt("user_count")%></strong></div>
      <%
	boolean Exist=false;
	boolean Check=false;
	Statement add_friend=con.createStatement();//抓好友資料
	String add_friend_sql="SELECT * FROM friend WHERE friend_id='"+user_id+"' AND user_id='"+login_user+"'";
	ResultSet add_friend_data;
	add_friend_data=add_friend.executeQuery(add_friend_sql);
	
	while(add_friend_data.next()){
			Exist=true;
			int friend_check=add_friend_data.getInt("friend_check");
				if(friend_check==0){
					Check=false;
				}else{
					Check=true;
				}
	}
	if (login_user == null)
	{
		out.print("<div class='style4 detail-block' align='left'></div>");
	}
	else if(user_id.equals(login_user)){//如果登入帳號與會員空間帳號相同  則不顯示加入好友按鈕
		out.print("<div class='style4 detail-block' align='left'></div>");
    }
	else if(Exist){//如果已經是或等待朋友  則不顯示加入好友按鈕
		if(Check){
			out.print("<div class='style4 detail-block' align='left'><font color='red'>你們已經為好友</font></div>");
		}else{
			out.print("<div class='style4 detail-block' align='left'><font color='red'>等待對方同意好友</font></div>");
		}
	}
	else if(!Exist && user_id != login_user)
	{   
	    out.print("<div align='right' style='padding-right:65px'>");
	    out.print("<div class='outfriend'>");
		out.print("<input type='button' value='加入好友' onClick=\"AddFrd('"+login_user+"','"+user_id+"')\" class='infriend'/>");
		out.print("</div>");
		out.print("</div>");
    }
	else{
		out.print("<div class='style4 detail-block' align='left'><font color='red'>特殊狀況</font></div>");
    }
	add_friend.close();
	add_friend_data.close();
%>
      <!--加入好友form-->
      <form action="" method="post" id="frmFriend" name="frmFriend">
        <input type="hidden" name="user_id" id="user_id" value="" />
        <input type="hidden" name="friend_id" id="friend_id" value="" />
      </form>
      <!--加入好友end-->
      <!--about me end-->
    </div>
    <!--簡介-->
    <div align="left" style="margin:30px 0  10px 0 ">想說的話:</div>
    <div id="intro-block" align="left" > <%=user_data.getString("user_intro")%>
        <!--end of 簡介-->
    </div>
    <%
	 %>
    <!--好友動向-->
    <%
		if(user_id.equals(login_user)){
	%>
    <div class=" title style17 style8" align="left"  style="margin-bottom:10px;position:relative" ><strong>通知 </strong>
        <div class="roundedCorners style4 style14 bar_left2" ></div>
    </div>
    <!--end of -->
    

<%
		Statement friend_add = con.createStatement();//加入好友申請訊息
		sql="select * from friend,users where friend.friend_id='"+user_id+"' AND friend.user_id=users.user_id AND friend.friend_check = 0";
		ResultSet friend_add_data = friend_add.executeQuery(sql);
		
		String logout_time = user_data.getString("logout_time");
		Statement friend_agree = con.createStatement();//同意你的好友申請訊息
		sql="select * from friend,users where friend.friend_id='"+user_id+"' AND friend.user_id = users.user_id AND friend.friend_time > '" +logout_time+ "' AND friend.friend_check = 1";
		ResultSet friend_agree_data = friend_agree.executeQuery(sql);
		
		Statement track_opinion = con.createStatement();//同意你的好友申請訊息
		sql="select * from users,opinion,track where opinion.user_id ='"+user_id+"' AND opinion.post_id = users.user_id AND track.track_id = opinion.track_id AND opinion.time > '" +logout_time+ "'";
		ResultSet track_opinion_data = track_opinion.executeQuery(sql);
		
		if(!friend_add_data.next() && !friend_agree_data.next() && !track_opinion_data.next()){
			out.print("<font color='#FF0000'><p align = 'left'>您沒有任何通知<p></font>");
		}
		else{
			friend_agree_data.previous();
			friend_add_data.previous();
			track_opinion_data.previous();
			while(friend_add_data.next()){//friend_add_data
		   //如果該會員空間的帳號與朋友表格中的user_id相符合if留言動向
%><div id="div" align="left"  >
      <div style="border-bottom:1px dashed #CCCCCC ;margin-top:10px" >
        <table width="236">
          <tr>
            <td class="style12"><%=friend_add_data.getDate("friend.friend_time")%> <%=friend_add_data.getTime("friend.friend_time")%></td>
          </tr>
          <tr>
            <td><a href="member_page.jsp?user=<%=friend_add_data.getString("users.user_id")%>"><span class="style14"><%=friend_add_data.getString("users.user_nkname")%></span></a> <span class="style13">申請成為您的好友</span></td>
          </tr>
          <tr>
            <td><a href="member_manage_friends.jsp"> <span class="color1">接受</span></a> </td>
          </tr>
        </table>
      </div>
      </div> <!--<div id="div" align="left"  >結束-->
      <%	
	  	}//while(friend_add_data)
		
		while(friend_agree_data.next()){//friend_agree_data
		   //如果該會員空間的帳號與朋友表格中的user_id相符合if留言動向
%><div id="div" align="left"  >
      <div style="border-bottom:1px dashed #CCCCCC ;margin-top:10px" >
        <table width="236">
          <tr>
            <td class="style12"><%=friend_agree_data.getDate("friend.friend_time")%> <%=friend_agree_data.getTime("friend.friend_time")%></td>
          </tr>
          <tr>
            <td><a href="member_page.jsp?user=<%=friend_agree_data.getString("users.user_id")%>"><span class="color1"><%=friend_agree_data.getString("users.user_nkname")%></span></a> <span class="style13">已同意您的好友申請</span></td>
          </tr>
        </table>
      </div>
      </div> <!--<div id="div" align="left"  >結束-->
      <%	
	  	}//while(friend_agree_data)
		
		while(track_opinion_data.next()){//friend_agree_data
		   //如果該會員空間的帳號與朋友表格中的user_id相符合if留言動向
%><div id="div" align="left"  >
      <div style="border-bottom:1px dashed #CCCCCC ;margin-top:10px" >
        <table width="236">
          <tr>
            <td><span class="style13"><%=track_opinion_data.getDate("opinion.time")%>&nbsp;<%=track_opinion_data.getTime("opinion.time")%></span></td>
          </tr>
          <tr>
            <td><a href="member_page.jsp?user=<%=track_opinion_data.getString("users.user_id")%>"><span class="color1"><%=track_opinion_data.getString("users.user_nkname")%></span></a><span class="style13">對你的歌曲</span><a href="member_page_music_song.jsp?music_id=<%=track_opinion_data.getInt("track.track_id")%>"><span class="color1"><%=track_opinion_data.getString("track.track_name")%></span></a><span class="style13">發表了意見</span></td>
          </tr>
        </table>
      </div>
      </div> <!--<div id="div" align="left"  >結束-->
      <%	
	  	}//while(track_opinion_data)
		
		}//else
	  }//if login
	  }//user
     user.close();
	 user_data.close();
     //End of 資料庫中會員資料的結果
		%>
    
    <!--好友動向END-->
    <!--end of bigleft-->
  </div>
  <!--------------------------右邊的div-------------------------->
  <div  id="bigright" class="font10" >
    
    
    <div  align="left" class="redline-title" >
     <span class="style17" style="color:#444444">最新歌曲</span>
     <div class="roundedCorners " style="position:absolute; z-index:1000; background-color:#444444; width: 186px; height: 59px; left: -1px; top: 19px; width:662px; height:8px; -moz-opacity: 0.3; opacity: 0.3;" ></div>
     <!--最新歌曲end--></div>

<!--分類間隔div-->
    <div class="space1"> 
  
<!--最新歌曲title-->
      <!----------分類title---------->
      <%
   sql="select * from track where user_id='"+user_id+"'  ORDER BY track_time DESC limit 15";
   ResultSet song;
   song=stmt.executeQuery(sql);
   while(song.next()){
     String track_name=song.getString("track_name");
	 String track_id=song.getString("track_id");//歌曲的編號
	 
%>  
     <div  align="left" class="style4 song" > 
       <table width="658" border="0">
        <tr><!--傳歌曲編號-->
             <td width="538" class="title-name"><a href="member_page_music_song.jsp?music_id=<%=track_id%>"><%=track_name%></a></td>
            <td width="108"  class="title-style" align="right">&lt;
            
			
			<%
		    Statement track_type=con.createStatement();//抓歌曲風格 NATURAL JOIN查詢
		    String track_type_sql="SELECT music_type.music_genre FROM music_type,track_type where music_type.music_id=track_type.music_id and track_type.track_id='"+track_id+"'";
			
			ResultSet track_type_data;
            track_type_data=track_type.executeQuery(track_type_sql);
			if(!track_type_data.next()){
				out.print("未定義");
			}else{
				track_type_data.previous();
				while(track_type_data.next()){
			 		out.print(track_type_data.getString("music_type.music_genre"));
			 		out.print(" ");
			 	}
			 }
			 track_type.close();
			 track_type_data.close();
		  %> &gt;</td>
          </tr>
        </table>            
     </div>  
     
     <%
	 }
	 song.close();
	 %>
     <div  align="right" class="font10 style4 " >
       &gt;<a href="member_page_music.jsp?user=<%=user_id%>">more</a></div>
     
 <!--分類間隔div  end--></div> 
 
 <!--最新好友title-->
<div  align="left" class="redline-title"   > <span class="style17" style="color:#444444">最新朋友</span>
     <div class="roundedCorners" style="position:absolute; z-index:1000; background-color:#444444; width: 186px; height: 59px; left: 1px; top: 20px; width:662px; height:8px; -moz-opacity: 0.3; opacity: 0.3;" ></div>
    <!--最新歌曲end-->
</div>


<!--分類間隔div-->
    <div class="space" > 


<%//抓好友的圖片.暱稱.id出來
  sql="select * from friend where user_id='"+user_id+"' AND friend.friend_check = 1 ORDER BY friend_time DESC limit 5";//抓會員空間的好友
   rs=stmt.executeQuery(sql);
   
  while(rs.next()){
     String friend_id=rs.getString("friend_id");
	 
	  Statement friend=con.createStatement();//抓friend的資料
      String friend_sql="select * from users where user_id='"+friend_id+"'";
      ResultSet friend_data;
      friend_data=friend.executeQuery(friend_sql);
	  
    while(friend_data.next()){
	  String friend_nkname=friend_data.getString("user_nkname");
      String friend_pic=friend_data.getString("user_pic");
%> 
         <div class="friend-block" align="center"> 
   <a href="member_page.jsp?user=<%=friend_id%>"><img src="user/<%=friend_id%>/<%=friend_pic%>" width="90" height="90" /></a><br /><a href="member_page.jsp?user=<%=friend_id%>"><%=friend_nkname%></a></div>  
      
<%
   }//friend
   friend_data.close();
   friend.close();
   }
   //rs
   rs.close();
%>
   <!--最新好友end-->      
                <!--更多頁面-->
                <div style="clear:both"></div>
<div  align="right" class="font10 style4 " >&gt;<a href="member_page_friend.jsp?user=<%=user_id%>">more</a></div>   
<!--更多頁面-->   
<!--分類間隔div  end--> </div> 



<!--分類間隔div-->
<div  align="left" class="redline-title"   > <span class="style17" style="color:#444444">最新收藏</span>
    <div class="roundedCorners" style="position:absolute; z-index:1000; background-color:#444444; width: 186px; height: 59px; left: 1px; top: 20px; width:662px; height:8px; -moz-opacity: 0.3; opacity: 0.3;" ></div>
  <!--最新歌曲end-->
</div>
<div class="space">
<!--最新歌曲title--> 

    
<%
   sql="select *, CHAR_LENGTH(track.track_name) AS track_name_num, LEFT(track_name,9) AS c_track_name from music_collection,track,users where track.user_id=users.user_id AND music_collection.track_id = track.track_id AND login_id='"+user_id+"' order by music_collection.collect_date DESC LIMIT 4";
   rs=stmt.executeQuery(sql);
   while(rs.next()){
     int track_id=rs.getInt("track.track_id");
	 String user_id1=rs.getString("track.user_id");
	 String user_nkname1=rs.getString("users.user_nkname");
	 String collect_date=rs.getString("music_collection.collect_date");
	 String track_pic1=rs.getString("track.track_pic");
	
	   String track_name=rs.getString("track_name");//抓曲名
%>          
<!-- 音樂收藏-->
<div class="song-block" align="left" style="float:left">
    
    <div class="pic-block" align="center" ><a href="member_page_music_song.jsp?music_id=<%=track_id%>"><img src="user/<%=user_id1%>/music/<%=track_pic1%>" alt="" width="60" height="60"/></a></div>    
    <div  align="left" class="style4 detail-block">暱稱：<a href="member_page.jsp?user=<%=user_id1%>"><%=user_nkname1%></a></div>
    <div  align="left" class="style4 detail-block">歌名：<a href="member_page_music_song.jsp?music_id=<%=track_id%>"><%if(rs.getInt("track_name_num") > 8){%><%=rs.getString("c_track_name")%>...<%}else{%><%=rs.getString("track.track_name")%><%}%></a></div>
    <div  align="left" class="style4 detail-block"><span class="style12 ">收藏日期：<%=collect_date%></span></div>
    <div  align="right" class="style4 detail-block" ><span class="style12">&gt;&nbsp;</span><a href="member_page_music_song.jsp?music_id=<%=track_id%>" class="style18">點此播放</a></div>
    <!--音樂收藏 end-->
</div>
<%
	
	  }
	  stmt.close();
	  con.close();
	
	%> 
  <div style="clear:both"></div>
  <div  align="right" class="font10 style4 " >&gt;<a href="member_page_song-loved.jsp?user=<%=user_id%>">more</a></div>
    </div>  
<!--更多頁面-->

<!--更多頁面-->   

  </div>
  </div>
  <!-- footer -->
<div id="footer" class="font10 style2 linkus" align="center">
<p>Ai-Music 獨立音樂網 Inc 2009 <a href="mailto:musicyourlife@gmail.com">聯絡我們</a></p>
  <!-- end #footer --></div>
<!-- end #container --></div>
<script type="text/javascript">

function feedback(){
	Dialog.confirm("2",{className: "alphacube", width:325 ,height:380,closable:false, url: "feedback/feedback.jsp?user=<%=user_id%>&web_url=<%=web_url%>"})
			}
</script>
</body>
</html>
