package org.goal.rgas.emailcertification;

import java.util.Properties;
import java.util.UUID;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class EmailCertificationServiceImpl implements EmailCertificationService {
	@Value("${gmailid}")
	String gmailId;
	@Value("${gmailpassword}")
	String gmailpassword;

	@Override
	public String certifiedCodeSend(String email, String code) {
		String host = "smtp.gmail.com";
		
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
				return new PasswordAuthentication(gmailId, gmailpassword);
			}
		});
		// 6자리 랜덤인증코드 생성

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(gmailId));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			System.out.println(email);
			System.out.println(code);
			// 메일 제목
			message.setSubject("RGAS 회원가입 이메일 인증코드입니다.");
			// 메일 내용
			message.setText("\t\t이메일 인증코드 : " + code);
			// 매일 발송
			Transport.send(message);
			System.out.println("message sent successfully...");
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		return code;
	}
}
