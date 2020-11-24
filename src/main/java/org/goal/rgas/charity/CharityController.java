package org.goal.rgas.charity;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@RestController
@RequestMapping("/charity")
public class CharityController {
	@Value("${gmailId}")
	final String user = null;
	@Value("${gmailPassword}")
	final String password = null;
	@Autowired
	public CharityServiceImpl charityServiceImpl;

	@GetMapping("/form")
	public ModelAndView charityRegisterForm() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("charity/register");

		return mv;
	}

	@PostMapping
	public ModelAndView charityRegister(Charity charity) {
		ModelAndView mv = new ModelAndView(new RedirectView("charity"));
		try {
			charityServiceImpl.charityRegister(charity);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@GetMapping
	public ModelAndView charityList(Charity charity) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("charity/list");
		try {
			mv.addObject("charityList", charityServiceImpl.charityList(charity));
			send();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@GetMapping("/{no}")
	public ModelAndView charityInquiry(Charity charity) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("charity/inquiry");
		try {
			mv.addObject("charity", charityServiceImpl.charityInquiry(charity));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@PutMapping
	public ModelAndView charityModify(Charity charity) {
		ModelAndView mv = new ModelAndView(new RedirectView("charity/" + charity.getNo()));
		try {
			charityServiceImpl.charityModify(charity);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@DeleteMapping
	public ModelAndView charityDelete(Charity charity) {
		ModelAndView mv = new ModelAndView(new RedirectView("charity"));
		try {
			charityServiceImpl.charityDelete(charity);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	public void send() {
		System.out.println("??");
		String host = "smtp.gmail.com";
		final String user = null;
		final String password = null;

		String to = "jj04090@naver.com";
		
		// Get the session object
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		props.put("mail.smtps.starttls.enable", "true");
		props.put("	mail.smtp.starttls.required", "true");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.socketFactory.port", "465");
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		// Compose the message
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			// Subject
			message.setSubject("테스트 메일입니다.아아ㅏㅇ");

			// Text
			message.setText("asdfaslkfja;slkfj;asljf;lsajlfjlaskj;lkfj;asjfjlsj");

			// send the message
			Transport.send(message);
			System.out.println("message sent successfully...");

		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
