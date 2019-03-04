import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import javax.xml.bind.DatatypeConverter;
import javax.swing.JOptionPane;
int screen = 0;
int k=0;
float x=5;
float y=0;
float z=10;
float r=0;
String usernamec;
String passwordc;
Object state;
String permissions;
int loginState = 0;
int exerciseState=0;
byte[] epassword;
Table table;
void setup() {
  background(0);
  surface.setResizable(true);
}
void draw() {
  if (loginState==0) {
    String permissions[] = new String [3];
    permissions[0]= "User";
    permissions[1]="Expanded User";
    permissions[2]="Super User";
    background(201, 122);
    surface.setSize(600, 600);
    loop();
    textSize(30);
    textAlign(CENTER);
    fill(255);
    rect(100, 300, 200, 100);
    rect(300, 300, 200, 100);
    fill(0);
    text("Login", 400, 350);
    text("Sign Up", 200, 350);
    String username;
    String password;


    if (mouseArea(300, 500, 300, 400)) {
      username = JOptionPane.showInputDialog("Username");
      if (username==null||username.length()<0) {
        JOptionPane.showMessageDialog(null, "Please Enter Username", "Enter Username", JOptionPane.ERROR_MESSAGE);
        mousePressed=false;
      } 
      if (username!=null&&username.length()>0) {
        password=JOptionPane.showInputDialog("Password");

        if (password==null||password.length()<1) {
          JOptionPane.showMessageDialog(null, "Please Enter Password", "Enter Username", JOptionPane.ERROR_MESSAGE);
        } 
        if (password!=null) {
          if (check(username, password)) {
            JOptionPane.showMessageDialog(null, "Correct", "You are now logged in", JOptionPane.INFORMATION_MESSAGE);
            loginState=1;
            mousePressed=false;
          } else 
          {
            JOptionPane.showMessageDialog(null, "Wrong", "Wrong password", JOptionPane.ERROR_MESSAGE);
          }
        }
      }
    }
    if (mouseArea(100, 300, 300, 400)) {
      usernamec=JOptionPane.showInputDialog("Enter a Username");

      if (usernamec==null||usernamec.length()<1) {
        JOptionPane.showMessageDialog(null, "Please Enter Username", "Enter Username", JOptionPane.ERROR_MESSAGE);
        mousePressed=false;
      }
      if (usernamec!=null&&usernamec.length() > 0) {
        passwordc=JOptionPane.showInputDialog("Enter a Password");
        if (passwordc==null||usernamec.length() < 1) {
          JOptionPane.showMessageDialog(null, "Please Enter Password", "Enter Password", JOptionPane.ERROR_MESSAGE);

        } else {
          Object permis =JOptionPane.showInputDialog(null, "Select Permissions", "Permissions Selection", JOptionPane.QUESTION_MESSAGE, null, permissions, "User");
          state=permis;
          if (permis==null) {
            JOptionPane.showMessageDialog(null, "Select Permissions! User Not Created", "Select Permissions", JOptionPane.ERROR_MESSAGE);
            mousePressed=false;
          } else {
            try {

              String message= passwordc;  
              String key = "DC01633F5821678C";
              SecretKeySpec skeySpec_encode = new SecretKeySpec(key.getBytes("UTF-8"), "AES");
              Cipher cipher_encode = Cipher.getInstance("AES/ECB/PKCS5PADDING");
              cipher_encode.init(Cipher.ENCRYPT_MODE, skeySpec_encode);
              byte[] encryptedpass = cipher_encode.doFinal(message.getBytes());
              epassword= encryptedpass;
              String base64_encrypted = DatatypeConverter.printBase64Binary(encryptedpass);
              println(base64_encrypted);
            } 
            catch (Exception ex) {
              ex.printStackTrace();
            }





            table = loadTable("new.csv", "header");
            table.addColumn(usernamec);
            table.setString(2, usernamec, DatatypeConverter.printBase64Binary(epassword));
            table.setString(3, usernamec, state.toString());
            saveTable(table, "data/new.csv");
          }
        }
      }
    }
  }
  if (loginState==1) {
    home();
  }

  if (exerciseState==1) {
    exercise1();
    loginState=2;
  }

  if (exerciseState==2) {
    exercise2();
    loginState=2;
  }
  if (exerciseState==3) {
    exercise3();
    loginState=2;
  }
  if (exerciseState==4) {
    exercise4();
    loginState=2;
  }
  if (exerciseState==5) {
    exercise5();
    loginState=2;
  }
  if (exerciseState==6) {
    exercise6();
    loginState=2;
  }
  if (exerciseState==7) {
    exercise7();
    loginState=2;
  }
  if (exerciseState==8) {
    exercise8();
    loginState=2;
  }
  if (exerciseState==9) {
    exercise9();
    loginState=2;
  }
  if (exerciseState==10) {
    exercise10();
    loginState=2;
  }
  if (exerciseState==11) {
    exercise11();
    loginState=2;
  }
}
boolean mouseArea(int x1, int x2, int y1, int y2) {
  return mousePressed && mouseX > x1 && mouseX < x2 && mouseY>y1 && mouseY <y2;
}
