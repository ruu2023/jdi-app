// サイドバー内のリンクをクリックしたときの処理
document.addEventListener('DOMContentLoaded', LinkClick);
// サイドバー内のリンクをクリックしたときの処理
document.addEventListener('turbo:load', LinkClick);

function LinkClick() {
  const mainChatTask = document.getElementById('main-chat__task');
  const mainChatArchive = document.getElementById('main-chat__archive');
  const archiveLink = document.getElementById('archive-link');
  const taskLink = document.getElementById('task-link');

  archiveLink.addEventListener('click', function(event) {

    // main_chat_task を非表示にし、main_chat_archive を表示する
    mainChatTask.style.display = 'none';
    mainChatArchive.style.display = 'block';
    archiveLink.classList.add('active');
    taskLink.classList.remove('active');
  });

  taskLink.addEventListener('click', function(event) {

    // main_chat_task を表示し、main_chat_archive を非表示にする
    mainChatTask.style.display = 'block';
    mainChatArchive.style.display = 'none';
    archiveLink.classList.remove('active');
    taskLink.classList.add('active');
  });

  //form送信後の監視
  const form = document.getElementById('form');
  form.addEventListener('submit', function(event) {
    event.preventDefault(); // デフォルトのフォームのサブミットをキャンセル

    mainChatTask.style.display = 'block';
    mainChatArchive.style.display = 'none';

    form.submit();// フォームをサブミット
  });
}

document.addEventListener('DOMContentLoaded', modalFunction);
document.addEventListener('turbo:load', modalFunction);

function modalFunction() {
  // Modal
  const buttonsOpen = document.querySelectorAll('.main-chat__task-content');
  const modal = document.getElementById('easyModal');
  const buttonClose = document.getElementsByClassName('modalClose')[0];
  const modalTitle = document.getElementById('modal-title');
  const formEdit = document.getElementById('form-edit');
  
  // ボタンがクリックされた時
  buttonsOpen.forEach(function(el){
    el.addEventListener('click', modalOpen);
    function modalOpen() {
      modal.style.display = 'block';
      // const taskData = JSON.parse(el.dataset.task);
      modalTitle.textContent = this.textContent
      const taskID = this.getAttribute('data-task');
      formEdit.action = `/tasks/${taskID}`;
    }
  });
  
  // バツ印がクリックされた時
  buttonClose.addEventListener('click', modalClose);
  function modalClose() {
    modal.style.display = 'none';
  }
  
  // モーダルコンテンツ以外がクリックされた時
  addEventListener('click', outsideClose);
  function outsideClose(e) {
    if (e.target == modal) {
      modal.style.display = 'none';
    }
  }
}


document.addEventListener('DOMContentLoaded', navFunction);
document.addEventListener('turbo:load', navFunction);

// nav-menu
function navFunction() {
  const hamburger = document.querySelector('.header__hamburger');
  const sideBar = document.querySelector('.side-bar');
  const screenMask = document.querySelector('.screen-mask');
  
  hamburger.addEventListener('click', function() {
    sideBar.style.left = (sideBar.style.left === '0px') ? '-300px' : '0px';
    screenMask.style.display = 'block';
  });
  screenMask.addEventListener('click', function () {
    sideBar.style.left = (sideBar.style.left === '0px') ? '-300px' : '0px';
    this.style.display = 'none';
  });
  sideBar.addEventListener('click', function () {
    this.style.left = (sideBar.style.left === '0px') ? '-300px' : '0px';
    screenMask.style.display = 'none';
  });
}