<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="./style/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js" ></script>    
<script>
var actualWidth = 0;
var actualHeight = 0;

$(document).ready(
		function()
		{  

			var image =$('#iPhone');
			actualWidth = image.width();
			actualHeight = image.height();
			
		
			var content = "<img src='iSalonImages/mainPage.png' usemap=#appclicks>";
			content += "<map name=appclicks>";
			content += "<area shape=rect coords="+coords(83,85,127,145)+" href='#' onclick='clientView();'>";
			content += "<area shape=rect coords="+coords(203,85,259,139)+" href='#' onclick='schedulerView();'>";
			content += "<area shape=rect coords="+coords(75,193,141,254)+" href='#' onclick='inventoryView();'>";
			content += "<area shape=rect coords="+coords(192,189,273,253)+" href='#' onclick='shoppingListView();'>";
			content += "<area shape=rect coords="+coords(81,309,130,369)+" href='#' onclick='settingsView();'>";
			content += "<area shape=rect coords="+coords(218,310,269,369)+" href='#' onclick='analyticsView();'>";
			content += "</map>";
			$('#iPhone').html(content);
		 	
		});
function coords(left,top,right,bottom) {
	var imgWidth = 322; //original
	var imgHeight = 480; //original
	return actualWidth*left/imgWidth + "," + actualHeight*top/imgHeight + "," + 
	actualWidth*right/imgWidth + "," + actualHeight*bottom/imgHeight;
}
function homeView()
{
	var content = "<img src='iSalonImages/mainPage.png' usemap=#appclicks>";
	content += "<map name=appclicks>";
	content += "<area shape=rect coords="+coords(83,85,127,145)+" href='#' onclick='clientView();'>";
	content += "<area shape=rect coords="+coords(203,85,259,139)+" href='#' onclick='schedulerView();'>";
	content += "<area shape=rect coords="+coords(75,193,141,254)+" href='#' onclick='inventoryView();'>";
	content += "<area shape=rect coords="+coords(192,189,273,253)+" href='#' onclick='shoppingListView();'>";
	content += "<area shape=rect coords="+coords(81,309,130,369)+" href='#' onclick='settingsView();'>";
	content += "<area shape=rect coords="+coords(218,310,269,369)+" href='#' onclick='analyticsView();'>";
	content += "</map>";
	$('#iPhone').html(content);
}

function clientView()
	{
		var content = "<img src='iSalonImages/clientSearch.png' usemap=#appclicks>";
		content += "<map name=appclicks>";
		content += "<area shape=rect coords="+coords(11,4,63,24)+" href='#' onclick='homeView();'>";
		content += "<area shape=rect coords="+coords(283,3,307,21)+" href='#' onclick='editClientView();'>";
		content += "</map>";
		$('#iPhone').html(content);
	
	}

function editClientView()
{
	var content = "<img src='iSalonImages/editClient.png' usemap=#appclicks>";
	content += "<map name=appclicks>";
	content += "<area shape=rect coords="+coords(12,2,110,24)+" href='#' onclick='clientView();'>";
	content += "<area shape=rect coords="+coords(238,4,313,23)+" href='#' onclick='schedulerView();'>";
	content += "</map>";
	$.get('#iPhone').html(content);
}

function schedulerView()
{
	var content = "<img src='iSalonImages/scheduler.png' usemap=#appclicks>";
	content += "<map name=appclicks>";
	content += "<area shape=rect coords="+coords(11,4,63,24)+" href='#' onclick='homeView();'>";
	content += "<area shape=rect coords="+coords(274,3,299,20)+" href='#' onclick='addApptView();'>";
	content += "</map>";
	$('#iPhone').html(content);
}

function addApptView()
{
	var content = "<img src='iSalonImages/addAppt.png' usemap=#appclicks>";
	content += "<map name=appclicks>";
	content += "<area shape=rect coords="+coords(12,5,90,25)+" href='#' onclick='schedulerView();'>";
	content += "<area shape=rect coords="+coords(237,5,314,24)+" href='#' onclick='schedulerView();'>";
	content += "<area shape=rect coords="+coords(230,115,262,142)+" href='#' onclick='chooseServiceView();'>";
	content += "</map>";
	$('#iPhone').html(content);
}
function chooseServiceView()
{
	var content = "<img src='iSalonImages/chooseService.png' usemap=#appclicks>";
	content += "<map name=appclicks>";
	content += "<area shape=rect coords="+coords(5,3,124,24)+" href='#' onclick='addApptView();'>";
	content += "<area shape=rect coords="+coords(252,3,315,22)+" href='#' onclick='addApptView();'>";
	content += "</map>";
	$('#iPhone').html(content);
}
function inventoryView()
{
	var content = "<img src='iSalonImages/inventory.png' usemap=#appclicks>";
	content += "<map name=appclicks>";
	content += "<area shape=rect coords="+coords(11,4,63,24)+" href='#' onclick='homeView();'>";
	content += "<area shape=rect coords="+coords(238,3,302,21)+" href='#' onclick='scanView();'>";
	content += "</map>";
	$('#iPhone').html(content);
}
function scanView()
{
	var content = "<img src='iSalonImages/scan.png' usemap=#appclicks>";
	content += "<map name=appclicks>";
	content += "<area shape=rect coords="+coords(12,3,63,24)+" href='#' onclick='inventoryView();'>";
	content += "<area shape=rect coords="+coords(77,207,157,242)+" href='#' onclick='scanInView();'>";
	content += "<area shape=rect coords="+coords(169,208,252,241)+" href='#' onclick='scanOutView();'>";
	content += "</map>";
	$('#iPhone').html(content);
}
function scanInView()
{
	var content = "<img src='iSalonImages/scanIn.png' usemap=#appclicks>";
	content += "<map name=appclicks>";
	content += "<area shape=rect coords="+coords(11,2,62,24)+" href='#' onclick='scanView();'>";
	content += "<area shape=rect coords="+coords(245,4,308,23)+" href='#' onclick='scanView();'>";
	content += "</map>";
	$('#iPhone').html(content);
}
function scanOutView()
{
	var content = "<img src='iSalonImages/scanOut.png' usemap=#appclicks>";
	content += "<map name=appclicks>";
	content += "<area shape=rect coords="+coords(14,4,63,26)+" href='#' onclick='scanView();'>";
	content += "<area shape=rect coords="+coords(253,2,315,23)+" href='#' onclick='scanView();'>";
	content += "</map>";
	$('#iPhone').html(content);
}
function shoppingListView()
{
	
	var content = "<img src='iSalonImages/shoppingList.png' usemap=#appclicks>";
	content += "<map name=appclicks>";
	content += "<area shape=rect coords="+coords(5,3,55,24)+" href='#' onclick='homeView();'>";
	content += "</map>";
	$('#iPhone').html(content);
	
}
function settingsView()
{
	var content = "<img src='iSalonImages/setting.png' usemap=#appclicks>";
	content += "<map name=appclicks>";
	content += "<area shape=rect coords="+coords(34,129,303,155)+" href='#' onclick='settingsCalendarView();'>";
	content += "<area shape=rect coords="+coords(35,185,303,210)+" href='#' onclick='settingsServicesView();'>";
	content += "<area shape=rect coords="+coords(34,226,303,252)+" href='#' onclick='settingsShoppingView();'>";
	content += "<area shape=rect coords="+coords(35,275,303,299)+" href='#' onclick='settingsAlertView();'>";
	content += "<area shape=rect coords="+coords(109,349,231,420)+" href='#' onclick='homeView();'>";
	content += "</map>";
	$('#iPhone').html(content);		
}
function settingsCalendarView()
{
	var content = "<img src='iSalonImages/settingsCalendar.png' usemap=#appclicks>";
	content += "<map name=appclicks>";
	content += "<area shape=rect coords="+coords(9,1,77,23)+" href='#' onclick='settingsView();'>";
	content += "<area shape=rect coords="+coords(250,2,313,21)+" href='#' onclick='settingsView();'>";
	content += "</map>";
	$('#iPhone').html(content);	
}
function settingsServicesView()
{
	var content = "<img src='iSalonImages/settingsServices.png' usemap=#appclicks>";
	content += "<map name=appclicks>";
	content += "<area shape=rect coords="+coords(9,1,77,23)+" href='#' onclick='settingsView();'>";
	content += "<area shape=rect coords="+coords(250,2,313,21)+" href='#' onclick='settingsView();'>";
	content += "</map>";
	$('#iPhone').html(content);	
}

function settingsShoppingView()
{
	var content = "<img src='iSalonImages/settingsShopping.png' usemap=#appclicks>";
	content += "<map name=appclicks>";
	content += "<area shape=rect coords="+coords(9,1,77,23)+" href='#' onclick='settingsView();'>";
	content += "<area shape=rect coords="+coords(250,2,313,21)+" href='#' onclick='settingsView();'>";
	content += "</map>";
	$('#iPhone').html(content);	
}
function settingsAlertView()
{
	var content = "<img src='iSalonImages/alerts.png' usemap=#appclicks>";
	content += "<map name=appclicks>";
	content += "<area shape=rect coords="+coords(9,1,77,23)+" href='#' onclick='settingsView();'>";
	content += "<area shape=rect coords="+coords(250,2,313,21)+" href='#' onclick='settingsView();'>";
	content += "</map>";
	$('#iPhone').html(content);	
}
function analyticsView()
{
	var content = "<img src='iSalonImages/analytics.png' usemap=#appclicks>";
	content += "<map name=appclicks>";
	content += "<area shape=rect coords="+coords(18,1,67,24)+" href='#' onclick='homeView();'>";
	content += "</map>";
	$('#iPhone').html(content);
}
</script>
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script> 
<script type="text/javascript" src="js/jquery.backgroundPosition.js"></script>
 <script type="text/javascript" src="js/jquery.equalize.js"></script> 
 <script type="text/javascript" src="js/jquery.cycle.lite.min.js"></script> 
 <script type="text/javascript" src="js/jquery.pngFix.pack.js"></script> 
 <script type="text/javascript" src="js/custom.js"></script>  
 </head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>




<!-- Start Main Container -->
<!-- TOP Section -->
<div class="topStretch">
	<div class="topWrap">
		<div class="centerContainer">
			<h2>iSalon</h2>
			<span class="tagline"></span>

			
			<!-- SOCIAL ICONS START -->

			<div class="buttons">
				<!--<a href="#" title="charkApps"><img src="../images/iSalonIcon.png" width="27" height="26" border="0" alt="Follow me on Twitter!" /></a>-->
				<a href = "Logout">Logout</a>
			</div>

			<!-- SOCIAL ICONS END -->

		</div> <!-- END CENTERCONTAINER -->
	</div> <!-- END BARWRAP -->
</div>
<!-- END TOP Section -->

 
 
 
 

 <div id="container">   <!-- Start Header --> 
 <div id="icon"></div>
 <div id="header">  

 <div id="header-main">  <!-- Start Header Wrapper --> 
 <div class="wrapper">  

 <div class="intro"> 
 
  <p><span style="color:#9DE;">iSalon</span>
   is a stylist best friend. Easily manage all aspects of your business.</p><p> <span style="color:#9DE;">Explore</span> the app as it is being built with this live mockup demo. Actual screen shots will be placed as they get built. So tell use what you like and what you don't. 
   This app is being build just for you and we want to ensure that ALL your needs are met.</p>  
   <p class="app-store">
   <a class="replace" href="http://itunes.apple.com/" target="_blank" title="Buy iSalon">Available on the iPhone App Store</a></p>
     
     </div>  
     
     </div><!-- End Header Wrapper -->  </div> 
    
      </div><!-- End Header -->  
		<div id="headerBottom"></div>
       <!-- Start Main Container -->
       <div id="mainContent">  <!-- Start Main Content Wrapper --> <div class="wrapper"> 
        <!-- Start Content Wrapper --> 
        <div id="content"> 
         
         <a href="CommentHelper">Feedback</a>
         
         
         <!--  INSIDE PANEL NEED TWO DIV CONTAINERS FOR FEATURES ONE LEFT ONE RIGHT -->
           <!-- Start Features Panel --> 
           <div id="features_panel" class="panel">  
          <div class="upper-list">
           <ul class="features">  
           <li class="client"> 
           	<h2 >Client information</h2> 
           	<p>Keep detailed information about your clients including:<br/> 
           		<ul class="bullets">
		           <li >Date of last visit</li>
		           <li>    Formula used and how many oz.</li>
		           <li>    Last services performed</li>
		           <li>    Amount charged</li>
		           <li>    Tip received</li>
		           <li>    Retail purchased</li>
		           </ul> 
           </p> 
           </li>  
            <li class="schd">
            <h2 >Schedule</h2> 
            <p>Schedule your clients with ease!<br/> 
           		<ul class="bullets">
		           <li> Customize your appointment types with time allotments.</li>
		           <li>Sync your schedule to your google calendar to keep everyone up to date.
		           </li>
		           </ul>
           </p> 
           </li> 
            
            <li class="inventory"> 
            <h2 >Inventory</h2> 
           <p>Full service inventory manager! 
           		 <ul class="bullets">
		           <li> Easily scan in and out your products using your phones camera.</li>
		           <li> Keeps track of quantity and cost of each item you have in stock.</li>
		           </ul>
           </p> 
           </li> 
           </ul>
           </div>
           <div class="lower-list">
           <ul class = "features">
           <li class="shopping"> 
		      <h2 >Shopping List</h2> 
		      <p>On-Demand shopping list!
		      <ul class="bullets">
			           <li> List is prepared for you based on your inventory needs.</li>
			           <li> Know what you need and how much it will cost with the shopping list
					        cost estimation feature.</li>
					        </ul>
		       </p>
		        </li>  
		          <li class="report"> 
		          <h2 >Analytics</h2> 
		          <p>Manage your business like a pro! The instant report keeps you in the know.
		          		<ul class="bullets">
		           			<li>Total number of clients.</li>
							<li>Number of NEW clients added in the last 30 days.</li>
		           			<li>Break down of expenses and revenue for the last 30 days.</li>
		           			</ul>
           			</p> 
           			</li> 
                 <li class="settings"> 
                 <h2 >Custom Settings</h2>
               			<p>Customize everything! We want you to LOVE this app. So you need to be able to make it your own with 
              				 a full settings menu.<br/>
              				 Don't want to customize? No problem, app is ready to go on day one!
              			</p> 
               	</li> 
               	</ul> 
               	</div>
     
               
         </div><!-- End Features Panel --> 
                    
                      <!-- Start Feedback Panel -->
                     <div id="feedback_panel" class="panel hide">  
                     <ul id="testimonials">  <li> 
                     <p class="testimonial">"AppShow is awesome! It comes with everything you need to get a 
                     slick, modern, interactive app site up and running over night with no effort needed."</p> 
                     <p class="testimonial_source">Jimmy Shoemaker, AppRus</p> </li>  
                     <li> <p class="testimonial">"By using AppShow for my app's site I didn't even have to hire a
                      web desinger or programer!"</p> 
                      <p class="testimonial_source">Tommy Way, AppStorm</p> </li>  
                      <li> <p class="testimonial">"AppShow's iPhone slideshow is really cool and I love the usable 
                      home button!"</p> 
                      <p class="testimonial_source">Mike Hunt, AppCompany L.L.C.</p> </li>
                        <li> <p class="testimonial">"I couldn't believe how easy it was to edit the AppShow 
                        template. My app site has increased sales in the iTunes App Store by 100 percent!"</p> 
                        <p class="testimonial_source">Steve Jobs, Pear L.L.C.</p> </li>  </ul> 
                         </div><!-- End Feedback Panel -->   
                         <!-- Start Icon Panel 
                         <div id="icon_panel" class="panel hide"> 
                         <img src="images/icons/alarm.png" border="0" class="icon-preview" />
<img src="images/icons/arrowdown.png" border="0" class="icon-preview" /> 
<img src="images/icons/arrowleft.png" border="0" class="icon-preview" /> 
<img src="images/icons/arrowright.png" border="0" class="icon-preview" /> 
<img src="images/icons/arrowup.png" border="0" class="icon-preview" /> 
<img src="images/icons/bank.png" border="0" class="icon-preview" /> 
<img src="images/icons/briefcase.png" border="0" class="icon-preview" /> 
<img src="images/icons/calculator.png" border="0" class="icon-preview" /> 
<img src="images/icons/camera.png" border="0" class="icon-preview" /> 
<img src="images/icons/clapboard.png" border="0" class="icon-preview" /> 
<img src="images/icons/clock.png" border="0" class="icon-preview" /> 
<img src="images/icons/connections.png" border="0" class="icon-preview" /> 
<img src="images/icons/credit_card.png" border="0" class="icon-preview" /> 
<img src="images/icons/database.png" border="0" class="icon-preview" /> 
<img src="images/icons/delete.png" border="0" class="icon-preview" /> 
<img src="images/icons/delivery.png" border="0" class="icon-preview" /> 
<img src="images/icons/disk.png" border="0" class="icon-preview" /> 
<img src="images/icons/eject.png" border="0" class="icon-preview" /> 
<img src="images/icons/fastforward.png" border="0" class="icon-preview" />
<img src="images/icons/filter.png" border="0" class="icon-preview" /> 
<img src="images/icons/fire.png" border="0" class="icon-preview" /> 
<img src="images/icons/first_aid.png" border="0" class="icon-preview" /> 
<img src="images/icons/folder.png" border="0" class="icon-preview" /> 
<img src="images/icons/forwardtoend.png" border="0" class="icon-preview" />
 <img src="images/icons/games.png" border="0" class="icon-preview" /> 
 <img src="images/icons/graph.png" border="0" class="icon-preview" /> 
 <img src="images/icons/heart.png" border="0" class="icon-preview" /> 
 <img src="images/icons/house.png" border="0" class="icon-preview" /> 
 <img src="images/icons/lightbulb.png" border="0" class="icon-preview" /> 
 <img src="images/icons/magnet.png" border="0" class="icon-preview" /> 
 <img src="images/icons/magnifyingglass.png" border="0" class="icon-preview" /> 
 <img src="images/icons/mailclosed.png" border="0" class="icon-preview" /> 
 <img src="images/icons/mailopened.png" border="0" class="icon-preview" /> 
 <img src="images/icons/man.png" border="0" class="icon-preview" /> 
 <img src="images/icons/minus.png" border="0" class="icon-preview" /> 
 <img src="images/icons/monitor.png" border="0" class="icon-preview" /> 
 <img src="images/icons/move.png" border="0" class="icon-preview" /> 
 <img src="images/icons/newspaper.png" border="0" class="icon-preview" /> 
 <img src="images/icons/padlock.png" border="0" class="icon-preview" /> 
 <img src="images/icons/page.png" border="0" class="icon-preview" /> 
 <img src="images/icons/pause.png" border="0" class="icon-preview" /> 
 <img src="images/icons/pencilangled.png" border="0" class="icon-preview" /> 
 <img src="images/icons/pencilstraight.png" border="0" class="icon-preview" />
  <img src="images/icons/photos.png" border="0" class="icon-preview" /> 
  <img src="images/icons/piggy.png" border="0" class="icon-preview" /> 
  <img src="images/icons/play.png" border="0" class="icon-preview" /> 
  <img src="images/icons/plus.png" border="0" class="icon-preview" /> 
  <img src="images/icons/preferences.png" border="0" class="icon-preview" />
   <img src="images/icons/record.png" border="0" class="icon-preview" /> 
   <img src="images/icons/refresh.png" border="0" class="icon-preview" /> 
   <img src="images/icons/reload.png" border="0" class="icon-preview" /> 
   <img src="images/icons/rewind.png" border="0" class="icon-preview" /> 
   <img src="images/icons/rewindtostart.png" border="0" class="icon-preview" />
    <img src="images/icons/rss.png" border="0" class="icon-preview" /> 
    <img src="images/icons/safe.png" border="0" class="icon-preview" /> 
    <img src="images/icons/scales.png" border="0" class="icon-preview" /> 
    <img src="images/icons/shoppingcart.png" border="0" class="icon-preview" />
     <img src="images/icons/speaker.png" border="0" class="icon-preview" />
      <img src="images/icons/speechbubble.png" border="0" class="icon-preview" /> 
      <img src="images/icons/speechmedia.png" border="0" class="icon-preview" />
       <img src="images/icons/star.png" border="0" class="icon-preview" /> 
       <img src="images/icons/trash.png" border="0" class="icon-preview" /> 
       <img src="images/icons/trend.png" border="0" class="icon-preview" /> 
       <img src="images/icons/world.png" border="0" class="icon-preview" /> 
       <br class="clear" />--> 
      
        </div><!-- End Icon Panel --> 
          <!-- Start Footer --> 
          <div id="footer">  <!-- Right Footer --> 
          <div id="footer-right">  
          <!---
          <div id="footer-subscribe"> 
           <form method="post" action="">
            <input id="email" type="text" onfocus="if (this.value == 'enter your email to subscribe!') {this.value = '';}" onblur="if (this.value == '') {this.value = 'enter your email to subscribe!';}" value="enter your email to subscribe!"> 
            <input type="submit" value="submit" id="email-submit"> </form>  
            </div>  
            <div id="social-icons">  
            <a title="Facebook" href="#">
            <img src="images/social-icons/facebook.png" border="0" /></a>
             <a title="Twitter" href="#"><img src="images/social-icons/twitter.png" border="0" /></a> 
             <a title="Google +" href="#"><img src="images/social-icons/googleplus.png" border="0" /></a> 
             <a title="LinkedIN" href="#"><img src="images/social-icons/linkedin.png" border="0" /></a> 
             <a title="Flickr" href="#"><img src="images/social-icons/flickr.png" border="0" /></a> 
             <a title="Vimeo" href="#"><img src="images/social-icons/vimeo.png" border="0" /></a> 
             <a title="RSS Feed" href="#"><img src="images/social-icons/feed.png" border="0" /></a>  </div>  
             </div>---><!-- End Right Footer -->   
             <!-- Left Footer --> <p class="footer-left">  
             Copyright @ 2013 CharkApps ~iSalon <br/> Created by Charmaine Keck and Joseph Gibson</a><br />
             
                </p><!-- End Left Footer -->  <br class="clear" />  
                </div><!-- End Footer -->  </div><!-- End Content Wrapper --> 
<!-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
						WHERE THE IPHONE IMAGES GO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% -->
                  <!-- Start iPhone Mockup --> <div id="iphone"> 
                  <div id="iPhone" ></div>
                  
                   <ul id="slides"> <li>
                   <img src="iSalonImages/mainPage.png" alt="Account screen" border="0" /></li> 
                   <li><img src="images/screens/skype.png" alt="Account screen" border="0" /></li>
                    <li><img src="images/screens/foursquare.png" alt="Account screen" border="0" /></li>
                     <li><img src="images/screens/appzap.jpg" alt="Account screen" border="0" /></li> 
                     <li><img src="images/screens/vimeo.png" alt="Account screen" border="0" /></li> 
                     <li><img src="images/screens/ps.png" alt="Account screen" border="0" /></li> </ul>  
                     <a href="#" id="homebutton" title="Download AppShow Now!">Click Me</a>  
                     
                     
                     <!-- style="width:223px; height:349px" -->
                     
                     
                     </div>
                     <!-- End iPhone Mockup -->  </div><!-- End Wrapper --> 
                      </div><!-- End Main Content -->  </div><!-- End Main Container -->  

</body>
</html>