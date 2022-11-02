function genPassword() {
  let chars =
    "0123456789abcdefghijklmnopqrstuvwxyz!@#$%^&*()ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  let passwordLength = 12;
  let password = "";

  for (let i = 0; i <= passwordLength; i++) {
    let randomNumber = Math.floor(Math.random() * chars.length);
    password += chars.substring(randomNumber, randomNumber + 1);
  }

  document.getElementById("password").value = password;
}

function copyPassword() {
  let copyText = document.getElementById("password");
  copyText.select();
  document.execCommand("copy");
}

function saltPassword() {
  let saltyPassword = document.getElementById("SHpassword").value + "salt";
  document.getElementById("SHpassword").value = saltyPassword;
}

// Convert to 32bit integer
function hashPassword() {
  string = document.getElementById("SHpassword").value;
  let hash = 0;

  if (string.length == 0) {
    document.getElementById("SHpassword").value = hash;
  }

  for (i = 0; i < string.length; i++) {
    char = string.charCodeAt(i);
    hash = (hash << 5) - hash + char;
    hash = hash & hash;
  }

  document.getElementById("SHpassword").value = hash;
}
