package utils;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Base64;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
//import model.Constants;
//import model.Employe;
import model.Utilisateur;
import org.mindrot.jbcrypt.BCrypt;
//import tools.EmailTools;
//import tools.Tools;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Base64;
import java.util.Properties;
import javax.servlet.http.HttpServletRequest;
import model.Utilisateur;

/**
 *
 * @author dev spat
 */
public class Utils {

    /**
     *
     * @param password
     * @return String of the hashed password
     */
    public static String hashPassword(String password) {
        try {

            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(password.getBytes());

            byte[] hashedPassword = md.digest();

            return Base64.getEncoder().encodeToString(hashedPassword);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     *
     * @param password
     * @param hash
     * @return boolean true if password is correct
     */
    public static boolean verifyHash(String password, String hash) {
        if (Utils.hashPassword(password).equals(hash)) {
            return true;
        }
        return false;
    }

    /**
     *
     * @param password
     * @param hash
     * @return boolean true if password is correct
     */
    public static boolean verifyHashBcrypt(String password, String hash) {
        return Utils.hashPasswordBcrypt(password).equals(hash) ? true : false;
    }

    /**
     * Getting input throught frontend not catching POST request
     *
     * @param request
     * @return String
     * @throws IOException
     */
    public static String getPostData(HttpServletRequest request) throws IOException {
        StringBuilder buffer = new StringBuilder();
        BufferedReader reader = request.getReader();
        String line;
        while ((line = reader.readLine()) != null) {
            buffer.append(line);
            buffer.append(System.lineSeparator());
        }
        return buffer.toString();
    }

    public static String hashPasswordBcrypt(String password) {
        String salt = BCrypt.gensalt(12);
        return BCrypt.hashpw(password, salt);
    }

    // Check if a password matches the stored hash
    public static boolean checkPasswordBcrypt(String password, String storedHash) {
        try {
            storedHash = storedHash != null ? storedHash : "";
            System.out.println("comparing: " + password + " to stored hash " + storedHash);
            //return 
            boolean result = BCrypt.checkpw(password, storedHash);
            if (result) {
                System.out.println("password ok");
            } else {
                System.out.println("password not ok");
            }
            return result;

        } catch (Exception e) {
            System.out.print("Wrong user password:" + e.getMessage());
        }
        return false;
    }

    public static boolean sendEmailUpdatePassword() {
        String smtpHostServer = "smtp.gmail.com";
        String emailID = "ingitspat@gmail.com";

        Properties props = System.getProperties();

        props.put("mail.smtp.host", smtpHostServer);

        Session session = Session.getInstance(props, null);

        EmailTools.sendEmail(session, emailID, "SimpleEmail Testing Subject", "SimpleEmail Testing Body");

        return true;
    }

    public static void sendEmailUpdatePasswordTls() {
        final String fromEmail = "ingitspat@gmail.com"; //requires valid gmail id
        final String password = "fehf ndlg fzsg ldfv"; // correct password for gmail id
        final String toEmail = "example@gmail.com"; // can be any email id 

        System.out.println("TLSEmail Start");
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
        props.put("mail.smtp.port", "587"); //TLS Port
        props.put("mail.smtp.auth", "true"); //enable authentication
        props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS

        //create Authenticator object to pass in Session.getInstance argument
        Authenticator auth = new Authenticator() {
            //override the getPasswordAuthentication method
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        };
        Session session = Session.getInstance(props, auth);

        EmailTools.sendEmail(session, toEmail, "Confirmer nouveau mot de passe", "Vous devez confirmer votre mot de passe? Voici le lien de confirmation du nouveau mdp: <a href=\"https://localhost:8085/rhperf/confirmpassword\" target=\"_blank\">Confirmer mdp</a>.");
    }

    public static boolean sendEmailUpdatePasswordSSL(Utilisateur targetUser, String confirmUrl, String baseUrl) {
        final String fromEmail = "ingitspat@gmail.com";
        final String password = "fehf ndlg fzsg ldfv";
        String toEmail = "example@gmail.com";

//        if (targetUser != null) {
//            toEmail = targetUser.getEmail();
//        }
        System.out.println("SSLEmail Start");
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465"); //SSL Port
        props.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory"); //SSL Factory Class
        props.put("mail.smtp.auth", "true"); //Enabling SMTP Authentication
        props.put("mail.smtp.port", "465"); //SMTP Port

        Authenticator auth = new Authenticator() {
            //override the getPasswordAuthentication method
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        };
        Session session = Session.getDefaultInstance(props, auth);
        System.out.println("Session created");
        EmailTools.sendEmail(session, toEmail, "Confirmer nouveau mot de passe",
                "Vous devez confirmer votre mot de passe? Voici le lien de confirmation du nouveau mot de passe: " + baseUrl + "/rhperf/confirmpassword/?id=" + targetUser.getId() + "&url=" + confirmUrl);

//	        EmailTools.sendAttachmentEmail(session, toEmail,"SSLEmail Testing Subject with Attachment", "SSLEmail Testing Body with Attachment");
//
//	        EmailTools.sendImageEmail(session, toEmail,"SSLEmail Testing Subject with Image", "SSLEmail Testing Body with Image");
        return true;
    }

    public static void sendEmailTLS(String userEmail, String emailObject, String userEmailBody) {
        final String fromEmail = "ingitspat@gmail.com"; //requires valid gmail id
        final String password = "fehf ndlg fzsg ldfv"; // correct password for gmail id
        final String toEmail = userEmail; // can be any email id 

//        sc.log("TLSEmail Start");
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
        props.put("mail.smtp.port", "587"); //TLS Port
        props.put("mail.smtp.auth", "true"); //enable authentication
        props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
        props.put("mail.debug", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2"); //TLSv1.2 and TLSv1.3 are ok
        //create Authenticator object to pass in Session.getInstance argument
        Authenticator auth = new Authenticator() {
            //override the getPasswordAuthentication method
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        };
        Session session = Session.getInstance(props, auth);

        EmailTools.sendEmail(session, toEmail, emailObject,
                userEmailBody);
    }

    public static void sendEmailUpdatePasswordTLS(String userEmail, String emailObject, String userEmailBody, String baseURL) {
        final String fromEmail = "ingitspat@gmail.com"; //requires valid gmail id
        final String password = "fehf ndlg fzsg ldfv"; // correct password for gmail id
        final String toEmail = userEmail; // can be any email id 

//        sc.log("TLSEmail Start");
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
        props.put("mail.smtp.port", "587"); //TLS Port
        props.put("mail.smtp.auth", "true"); //enable authentication
        props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
        props.put("mail.debug", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2"); //TLSv1.2 and TLSv1.3 are ok

        Authenticator auth = new Authenticator() {
            //override the getPasswordAuthentication method
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        };
        Session session = Session.getInstance(props, auth);

        EmailTools.sendEmail(session, toEmail, emailObject,
                userEmailBody);
    }

    public static void sendEmailWithAttachment(ByteArrayOutputStream outStream, String fileName, String periode, String matricule, String userEmail, String mimeType) {
        final String fromEmail = "ingitspat@gmail.com"; //requires valid gmail id
        final String password = "fehf ndlg fzsg ldfv"; // correct password for gmail id
        final String toEmail = userEmail; // can be any email id 

//        sc.log("TLSEmail Start");
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
        props.put("mail.smtp.port", "587"); //TLS Port
        props.put("mail.smtp.auth", "true"); //enable authentication
        props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
        props.put("mail.debug", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2"); //TLSv1.2 and TLSv1.3 are ok

        Authenticator auth = new Authenticator() {
            //override the getPasswordAuthentication method
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        };
        Session session = Session.getInstance(props, auth);
        String environnement = " ";
//        if(Constants.DB_USERNAME != "rh_perf_prod")
//                            environnement = "TEST";
//        int matricule_eval = eval.getMatricule(); 
//        String Object = environnement+" Evaluation de l'agent: "+emp.getMatricule()+" PAR "+eval.getMatricule()+", periode: "+periode;
//        String Corps = "<p>Bonjour,</p>" +
//"		<p>L'évaluation de l'agent portant le matricule "+emp.getMatricule()+" est terminée.</p>" +
//"		<table style='border-collapse: collapse;'>" +
//"		    <tr>" +
//"			   <td style='padding: 8px; font-weight: bold;width:75px;'>Évaluateur </td>" +
//"			   <td style='padding: 8px;'>"+eval.getMatricule()+", "+eval.getNom()+" "+eval.getPrenom()+"</td>" +
//"			</tr> " +
//"			<tr>" +
//"			   <td style='padding: 8px; font-weight: bold;width:30px;'>Nom et Prénom </td>" +
//"			   <td style='padding: 8px;'>"+emp.getNom()+" "+emp.getPrenom()+"</td>" +
//"			</tr> " +
//"			<tr>" +
//"			   <td style='padding: 8px; font-weight: bold;width:30px;'>Fonction </td>" +
//"			   <td style='padding: 8px;'>"+emp.getPostlib()+"</td>" +
//"			</tr> " +
//"			<tr>" +
//"			   <td style='padding: 8px; font-weight: bold;width:30px;'>Domaine </td>" +
//"			   <td style='padding: 8px;'>"+emp.getDomaine()+"</td>" +
//"			</tr> " +
//"			<tr>" +
//"			   <td style='padding: 8px; font-weight: bold;width:30px;'>Direction </td>" +
//"			   <td style='padding: 8px;'>"+emp.getLabel()+"</td>" +
//"			</tr> " +
//"		</table><br>" +
//"		<p>Veuillez trouver en pièce jointe le formulaire d'évaluation  rempli.</p>";

//        int matricule_agent = emp.getMatricule();
//        String period = periode;
//        EmailTools.sendEmailWithAttachmentFromStream(session, userEmail,Object , Corps,  outStream,  fileName, mimeType); 
    }

    public static String getRandomBytes(int lengthBytes) {
        SecureRandom random = new SecureRandom();
        byte[] bytes = new byte[lengthBytes];
        if (lengthBytes < 0) {
            lengthBytes = 16;
        }
        random.nextBytes(bytes);

        return Utils.bytesToHex(bytes);
    }

    /**
     * Convert bytes to hex format
     *
     * @param bytes
     * @return string
     */
    private static String bytesToHex(byte[] bytes) {
        StringBuilder hexString = new StringBuilder();
        for (byte b : bytes) {
            hexString.append(String.format("%02x", b));
        }
        return hexString.toString();
    }

    public static String formatDateString(String inputDateStr) {
        String inputPattern = "yyyy-MM-dd";
        String outputPattern = "dd/MM/yyyy";

        SimpleDateFormat inputFormat = new SimpleDateFormat(inputPattern);
        SimpleDateFormat outputFormat = new SimpleDateFormat(outputPattern);

        java.util.Date date = null;
        try {
            date = (java.util.Date) inputFormat.parse(inputDateStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        return outputFormat.format(date);
    }

    public static String formatDateTimestamp(String inputTimestamp) throws ParseException {
        // Cut microseconds to milliseconds (first 3 digits only)
        if (inputTimestamp.contains(".")) {
            int dotIndex = inputTimestamp.indexOf(".");
            inputTimestamp = inputTimestamp.substring(0, dotIndex + 4); // keep 3 digits after dot
        }

        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
        SimpleDateFormat outputFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");

        java.util.Date formatedDate = inputFormat.parse(inputTimestamp);

        return outputFormat.format(formatedDate);
    }

    public static LocalDate getCurrentDate() {
        LocalDate localDate = LocalDate.now();

        return localDate;
    }

    public static LocalTime getCurrentTime() {
        //LocalTime lt = LocalTime.of(8, 0);
        return LocalTime.of(8, 0);
    }
}
