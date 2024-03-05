<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style><%@include file="/resources/css/admin.css"%></style>
<style><%@include file="/resources/css/pitch.css"%></style>
<body>
 <div class="overSection"></div>
    <div class="main-container">
      <div class="side-bar">
        <div class="side-bar-section">
          <span class="section-title">EVENTS</span>
          <div class="section-subtitles-container">
            <span class="section-subtitle">VIEW EVENTS</span>
            <span class="section-subtitle" id="add-event">ADD EVENT</span>
            <span class="section-subtitle">ADD EVENT CATEGORY</span>
          </div>
        </div>
        <div class="side-bar-section">
          <span class="section-title">ADMINS</span>
          <div class="section-subtitles-container">
            <span class="section-subtitle">VIEW ADMINS</span>
            <span class="section-subtitle" id="add-admin">ADD ADMIN</span>
          </div>
        </div>
        <div class="side-bar-section">
          <span class="section-title">STATISTICS</span>
          <div class="section-subtitles-container">
            <span class="section-subtitle">SALES</span>
          </div>
        </div>
        <div class="side-bar-section">
          <span class="section-title" id="logout">LOGOUT</span>
        </div>
      </div>
      <div class="content-container"></div>
    </div>
    <script>
    const addEvent = document.querySelector("#add-event");
    const contentContainer = document.querySelector(".content-container");
    const overSection = document.querySelector(".overSection");
    let seatsObject = {
      curvaNord: [],
      curvaSud: [],
      nordA: [],
      nordB: [],
      nordC: [],
      sudA: [],
      sudB: [],
      sudC: [],
    };

    addEvent.addEventListener("click", () => {
      contentContainer.innerHTML = `
        <div class="add-event-container">
        <form class="eventForm">
            <div class="add-event-top-container">
                <div class="add-event-section" id="left">
                <div class="input-section">
                    <label for="event-name" class="input-title">EVENT NAME</label>
                    <input
                    type="text"
                    name="event-name"
                    id="event-name"
                    class="input"
                    required
                    />
                </div>
                <div class="input-section">
                    <label for="event-date" class="input-title">EVENT DATE</label>
                    <input
                    type="datetime-local"
                    id="event-date"
                    name="event-date"
                    min="2023-07-07T00:00"
                    required
                    />
                </div>
                <div class="input-section">
                    <label for="event-category" class="input-title"
                    >EVENT CATEGORY</label
                    >
                    <select
                    name="event-category"
                    id="event-category"
                    class="select"
                    required
                    ></select>
                </div>
                <div class="input-section">
                    <label for="event-price" class="input-title">EVENT PRICE</label>
                    <input
                    type="number"
                    id="event-price"
                    name="event-price"
                    min="10"
                    value="10"
                    required
                    />
                </div>
                </div>
                <div class="add-event-section" id="right">
                <div class="image-input-conatiner">
                    <label class="custum-file-upload" for="event-image">
                    <div class="icon">
                        <svg
                        xmlns="http://www.w3.org/2000/svg"
                        fill=""
                        viewBox="0 0 24 24"
                        >
                        <g stroke-width="0" id="SVGRepo_bgCarrier"></g>
                        <g
                            stroke-linejoin="round"
                            stroke-linecap="round"
                            id="SVGRepo_tracerCarrier"
                        ></g>
                        <g id="SVGRepo_iconCarrier">
                            <path
                            fill=""
                            d="M10 1C9.73478 1 9.48043 1.10536 9.29289 1.29289L3.29289 7.29289C3.10536 7.48043 3 7.73478 3 8V20C3 21.6569 4.34315 23 6 23H7C7.55228 23 8 22.5523 8 22C8 21.4477 7.55228 21 7 21H6C5.44772 21 5 20.5523 5 20V9H10C10.5523 9 11 8.55228 11 8V3H18C18.5523 3 19 3.44772 19 4V9C19 9.55228 19.4477 10 20 10C20.5523 10 21 9.55228 21 9V4C21 2.34315 19.6569 1 18 1H10ZM9 7H6.41421L9 4.41421V7ZM14 15.5C14 14.1193 15.1193 13 16.5 13C17.8807 13 19 14.1193 19 15.5V16V17H20C21.1046 17 22 17.8954 22 19C22 20.1046 21.1046 21 20 21H13C11.8954 21 11 20.1046 11 19C11 17.8954 11.8954 17 13 17H14V16V15.5ZM16.5 11C14.142 11 12.2076 12.8136 12.0156 15.122C10.2825 15.5606 9 17.1305 9 19C9 21.2091 10.7909 23 13 23H20C22.2091 23 24 21.2091 24 19C24 17.1305 22.7175 15.5606 20.9844 15.122C20.7924 12.8136 18.858 11 16.5 11Z"
                            clip-rule="evenodd"
                            fill-rule="evenodd"
                            ></path>
                        </g>
                        </svg>
                    </div>
                    <div class="text">
                        <span>Click to upload image</span>
                    </div>
                    <input
                        type="file"
                        id="event-image"
                        accept="image/png, image/gif, image/jpeg"
                        required
                    />
                    </label>
                </div>
                <div class="image-selected-container">
                    <img src="resources/img/default-placeholder.png" alt="" class="image-selected" />
                </div>
                <div class="seat-selector">SELECT SEATS</div>
                </div>
            </div>
            <button class="add-event-btn">ADD EVENT</button>
            </form>
        </div>`;
      const imgInput = document.querySelector("#event-image");
      const selectedImg = document.querySelector(".image-selected");
      imgInput.addEventListener("change", () => {
        const file = imgInput.files[0];
        const reader = new FileReader();
        reader.onload = () => {
          image = reader.result;
          selectedImg.src = image;
        };
        reader.readAsDataURL(file);
      });
      const selectSeatsBtn = document.querySelector(".seat-selector");
      selectSeatsBtn.addEventListener("click", () => {
        overSection.style.display = "flex";
        overSection.innerHTML = `
            <div class="pitch-container">
            <img src="../x-menu-icon.svg" class="close-pitch" alt=""/>
            <div class="stage-container">
              <div class="stage">STAGE</div>
            </div>
            <div class="sectors-container">
              <div class="sectors" id="left">
                <span class="sector-name">CORRIDOIO OVEST</span>
                <div class="subsectors-container"><div class="subsector clickable" position="CORRIDOIO OVEST A">A</div><div class="subsector clickable" position="CORRIDOIO OVEST B">B</div><div class="subsector clickable" position="CORRIDOIO OVEST C">C</div><div class="subsector clickable" position="CORRIDOIO OVEST D">D</div><div class="subsector clickable" id="lateral-center" position="CORRIDOIO OVEST E">E</div></div>
              </div>
              <div class="sectors" id="center">
                <span class="sector-name">PARTERRE</span>
                <div class="subsectors-container" id="top"><div class="subsector clickable" position="PARTERRE A" id="normal">A</div><div class="subsector clickable" position="PARTERRE B" id="normal">B</div><div class="subsector clickable" position="PARTERRE C" id="normal">C</div><div class="subsector clickable" position="PARTERRE D" id="normal">D</div><div class="subsector clickable" position="PARTERRE E" id="normal">E</div><div class="subsector clickable" position="PARTERRE F" id="normal">F</div><div class="subsector clickable" position="PARTERRE G" id="center-center">G</div><div class="subsector clickable" position="PARTERRE H" id="center-center">H</div></div>
              </div>
              <div class="sectors" id="right">
                <span class="sector-name">CORRIDOIO EST</span>
                <div class="subsectors-container"><div class="subsector clickable" position="CORRIDOIO EST A">A</div><div class="subsector clickable" position="CORRIDOIO EST B">B</div><div class="subsector clickable" position="CORRIDOIO EST C">C</div><div class="subsector clickable" position="CORRIDOIO EST D">D</div><div class="subsector clickable" id="lateral-center" position="CORRIDOIO EST E">E</div></div>
              </div>
            </div>
          </div>`;
        const closePitch = document.querySelector(".close-pitch");
        closePitch.addEventListener("click", () => {
          overSection.innerHTML = "";
          overSection.style.display = "none";
        });
      });
    });

    const addAdmin = document.querySelector("#add-admin");

    addAdmin.addEventListener("click", () => {
      contentContainer.innerHTML = `
        <div class="add-admin-container">
            <div class="input-section-2">
                <label for="admin-name" class="input-title">ADMIN NAME</label>
                <input
                    type="text"
                    name="admin-name"
                    id="admin-name"
                    class="input"
                />
            </div>
            <div class="input-section-2">
                <div class="pwd-icon-container">
                    <img src="resources/img/pw-visible.svg" alt="" clicked="false" id="pwd1">
                </div>
                <label for="admin-password" class="input-title"
                    >ADMIN PASSWORD</label
                >
                <input
                    type="password"
                    name="admin-password"
                    id="admin-password"
                    class="input"
                />
            </div>
            <div class="input-section-2">
                <div class="pwd-icon-container">
                    <img src="resources/img/pw-visible.svg" alt="" clicked="false" id="pwd2">
                </div>
                <label for="admin-password-2" class="input-title"
                    >REPEAT ADMIN PASSWORD</label
                >
                <input
                    type="password"
                    name="admin-password-2"
                    id="admin-password-2"
                    class="input"
                />
            </div>
            <div class="add-admin-btn">ADD ADMIN</div>
        </div>`;

      const pwd1Icon = document.querySelector("#pwd1");
      const pwd2Icon = document.querySelector("#pwd2");
      const adminPassword = document.querySelector("#admin-password");
      const adminPassword2 = document.querySelector("#admin-password-2");

      pwd1Icon.addEventListener("click", () => {
        if (pwd1Icon.getAttribute("clicked") === "true") {
          pwd1Icon.setAttribute("src", "resources/img/pw-visible.svg");
          pwd1Icon.setAttribute("clicked", "false");
          adminPassword.type = "password";
        } else {
          pwd1Icon.setAttribute("src", "resources/img/pw-not-visible.svg");
          pwd1Icon.setAttribute("clicked", "true");
          adminPassword.type = "text";
        }
      });

      pwd2Icon.addEventListener("click", () => {
        if (pwd2Icon.getAttribute("clicked") === "true") {
          pwd2Icon.setAttribute("src", "resources/img/pw-visible.svg");
          pwd2Icon.setAttribute("clicked", "false");
          adminPassword2.type = "password";
        } else {
          pwd2Icon.setAttribute("src", "resources/img/pw-not-visible.svg");
          pwd2Icon.setAttribute("clicked", "true");
          adminPassword2.type = "text";
        }
      });
    });

</script>
</body>
</html>