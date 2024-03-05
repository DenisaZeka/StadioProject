<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin page</title>
<style><%@include file="/resources/css/admin.css"%></style>
</head>
<body>
 <div class="admin-login-container">
      <div class="login-admin">

        <form action=loginAdmin method="get">
          <div class="login-admin-section" >
          ${success}
            <label for="admin-name" class="subtitle">ADMIN NAME</label>
            <input type="text" required="" id="admin_name" name="admin_name" />
          </div>
          <div class="login-admin-section">
            <label for="admin-password" class="subtitle">ADMIN PASSWORD</label>
            <div class="pwd-icon-container">
              <img src="resources/img/pw-visible.svg" alt="" clicked="false" />
            </div>
            <input type="password" required="" id="admin_password" name="admin_password"/>
          </div>
          <input class="btn" type="submit" value="LOGIN" />
        </form>
        
      </div>
    </div>
    <script>
    const adminPwdChange = document.querySelector(".login-admin img");
    adminPwdChange.addEventListener("click", () => {
      const adminPasswordLogin = document.querySelector("#admin_password");
      if (adminPwdChange.getAttribute("clicked") === "true") {
        adminPwdChange.setAttribute("src", "resources/img/pw-visible.svg");
        adminPwdChange.setAttribute("clicked", "false");
        adminPasswordLogin.type = "password";
      } else {
        adminPwdChange.setAttribute("src", "resources/img/pw-not-visible.svg");
        adminPwdChange.setAttribute("clicked", "true");
        adminPasswordLogin.type = "text";
      }
    });

    /*

    */
</script>
</body>
</html>