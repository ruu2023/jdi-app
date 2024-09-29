import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  // static targets = ["source"];
  connect() {
    this.originalContent = this.element.innerHTML;
  }

  copy(event) {
    event.preventDefault();
    fetch("/tasks/response_data", {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    })
      .then((response) => response.json())
      .then((data) => {
        makeResData(data);
      })
      .catch((error) => {
        console.error("Error:", error);
      });

    const makeResData = (data) => {
      const today = new Date()
        .toLocaleDateString("ja-JP", {
          year: "numeric",
          month: "2-digit",
          day: "2-digit",
        })
        .replaceAll("/", "-");
      const taskHTML = data.tasks.join("\n");
      const archiveHTML = data.archives.join("\n");
      const resData =
        today +
        "\n" +
        "●できたこと\n" +
        archiveHTML +
        "\n●明日やること\n" +
        taskHTML;
      copyClipBoard(resData);
    };

    const copyClipBoard = (targetValue) => {
      if (navigator.clipboard) {
        navigator.clipboard
          .writeText(targetValue)
          .then(() => {
            this.element.textContent = "copied";
            setTimeout(() => {
              this.element.innerHTML = this.originalContent;
            }, 5000);
          })
          .catch((err) => {
            console.error("Error:", err);
            alert("failed to copy. try again please.");
          });
      } else {
        console.warn("Clipboard API is not supported.");
        fallbackCopyText(targetValue);
      }
    };
    const fallbackCopyText = (text) => {
      // iOSの互換性のためのフォールバック
      const textarea = document.createElement("textarea");
      textarea.value = text;
      textarea.style.position = "fixed"; // textareaが画面に表示されないように
      document.body.appendChild(textarea);
      textarea.select();
      try {
        document.execCommand("copy");
        alert("Successfully copied");
      } catch (err) {
        console.error("Error:", err);
        alert("failed to copy");
      }
      document.body.removeChild(textarea);
    };
  }
}
