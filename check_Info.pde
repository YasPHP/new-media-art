String passwordFinal; //<>// //<>//
String pass;
boolean verify;
boolean check(String usernamea, String passworda) {
  String key = "DC01633F5821678C";
  try {
    table = loadTable("new.csv", "header");
    pass = table.getString(2, usernamea);
    permissions = table.getString(3, usernamea);
  }
  catch(IllegalArgumentException e) {
    JOptionPane.showMessageDialog(null, "Error", "Username Does not Exist", JOptionPane.ERROR_MESSAGE);
  }
  catch(NullPointerException e) {
    println("ENTER VALUSE");
  }

  try {
    SecretKeySpec skeySpec_decode = new SecretKeySpec(key.getBytes("UTF-8"), "AES");

    Cipher cipher_decode = Cipher.getInstance("AES/ECB/PKCS5PADDING");
    cipher_decode.init(Cipher.DECRYPT_MODE, skeySpec_decode);

    byte[] decrypted_original = cipher_decode.doFinal(DatatypeConverter.parseBase64Binary(pass));
    String decrypt_originalString = new String(decrypted_original);
    passwordFinal= decrypt_originalString;
  }
  catch (Exception e) {
  }
  if (passworda.equals(passwordFinal)) {
    verify=true;
  } else {
    verify=false;
  }
  return verify;
}
