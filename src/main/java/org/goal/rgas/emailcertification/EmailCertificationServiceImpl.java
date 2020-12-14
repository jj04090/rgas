package org.goal.rgas.emailcertification;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

@PropertySource("classpath:email.properties")
@Service
public class EmailCertificationServiceImpl implements EmailCertificationService {
	// 구글이메일 아이디
	@Value("${gmailid}")
	private String gmailId;

	// 구글이메일 비밀번호
	@Value("${gmailpassword}")
	private String gmailpassword;

	// 이메일 인증코드 전송
	@Override
	public String certifiedCodeSend(String email, String code) {
		String host = "smtp.gmail.com";

		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		props.put("mail.smtps.starttls.enable", "true");
		props.put("mail.smtp.starttls.required", "true");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.socketFactory.port", "465");

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {

				return new PasswordAuthentication(gmailId, gmailpassword);
			}
		});

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(gmailId));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			message.setSubject("RGAS 회원가입 이메일 인증코드입니다.");
			message.setText("\t\t이메일 인증코드 : " + code);

			Transport.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}

		return code;
	}
}
