/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;
  
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
  
/**
 * A utility class for sending e-mail messages
 * @author www.codejava.net
 *
 */
public class EmailUtility {
    public static void sendEmail(String host, String port,
            final String senderEmail, String senderName, final String password,
            String recipientEmail, String subject, String message) throws AddressException,
            MessagingException, UnsupportedEncodingException {
  
        // sets SMTP server properties
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
  
        // creates a new session with an authenticator
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, password);
            }
        };
  
       
        Session session = Session.getInstance(properties, auth);
        // creates a new e-mail message
        Message msg = new MimeMessage(session);
  
        msg.setFrom(new InternetAddress(senderEmail, senderName));
        InternetAddress[] toAddresses = { new InternetAddress(recipientEmail) };
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setSubject(subject);
        msg.setSentDate(new Date());
        msg.setText(message);
        
        // sends the e-mail
        Transport.send(msg);
  
    }
     public static void sendEmail_1(String host, String port,
            final String senderEmail, String senderName, final String password,
            String recipientEmail, String subject, String message) throws AddressException,
            MessagingException, UnsupportedEncodingException, IOException {
  
       
        // sets SMTP server properties
         
        // creates a new session with an authenticator
       Properties pro = new Properties();
       pro =getMailProperties(host, port);
       Authenticator auth = new Authenticator() {
           
        
       };
       auth = getMailAuth(senderEmail, password);
       Session session = getMailSession(pro, auth); 
  
       
       final Multipart parts = new MimeMultipart ( "alternative" );

       

        // set HTML, optionally

        final MimeBodyPart htmlPart = new MimeBodyPart ();
        htmlPart.setContent ( message, "text/html; charset=utf-8" );
        parts.addBodyPart ( htmlPart );

        // set parts

        
        // creates a new e-mail message
        Message msg = new MimeMessage(session);
  
        msg.setFrom(new InternetAddress(senderEmail, senderName));
        InternetAddress[] toAddresses = { new InternetAddress(recipientEmail) };
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setSubject(subject);
        msg.setSentDate(new Date());
        msg.setContent(parts);
        msg.saveChanges();
        // sends the e-mail
        Transport.send(msg);
  
    }
      // sets SMTP server properties
     public static Properties getMailProperties(String host,String port){
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        return properties;
     }
     public static Session getMailSession(Properties pro,Authenticator auth){
          Session session = Session.getInstance(pro, auth);
          return session;
     }
             
             
    public static Authenticator getMailAuth(String senderEmail,String password ){
         Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, password);
            }
        };
         return auth;
    }
}
