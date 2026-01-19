package utils;
 
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.util.ByteArrayDataSource;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.Date;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.util.ByteArrayDataSource;

public class EmailTools {

    /**
     * Utility method to send simple HTML email
     *
     * @param session
     * @param toEmail
     * @param subject
     * @param body
     */
    public static void sendEmail(Session session, String toEmail, String subject, String body) {
        try {
            MimeMessage msg = new MimeMessage(session);
            //set message headers
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            msg.addHeader("format", "flowed");
            msg.addHeader("Content-Transfer-Encoding", "8bit");

            msg.setFrom(new InternetAddress("no_reply@example.com", "NoReply-IT SPAT"));

            msg.setReplyTo(InternetAddress.parse("no_reply@example.com", false));

            msg.setSubject(subject, "UTF-8");

            //msg.setText(body, "UTF-8"); 
            msg.setContent(body, "text/html; charset=utf-8");

            msg.setSentDate(new Date());

            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
            System.out.println("Message is ready");

            try {
                Transport.send(msg);

                //sc.log("Email Sent Successfully!!");
                System.out.println("EMail Sent Successfully!!");
                System.err.println(">>>  EMail Sent successfully!!");
                System.err.flush();
            } catch (Exception e) {
                System.out.println("Error sending email: " + e.getMessage());
            }
            System.out.println("EMail Sent Successfully!!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void sendEmailWithAttachmentFromStream(Session session, String toEmail, String subject, String body, ByteArrayOutputStream outputStream, String fileName, String mimeType) {
        try {
            MimeMessage msg = new MimeMessage(session);

            // Set headers
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            msg.addHeader("format", "flowed");
            msg.addHeader("Content-Transfer-Encoding", "8bit");

            msg.setFrom(new InternetAddress("no_reply@example.com", "NoReply-IT SPAT"));
            msg.setReplyTo(InternetAddress.parse("no_reply@example.com", false));

            msg.setSubject(subject, "UTF-8");
            msg.setSentDate(new Date());
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));

            // Create multipart message
            Multipart multipart = new MimeMultipart();

            // Body part
            MimeBodyPart messageBodyPart = new MimeBodyPart();
            messageBodyPart.setContent(body, "text/html; charset=utf-8");
            multipart.addBodyPart(messageBodyPart);

            // Attachment part (from outputStream)
            if (outputStream != null) {
                MimeBodyPart attachmentPart = new MimeBodyPart();

                // Convert outputStream to inputStream
                ByteArrayOutputStream baos = (ByteArrayOutputStream) outputStream;
                InputStream is = new ByteArrayInputStream(baos.toByteArray());

                DataSource source = new ByteArrayDataSource(is, mimeType);
                attachmentPart.setDataHandler(new DataHandler(source));
                attachmentPart.setFileName(fileName);

                multipart.addBodyPart(attachmentPart);
            }else{
                System.out.println("Bytestream null");
            }

            // Set the complete message
            msg.setContent(multipart);

            // Send message
            Transport.send(msg);

            System.out.println("Email Sent Successfully with attachment!");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error sending email with attachment: " + e.getMessage());
        }
    }

}
