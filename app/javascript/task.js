// サイドバー内のリンクをクリックしたときの処理
document.addEventListener('DOMContentLoaded', function() {
  const mainChatTask = document.getElementById('main-chat__task');
  const mainChatArchive = document.getElementById('main-chat__archive');
  const archiveLink = document.getElementById('archive-link');
  const taskLink = document.getElementById('task-link');

  archiveLink.addEventListener('click', function(event) {
    event.preventDefault(); // リンクのデフォルトの動作をキャンセル

    // main_chat_task を非表示にし、main_chat_archive を表示する
    mainChatTask.style.display = 'none';
    mainChatArchive.style.display = 'block';
  });

  taskLink.addEventListener('click', function(event) {
    event.preventDefault(); // リンクのデフォルトの動作をキャンセル

    // main_chat_task を非表示にし、main_chat_archive を表示する
    mainChatTask.style.display = 'block';
    mainChatArchive.style.display = 'none';
  });
});


  // app/assets/javascripts/tasks.js
  
  // document.addEventListener('turbolinks:load', function() {
  //   $('.archive-link').on('click', function(event) {
  //     event.preventDefault();
  //     var task_id = $(this).data('task-id');
  //     var folder_id = $(this).data('folder-id');
  
  //     $.ajax({
  //       url: '/folders/' + folder_id + '/tasks/' + task_id + '/archive',
  //       type: 'PATCH',
  //       success: function() {
  //         alert('Task archived successfully!');
  //       },
  //       error: function() {
  //         alert('Failed to archive task.');
  //       }
  //     });
  //   });
  // });
