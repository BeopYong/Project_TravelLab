package com.tlab.mvc.common.listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

import com.tlab.mvc.member.model.vo.Member;

/**
 * Application Lifecycle Listener implementation class SessionAttrListener
 * 
 */
@WebListener
public class SessionAttrListener implements HttpSessionAttributeListener {

    /**
     * Default constructor. 
     */
    public SessionAttrListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see HttpSessionAttributeListener#attributeAdded(HttpSessionBindingEvent)
     */
    public void attributeAdded(HttpSessionBindingEvent se)  { 
        //HttpSession session = se.getSession();
    	String name = se.getName();
        Object value =  se.getValue();
        System.out.println("attributeAdded : " + name +" = " + value);
        if(value instanceof Member){
        	Member loginMember = (Member) value;
        	System.out.println(loginMember.getMemberName() + "님이 로그인 했습니다.");
        }
//       HttpSession session = se.getSession();
//       세션리스너를 이용하여 팝업이나 행사 페이지 띄우기-> 쿠키방식이 나음
//       if (!("denied").equals(session.getAttribute("coupon")))
//       		session.setAttribute("coupon", "getCoupon");
    }

	/**
     * @see HttpSessionAttributeListener#attributeRemoved(HttpSessionBindingEvent)
     */
    public void attributeRemoved(HttpSessionBindingEvent se)  { 
    	String name = se.getName();
        Object value =  se.getValue();
        System.out.println("attributeRemoved : " + name+ " = " + value);
    }

	/**
     * @see HttpSessionAttributeListener#attributeReplaced(HttpSessionBindingEvent)
     */
    public void attributeReplaced(HttpSessionBindingEvent se)  { 
         // TODO Auto-generated method stub
    }
	
}
