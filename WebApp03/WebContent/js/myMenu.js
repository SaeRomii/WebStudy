/**
 * myMenu.js
 */

function myMenu(status)
{
	var menu = document.getElementById("menuTable");
	
	if (status==1)
	{
		// 블럭처럼 그릴거야
		menu.style.display = "block";
	}
	else
	{
		// 안그릴거야
		menu.style.display = "none";
	}
}

/* 상태값 넘어가게 분기처리
function myMenu1()
{
	
}

function myMenu2()
{
	
}
*/