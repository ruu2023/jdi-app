// サイドバー内のリンクをクリックしたときの処理
document.addEventListener("DOMContentLoaded", LinkClick);
document.addEventListener("turbo:load", LinkClick);

function LinkClick() {
  const mainChatTask = document.getElementById("main-chat__task");
  const mainChatArchive = document.getElementById("main-chat__archive");
  const archiveLink = document.getElementById("archive-link");
  const taskLink = document.getElementById("task-link");
  const modalMessage = document.getElementById("modalMessage");
  const modalDeleteTask = document.getElementById("modalDeleteTask");
  const modalDeleteArchive = document.getElementById("modalDeleteArchive");

  archiveLink.addEventListener("click", function (event) {
    // main_chat_task を非表示にし、main_chat_archive を表示する
    mainChatTask.style.display = "none";
    mainChatArchive.style.display = "block";
    modalDeleteTask.style.display = "none";
    modalDeleteArchive.style.display = "block";
    archiveLink.classList.add("active");
    taskLink.classList.remove("active");
    modalMessage.textContent = "archives";
  });

  taskLink.addEventListener("click", function (event) {
    // main_chat_task を表示し、main_chat_archive を非表示にする
    mainChatTask.style.display = "block";
    mainChatArchive.style.display = "none";
    modalDeleteArchive.style.display = "none";
    modalDeleteTask.style.display = "block";
    archiveLink.classList.remove("active");
    taskLink.classList.add("active");
    modalMessage.textContent = "tasks";
  });
}

// タスクをクリックしたときの処理
document.addEventListener("DOMContentLoaded", modalFunction);
document.addEventListener("turbo:load", modalFunction);

function modalFunction() {
  // 削除アラートModal
  const modalAlert = document.getElementById("modalAlert");
  const buttonClear = document.getElementById("buttonClear");
  const alertClose = document.getElementById("alertClose");
  buttonClear.addEventListener("click", modalClearOpen);
  function modalClearOpen() {
    modalAlert.style.display = "block";
  }
  // // バツ印がクリックされた時
  alertClose.addEventListener("click", modalAlertClose);
  function modalAlertClose() {
    modalAlert.style.display = "none";
  }
  // // モーダルコンテンツ以外がクリックされた時
  window.addEventListener("click", function (event) {
    // クリックされた要素がモーダル要素でない場合
    if (event.target == modalAlert) {
      // モーダルを非表示にする
      modalAlert.style.display = "none";
    }
  });

  // Modal
  const buttonsOpen = document.querySelectorAll(".main-chat__task-content");
  const modal = document.getElementById("easyModal");
  const buttonClose = document.getElementsByClassName("modalClose")[0];
  const modalTitle = document.getElementById("modal-title");
  const formEdit = document.getElementById("form-edit");
  const formDelete = document.getElementById("form-delete");
  const formEditInput = document.getElementById("form-edit__input");

  // ボタンがクリックされた時
  buttonsOpen.forEach(function (el) {
    el.addEventListener("click", modalOpen);
    function modalOpen() {
      modal.style.display = "block";
      modalTitle.textContent = this.textContent;
      const taskID = this.getAttribute("data-task");
      const taskContent = this.getAttribute("data-task__content");
      formEdit.action = `/tasks/${taskID}`;
      formDelete.action = `/tasks/${taskID}`;
      formEditInput.value = taskContent;
    }
  });

  // バツ印がクリックされた時
  buttonClose.addEventListener("click", modalClose);
  function modalClose() {
    modal.style.display = "none";
  }

  // モーダルコンテンツ以外がクリックされた時
  addEventListener("click", outsideClose);
  function outsideClose(e) {
    if (e.target == modal) {
      modal.style.display = "none";
    }
  }
}

// ハンバーガーをクリックしたときの処理
document.addEventListener("DOMContentLoaded", navFunction);
document.addEventListener("turbo:load", navFunction);

// nav-menu
function navFunction() {
  const hamburger = document.querySelector(".header__hamburger");
  const sideBar = document.querySelector(".side-bar");
  const screenMask = document.querySelector(".screen-mask");

  hamburger.addEventListener("click", function () {
    sideBar.classList.toggle("open"); // openクラスをトグルする
    screenMask.style.display = "block";
  });
  screenMask.addEventListener("click", function () {
    sideBar.classList.toggle("open"); // openクラスをトグルする
    this.style.display = "none";
  });
  sideBar.addEventListener("click", function () {
    this.classList.toggle("open"); // openクラスをトグルする
    screenMask.style.display = "none";
  });
}

//iphone対応
const setFillHeight = () => {
  const vh = window.innerHeight * 0.01; //ビューポートの高さを取得し、0.01を掛けて1%の値を算出して、vh単位の値を取得
  document.documentElement.style.setProperty("--vh", `${vh}px`); //カスタム変数--vhの値をドキュメントのルートに設定
};

window.addEventListener("resize", setFillHeight); //画面のサイズ変動があった時に高さを再計算

setFillHeight(); //初期化
